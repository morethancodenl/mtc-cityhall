class Locale {
    constructor(strings) {
        this.update(strings);
    }

    update(strings) {
        this.strings = strings;
        this.setUI();
    }


    get(key) {
        return this.strings[key];
    }

    setUI() {
        for (const key in this.strings) {
            let element = document.getElementById(key)
            if(!element) continue;
            element.innerHTML = this.get(key);
        }
    }
}

let stringsEN = {
    "text_jobs": "Jobs and Income",
    "text_items": "Online desk",
    "text_information": "My info",
    "text_close": "Close",

    "text_identification": "ID Cards",
    "desc_identification": "Below you can see which ID cards you currently have in your pockets.",

    "text_licenses": "Permissions",
    "desc_licenses": "Below you can see which ID cards you currently have access to print.",

    "text_buy": "Buy",
    "text_apply": "Apply",

    "text_cost": "Cost: € ",
    "text_salary": "Salary: € ",
}


const locale = new Locale(stringsEN);