// Made by: More Then Code

// Is the display shown or hidden?
const displays = {
    hide: 'none',
    show: 'block'
}

/**
 * NUI callback
 * @param {string} event the event to callback on 
 * @param {object} data the data to return to the game
 */
const NuiCallback = (event, data) => {
    fetch(`https://${GetParentResourceName()}/${event}`, {
    method: 'POST',
    headers: {
        'Content-Type': 'application/json; charset=UTF-8',
    },
    body: JSON.stringify(data)
}).then(resp => logs.Log(resp));

}

/**
 * @class Logger
 * @description Class for logging messages to the console.
 * @param {boolean} active - Whether or not the logger should log messages.
 */
class Logger {
    constructor(active = false) {
        this.active = active;
    }

    /**
     * Log a message to the console.
     * @param {string} message the message to log 
     */
    Log(message) {
        if (this.active) {
            let date = new Date();
            let time = date.getHours() + ':' + date.getMinutes() + ':' + date.getSeconds();
            console.log('[' + time + '] ' + message);
        }
    }

    /**
     * Set the logger active or inactive.
     * @param {boolean} active is the logger active 
     */
    SetActive(active) {
        this.active = active;
    }
}

/**
 * @class UIElement
 * @description Class for handling UI elements.
 */
class UIElement {
    /**
     * Show the UI element.
     */
    Show() {
        logs.Log("Showing " + this.id + "...")

        document.getElementById(this.id).style.display = displays.show;
    }

    /**
     * Hide the UI element.
     */
    Hide() {
        logs.Log("Hiding " + this.id + "...")

        document.getElementById(this.id).style.display = displays.hide;
    }
}

/**
 * @class Main
 * @description Class for handling the main UI.
 */
class Main {
    constructor(id = 'mtcCityhall') {
        this.id = id;
        this.HideCityhall();
        information.ClearInformation()
        this.SetupButtons();
    }

    /**
     * Show the cityhall UI with the default job options.
     */
    ShowCityhall() {

        logs.Log('Showing cityhall...')

        job.Show();

        document.getElementById(this.id).style.display = displays.show;
    }

    /**
     * Hide the cityhall UI. Will also hide all other UI elements.
     */

    HideCityhall() {
        logs.Log('Hiding cityhall...')

        this.HideOptions();

        document.getElementById(this.id).style.display = displays.hide;

        NuiCallback('close', {});
    }

    /**
     * Set the chardata for the UI.
     */
    SetData({ name, citizenid, image }) {
        document.getElementById('charName').innerHTML = name;
        document.getElementById('charCitizenID').innerHTML = citizenid;
        document.getElementById('charImage').src = image ? image : 'https://images.unsplash.com/photo-1510227272981-87123e259b17?ixlib=rb-0.3.5&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&s=3759e09a5b9fbe53088b23c615b6312e';
    }

    /**
     * Hide all other UI elements.
     */
    HideOptions() {
        job.Hide();
        identity.Hide();
        information.Hide();
    }

    /**
     * Setup the buttons for the sidebar.
     */
    SetupButtons() {
        logs.Log('Setting up buttons...')

        document.getElementById('Sidebar.job').onclick = () => {
            this.HideOptions();
            job.Show();
        }

        document.getElementById('Sidebar.identity').onclick = () => {
            this.HideOptions();
            identity.Show();
        }

        document.getElementById('Sidebar.information').onclick = () => {
            this.HideOptions();
            information.Show();
        }

        document.getElementById('Sidebar.close').onclick = () => {
            this.HideCityhall();
        }
        
        document.onkeyup = (data) => {
            if (data.which == 27) {
                this.HideCityhall();
            }
        }
    }
}

/**
 * @class Jobs
 * @description Class for handling the jobs UI.
 */
class Jobs extends UIElement {
    constructor(id = 'selectJob') {
        super();
        this.id = id;
        this.Hide()
    }
    /**
     * Add job button
     */
    AddJob({ name, salary, id }) {
        logs.Log('Adding job: ' + name + ' with salary: ' + salary);

        let div = document.createElement('div');
        div.classList.add('col-6');

        let mtcContent = document.createElement('div');
        mtcContent.classList.add('mtc-content');

        let mtcContentInline = document.createElement('div');
        mtcContentInline.classList.add('mtc-content-inline');

        let ul = document.createElement('ul');

        let li1 = document.createElement('li');
        li1.innerHTML = name;

        let li2 = document.createElement('li');
        li2.innerHTML = locale.get('text_salary') + salary;

        let li3 = document.createElement('li');

        let div3 = document.createElement('div');
        div3.classList.add('d-grid', 'gap-2');

        let button = document.createElement('button');
        button.classList.add('btn', 'btn-secondary', 'btn-sm');
        button.setAttribute('type', 'button');
        button.innerHTML = locale.get('text_apply');

        button.onclick = () => {
            logs.Log('Applying for job: ' + name);
            NuiCallback('ApplyJob', {
                id: id
            })
        }

        div3.appendChild(button);
        li3.appendChild(div3);

        ul.appendChild(li1);
        ul.appendChild(li2);
        ul.appendChild(li3);

        mtcContentInline.appendChild(ul);

        mtcContent.appendChild(mtcContentInline);

        div.appendChild(mtcContent);
        document.getElementById('JobOptions').appendChild(div);
    }

    /**
     * Clear all job buttons.
     */
    ClearJobs() {
        logs.Log('Clearing jobs...')

        document.getElementById('JobOptions').innerHTML = '';
    }
}

/**
 * @class Identity
 * @description Class for handling the identity UI.
 */
class Identity extends UIElement {
    constructor(id = 'selectIdentity') {
        super();
        this.id = id;
        this.Hide();
    }

    /**
     * Add identity button 
     */
    AddButton({ name, price, id }) {
        logs.Log('Adding button: ' + name + ' with price: ' + price);

        let div = document.createElement('div');
        div.classList.add('col-6');

        let mtcContent = document.createElement('div');
        mtcContent.classList.add('mtc-content');

        let mtcContentInline = document.createElement('div');
        mtcContentInline.classList.add('mtc-content-inline');

        let ul = document.createElement('ul');

        let li1 = document.createElement('li');
        li1.innerHTML = name;

        let li2 = document.createElement('li');
        li2.innerHTML = locale.get('text_cost') + price;

        let li3 = document.createElement('li');

        let div3 = document.createElement('div');
        div3.classList.add('d-grid', 'gap-2');

        let button = document.createElement('button');
        button.classList.add('btn', 'btn-secondary', 'btn-sm');
        button.setAttribute('type', 'button');
        button.innerHTML = locale.get("text_buy");

        button.onclick = () => {
            logs.Log('Buying identity: ' + id);
            NuiCallback('BuyIdentity', {
                id: id
            })
        }

        div3.appendChild(button);
        li3.appendChild(div3);

        ul.appendChild(li1);
        ul.appendChild(li2);
        ul.appendChild(li3);

        mtcContentInline.appendChild(ul);

        mtcContent.appendChild(mtcContentInline);

        div.appendChild(mtcContent);
        document.getElementById('IdentityOptions').appendChild(div);
    }

    ClearIdentity() {
        logs.Log('Clearing identities...')

        document.getElementById('IdentityOptions').innerHTML = '';
    }
}

/**
 * @class Information
 * @description Class for handling the information UI.
 */
class Information extends UIElement {
    constructor(id = 'selectInformation') {
        super();
        this.id = id;
        this.Hide();
    }

    /**
     * Add an item the player has or might not have. 
     */
    AddItem({ item, hasItem }) {
        logs.Log('Adding item: ' + item + ' with hasItem: ' + hasItem);

        let span = document.createElement('span');
        span.classList.add('badge', hasItem ? 'bg-success' : 'bg-danger');
        span.innerHTML = item;

        document.getElementById('information.Items').appendChild(span);
    }

    /**
     * Add a license the player has or might not have. 
     */
    AddLicense({ license, hasLicense }) {
        logs.Log('Adding license: ' + license + ' with hasLicense: ' + hasLicense);

        let span = document.createElement('span');
        span.classList.add('badge', hasLicense ? 'bg-success' : 'bg-danger');
        span.innerHTML = license;

        document.getElementById('information.Licenses').appendChild(span);
    }

    /**
     * Clear the information
     */
    ClearInformation() {
        logs.Log('Clearing information...')

        document.getElementById('information.Items').innerHTML = '';
        document.getElementById('information.Licenses').innerHTML = '';
    }
}

let logs = new Logger(false)

let job = new Jobs();
let identity = new Identity();
let information = new Information();

let main = new Main();
