SVGInject.setOptions({ onFail: (img, status) => console.log(img, status) });

function calculateEquivalence(number, max) {
    const result = (number / 100) * max;
    return result;
};

const velocimeterBar = new ldBar("#kmVelocimeter", { "value": 0 });
const fuelBar = new ldBar("#fuelContainer", { "value": 0 });
const nosBar = new ldBar("#nosValue", { "value": 0 });

function zeros(value) {
    return value > 99 ? '' : value > 9 ? '0' : '00';
};

function setRpm(rpm) {
    const kmCalc = Math.round(((50 * rpm) / 100) / 5);
    velocimeterBar.set(kmCalc <= 50 ? kmCalc : 50);

    rpm = rpm * 2

    try {
        const points = [...document.querySelectorAll("#velocimeterBg>path")].reverse();
        if (!points) throw new Error("Points not found");
        const pointsCalc = Math.round((points.length * (rpm)) / 500);
        for (let i = 0; i < points.length; i++) {
            const element = points[i];
            const elementIsGrandBox = element.classList.contains("grandBox");
            if (!elementIsGrandBox) {
                const attr = {
                    stroke: pointsCalc > i ? "#fff" : "rgba(39, 39, 39, 83%)"
                };

                element.attrs(attr)
            };

        };
    } catch (error) {
        console.log(error)
    }
};

function setKm(km) {


    const kmTextElement = document.getElementById("kmValue");
    if (!kmTextElement) return;

    kmTextElement.innerHTML = `<span>${zeros(~~km)}</span>${~~km}`;
};

function setCircleValue(element, maxValue = 440, value, maxPercentage = 100) {
    if (value > maxPercentage) value = maxPercentage;

    if (!element) return;
    const calc = ~~(maxValue - value);

    element.style.strokeDashoffset = calc;
};

const types = {
    userId:"number",
    hudIsActive: "boolean",
    location: "string",
    crossing: "string",
    bullets: "string",
    mhz: "string",
    hour: "string",
    talkIsActive: "string",
    isTalking: "boolean",
    hunger: "number",
    thirst: "number",
    heart: "number",
    armour: "number",
    stress: "number",
    inVehicle: "boolean",
    km: "number",
    rpm: "number",
    engine: "number",
    gas: "number",
    isSeatBelt: "boolean",
    isLock: "boolean",
    fuel: "number",
    nosValue: "number",
    starIsActive: "boolean",
    stars:"number",
};

window.addEventListener("message", ({ data = {} }) => {
    if (!data || JSON.stringify(data) === "{}") return;
    const mainValues = ["hunger", "thirst", "heart", "armour", "stress", "engine"];


    Object.keys(data).forEach(key => {
        const identifierElement = document.getElementById(`value_${key}`);

        if (identifierElement) {
            identifierElement.textContent = data[key];
        };

        if (types[key] && typeof data[key] !== types[key]) {
            delete data[key];
        };

        mainValues.forEach((k) => {
            if (k !== key || data[key] === undefined) return;

            const element = document.getElementById(`${key}Value`);
            if (!element) return;

            if (element.tagName === "DIV" && !!element.children) {
                element.querySelector("span").style.width = `${~~(data.engine / 10)}%`;
                return;
            };

            const divParent = element.parentElement.parentElement;

            if (key === mainValues[3] && divParent.tagName === "DIV") {
                divParent.style.display = !!data[key] ? "flex" : "none";
            };

            setCircleValue(element, 440, data[key]);
        });
    });

    const main = document.querySelector("main");
    if (main && typeof data.hudIsActive === types.hudIsActive) {
        main.style.visibility = data.hudIsActive ? "visible" : "hidden";
    };

    const micParent = document.getElementById("playerMic");
    if (micParent && typeof data.talkIsActive === types.talkIsActive) {
        micParent.innerHTML = data.talkIsActive;
    };

    const micIcon = document.querySelector(".micIcon");
    if (micIcon && typeof data.isTalking === types.isTalking) {
        micIcon.querySelectorAll("svg path").forEach(path => {
            path.setAttribute("fill", data.isTalking ? "#00ff00" : "#FFF");
        });
    };

    const vehicleContainer = document.getElementById("vehicleContainer");
    if (vehicleContainer && typeof data.inVehicle === types.inVehicle) {
        vehicleContainer.style.opacity = data.inVehicle ? "1" : "0";
    };

    if (typeof data.km === types.km) {
        setKm(data.km, data.rpm);
    };

    if (typeof data.rpm === types.rpm) {
        setRpm(data.rpm);
    };

    const rows = [["isSeatBelt", "SeatBelt"], ["isLock", "lockIcon"], ["engine", "engineCar"]];
    rows.forEach(row => {
        const element = document.getElementById(row[1]);

        if (!typeof data[row[0]] === types[row[0]]) {
            delete data[key];
        };

        if (data[row[0]] !== undefined) {
            if (!element) return delete data[row[0]];
            element.classList[data[row[0]] ? "add" : "remove"]("active");

            if (row[0] !== "engine") return;
            element.classList.add("active");
            

            ["green", "yellow", "red"].forEach((color) => element.classList.remove(color));
            element.classList.add(data.engine >= 66 ? "green" : data.engine >= 33 ? "yellow" : "red");
        };
    });

    const fuel = document.getElementById("fuelContainer");
    if (fuel && typeof data.fuel === types.fuel) {
        fuelBar.set(data.fuel >= 100 ? 100 : data.fuel)
    };

    const nosElement = document.getElementById("nosValue");
    if (nosElement && typeof data.nosValue === types.nosValue) {
        nosBar.set(100 - data.nosValue)
    };

    const starsContainer = document.querySelector(".stars");
    if (starsContainer && typeof data.starIsActive === types.starIsActive) {
        [...starsContainer.querySelectorAll("svg")]
            .reverse()
            .forEach((svg, index) => {
                const newAttributes = {
                    fill: (index + 1) <= data.stars ? "#F9B139" : "#727070",
                    "fill-opacity": (index + 1) <= data.stars ? "1" : "0.29",
                };
                svg.querySelector("path").attrs(newAttributes)
            });
            starsContainer.style.visibility = data.starIsActive ? "visible" : "hidden";
    };

    const bulletsContainer = document.querySelector(".bullets");
    if (bulletsContainer && typeof data.bullets === types.bullets) {
        bulletsContainer.style.display = data.bulletsIsActive ? "flex" : "none";
    };
});


// var bar = new ldBar(".myBar", {
//     "stroke": '#f00',
//     "stroke-width": 10,
//     "preset": "fan",
//     "value": 65
// });

// bar.set(
//     50,     /* target value. */
//     false   /* enable animation. default is true */
// );
