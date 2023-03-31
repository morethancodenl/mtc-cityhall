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

    "text_identification": "Identification",
    "desc_identification": "Below you can see which identification methods you currently have.",

    "text_licenses": "Licenses",
    "desc_licenses": "Below you can see which licenses you currently have.",

    "text_buy": "Buy",
    "text_apply": "Apply",

    "text_cost": "Cost: € ",
    "text_salary": "Salary: € ",
}


const locale = new Locale(stringsEN);