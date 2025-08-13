// START MOCK DATA

var crimesList = [];
var timeReductionList = [];
var vehicleStatusList = [];
var vehicleImageURL;
var myInfos = [];

function getConfigVariables() {
  $.post("http://will_ficha_v3/gettingConfig", JSON.stringify({}), (data) => {
    crimesList = data.crimesList;
    timeReductionList = data.reductionList;
    vehicleStatusList = data.vehicleStateList;
    vehicleImageURL = data.vehicleImageURL;
  });
}

// END MOCK DATA

$(function () {
  window.addEventListener("message", function (event) {
    namePolicia = event.data.polName;
    switch (event.data.action) {
      case "showMenu":
        $("#police-tablet").show();
        getUserInformation();
        break;
      case "hideMenu":
        $("#police-tablet").hide();
        break;
    }
  });

  document.onkeyup = function (data) {
    if (data.which == 27) {
      closeTablet();
      $.post(
        "http://will_ficha_v3/fichaClose",
        JSON.stringify({}),
        function () {}
      );
    }
  };
});

// CONSTANTES

var currentScreen = "main-screen";
var currentPerson = [];
var currentVehicle = null;
var selectedCrimes = [];

const loginScreen = document.getElementById("login");
const loggedScreen = document.getElementById("logged");
const mainScreen = document.getElementById("main-screen");
const databaseScreen = document.getElementById("database");
const prisonScreen = document.getElementById("prison-screen");
const navBarScreen = document.getElementById("nav-bar");
const navBarOverlay = document.getElementById("nav-bar-overlay");

const dataInformation = document.getElementById("data-information");

const personSearch = document.getElementById("person-search");

const screenTitle = document.getElementById("screen-title");
const noResultsMsg = document.getElementById("no-results-msg");
const dbStatusTop = document.getElementById("db-status-top");
const dbStatusBottom = document.getElementById("db-status-bottom");
const serviceTotal = document.getElementById("service-total");
const taxTotal = document.getElementById("tax-total");

const takePhotoButton = document.getElementById("take-photo");
const addOfficerButton = document.getElementById("add-officer-button");
const upgradeOfficerButton = document.getElementById("upgrade-officer-button");
const downgradeOfficerButton = document.getElementById(
  "downgrade-officer-button"
);
const kickOfficerButton = document.getElementById("kick-officer-button");

const vehicleTab = document.getElementById("vehicles-tab");
const criminalTab = document.getElementById("criminal-tab");

const dbSearchInput = document.getElementById("db-search");
const irTitleInput = document.getElementById("ir-details-title-input");
const irDetaislInput = document.getElementById("ir-details-content-input");
const prisonDetaislInput = document.getElementById(
  "prison-details-content-input"
);
const timeReductionSelect = document.getElementById("time-reduction-select");

const dbInformation = document.getElementById("db-information");
const dbNoResults = document.getElementById("db-no-results");
const criminalProfile = document.getElementById("criminal-profile");
const wantedListWrap = document.getElementById("wanted-list");
const officersListWrap = document.getElementById("officers-list");
const crimesProfile = document.getElementById("crimes-profile");
const irDetailsForm = document.getElementById("ir-details-form");
const vehiclesWrap = document.getElementById("vehicles-wrap");
const vehicleTabContent = document.getElementById("vehicles-list-wrap");
const criminalTabContent = document.getElementById("criminal-content");
const wantedContent = document.getElementById("wanted-content");
const wantedBorder = document.getElementById("wanted-border");
const officersBorder = document.getElementById("officers-border");
const officersContent = document.getElementById("officers-content");
const dbInformationTitleContent = document.getElementById(
  "data-information-title-content"
);
const crimesContentList = document.getElementById("crimes-list");
const crimesSelectList = document.getElementById("crimes-select-list");

const dbInformationName = document.getElementById("data-information-name");
const dbInformationId = document.getElementById("data-information-id");
const dbInformationRg = document.getElementById("data-information-rg");
const dbInformationAge = document.getElementById("data-information-age");
const dbInformationPhone = document.getElementById("data-information-phone");
const dbInformationPorte = document.getElementById("data-information-porte");
const dbInformationTax = document.getElementById("data-information-tax");
const dbInformationTitle = document.getElementById("data-information-title");
const dbInformationPhoto = document.getElementById("photo");
const userNameLabel = document.getElementById("user-name");
const userIdLabel = document.getElementById("user-id");
const userRgLabel = document.getElementById("user-rg");
const userTitleLabel = document.getElementById("user-title");
const userAvatar = document.getElementById("user-avatar");

const vehInformationName = document.getElementById("veh-information-name");
const vehInformationPlate = document.getElementById("veh-information-plate");
const vehInformationStatus = document.getElementById("veh-information-status");
const vehInformationPhoto = document.getElementById("veh-information-photo");

const modal = document.getElementById("modal");
const modalBody = document.getElementById("modal-body");
const modalTitle = document.getElementById("modal-title");

const prisonAppButton = document.getElementById("prison-app-button");
const wantedAppButton = document.getElementById("set-wanted-app-button");
const porteAppButton = document.getElementById("porte-app-button");
const wantedButtonLabel = document.getElementById("wanted-button-label");
const registerIRButton = document.getElementById("ir-register-button");
const loginFoorm = document.getElementById("login-form");
const resetPasswordForm = document.getElementById("reset-password-form");
const usernameInput = document.getElementById("login-user");
const newUsernameInput = document.getElementById("new-username");
const passwordInput = document.getElementById("login-password");
const newPasswordInput = document.getElementById("new-password");
const confirmNewPasswordInput = document.getElementById("confirm-new-password");
const porteButtonLabel = document.getElementById("porte-button-label");

function initEvents() {
  dbSearchInput.addEventListener("keyup", function (event) {
    // Number 13 is the "Enter" key on the keyboard
    if (event.keyCode === 13) {
      if (currentScreen === "vehicles") {
        searchVehicles(dbSearchInput.value);
        return;
      }
      searchPerson(dbSearchInput.value);
    }
  });

  timeReductionSelect.addEventListener("change", () => {
    renderSelectCrimes();
  });

  vehInformationStatus.addEventListener("click", () => {
    openModal("vehicle-status");
  });

  getUserInformation();
  getConfigVariables();
}

function getUserInformation() {
  $.post("http://will_ficha_v3/infoUser", JSON.stringify({}), (data) => {
    myInfos = data.infos;
    userNameLabel.innerHTML = myInfos.name;
    userIdLabel.innerHTML = myInfos.id;
    userRgLabel.innerHTML = myInfos.rg;
    userTitleLabel.innerHTML = myInfos.title;
    userAvatar.style.background = `url(${myInfos.photo}) no-repeat`;
    userAvatar.style.backgroundSize = "cover";
  });
}

function login() {
  let user = document.getElementById("login-user");
  let password = document.getElementById("login-password");
  if (
    myInfos.login &&
    myInfos.login["login"] &&
    myInfos.login["login"].toUpperCase() == user.value.toUpperCase() &&
    myInfos.login["password"].toUpperCase() == password.value.toUpperCase()
  ) {
    loginScreen.style.display = "none";
    loggedScreen.style.display = "flex";
    mainScreen.style.display = "flex";
    return;
  }
  console.log("Usuario ou senha incorretos", myInfos.login);
  notification("Usuario ou senha incorretos", "rgba(255, 0, 0, 0.5)");
  loginScreen.style.display = "flex";
  loggedScreen.style.display = "none";
  mainScreen.style.display = "none";
}

function toggleLoginScreen(showLogin) {
  if (showLogin) {
    loginFoorm.style.display = "block";
    resetPasswordForm.style.display = "none";
  } else {
    loginFoorm.style.display = "none";
    resetPasswordForm.style.display = "block";
  }
}

// Reset password
function resetPassword() {
  if (
    !newPasswordInput.value ||
    !confirmNewPasswordInput.value ||
    !newUsernameInput.value
  ) {
    notification(
      "Preencha todos os campos para continuar.",
      "rgba(255, 0, 0, 0.5)"
    );
    return;
  }

  if (newPasswordInput.value === confirmNewPasswordInput.value) {
    let newUsername = newUsernameInput.value;
    let newPassword = newPasswordInput.value;
    $.post(
      "http://will_ficha_v3/setNewLogin",
      JSON.stringify({ newUsername, newPassword }),
      function () {}
    );
    getUserInformation();
    toggleLoginScreen(true);
    return;
  }
  notification("As senhas não coincidem!", "rgba(255, 0, 0, 0.5)");
}

function closeTablet() {
  $.post("http://will_ficha_v3/fichaClose", JSON.stringify({}), function () {});
  document.getElementById("police-tablet").style.display = "none";
}

function backScreen(screen) {
  if (currentScreen === "prison") {
    openScreen("database", "BANCO DE INFORMAÇÕES");
    searchPerson(currentPerson.id);
    return;
  }

  currentScreen = "main-screen";
  document.getElementById(screen).style.display = "none";
  mainScreen.style.display = "flex";
  dbNoResults.style.display = "none";
  dbInformation.style.display = "none";
  criminalProfile.style.display = "none";
  dbInformation.style.display = "none";
  prisonAppButton.style.display = "none";
  wantedAppButton.style.display = "none";
  porteAppButton.style.display = "none";
  irDetailsForm.style.display = "none";
  vehiclesWrap.style.display = "none";
  wantedListWrap.style.display = "none";
  officersListWrap.style.display = "none";
  addOfficerButton.style.display = "none";
  upgradeOfficerButton.style.display = "none";
  downgradeOfficerButton.style.display = "none";
  kickOfficerButton.style.display = "none";
  prisonScreen.style.display = "none";
  dbSearchInput.value = "";
  irDetaislInput.value = "";
  irTitleInput.value = "";
  vehicleTab.classList.remove("tab-active");
  vehicleTab.classList.add("tab-deactive");
  vehicleTab.onclick = changeDbTab;
  vehicleTabContent.style.display = "none";
  criminalTab.classList.remove("tab-deactive");
  criminalTab.classList.add("tab-active");
  criminalTab.onclick = null;
  criminalTabContent.style.display = "flex";
  dbInformationTitleContent.style.display = "none";
  dataInformation.style.lineHeight = "32px";
  irTitleInput.disabled = false;
  irDetaislInput.disabled = false;
}

function openScreen(screen, title) {
  currentScreen = screen;

  if (currentScreen === "incident-report") {
    openModal("ir-decide");

    return;
  }

  mainScreen.style.display = "none";
  prisonScreen.style.display = "none";
  modal.style.display = "none";
  screenTitle.innerText = title;

  if (
    currentScreen === "database" ||
    currentScreen === "incident-report-new" ||
    currentScreen === "incident-report-view" ||
    currentScreen === "vehicles" ||
    currentScreen === "wanted" ||
    currentScreen === "management"
  ) {
    takePhotoButton.style.display = "block";
    personSearch.style.display = "block";
    dbSearchInput.placeholder = "Passaporte...";
    databaseScreen.style.display = "flex";
    noResultsMsg.innerText = "Habitante não encontrado.";
    vehicleTab.onclick = changeDbTab;
  }
  if (currentScreen === "vehicles") {
    takePhotoButton.style.display = "none";
    dbSearchInput.placeholder = "Placa...";
    noResultsMsg.innerText = "Veículo não encontrado.";
  }
  if (currentScreen === "wanted") {
    wantedListWrap.style.display = "flex";
    wantedBorder.style.height = "460px";
    getWantedList();
  }
  if (currentScreen === "management") {
    officersListWrap.style.display = "flex";
    officersBorder.style.height = "460px";
    getOfficersList();
  }
  if (currentScreen === "prison") {
    takePhotoButton.style.display = "none";
    dbInformation.style.display = "none";
    criminalProfile.style.display = "none";
    personSearch.style.display = "none";
    prisonScreen.style.display = "flex";
    crimesContentList.innerHTML = "";
    prisonDetaislInput.value = "";
    selectedCrimes = [];
    timeReductionSelect.value = 0;

    renderPrisonScreen();
  }
}

function searchPerson(id) {
  dbNoResults.style.display = "none";
  dbInformation.style.display = "none";
  criminalProfile.style.display = "none";
  irDetailsForm.style.display = "none";
  wantedAppButton.style.display = "none";
  prisonAppButton.style.display = "none";
  porteAppButton.style.display = "none";

  if (id > 0) {
    setPersonInformation(id);
    searchAllVehicles(id);

    if (currentPerson.criminalList) {
      setTimeout(() => {
        if (currentPerson.criminalList.length) {
          currentPerson.criminalList.forEach((criminal) => {
            criminalTabContent.innerHTML += `<div class="criminal-item">${criminal.name}<button onClick="clearArrest('${currentPerson.id}', '${criminal.id}')">x</button></div>`;
          });
        }
      }, 1000);
    }

    if (currentScreen === "database") {
      if (currentPerson.status !== "detido") {
        prisonAppButton.style.display = "flex";
      }
      criminalProfile.style.display = "flex";
      criminalTabContent.innerHTML = "";

      return;
    }
    if (currentScreen === "incident-report-new") {
      irDetailsForm.style.display = "flex";
      registerIRButton.style.display = "flex";

      return;
    }
    if (currentScreen === "incident-report-view") {
      getReportView(id);
      return;
    }
    if (currentScreen === "vehicles") {
      searchAllVehicles(id);
      return;
    }
    if (currentScreen === "wanted") {
      wantedBorder.style.height = "200px";

      return;
    }
    if (currentScreen === "management") {
      officersBorder.style.height = "200px";

      return;
    }
  }

  dbNoResults.style.display = "flex";
  dbNoResults.style.display = "flex";
}

function clearArrest(user, id) {
  $.post(
    "http://will_ficha_v3/clearArrest",
    JSON.stringify({ user, id }),
    (data) => {
      if (data.data) {
        searchPerson(currentPerson.id);
      }
    }
  );
}

function getReportView(id) {
  $.post(
    "http://will_ficha_v3/getReportByid",
    JSON.stringify({ id }),
    (data) => {
      let report = data.reports;
      irDetailsForm.style.display = "flex";
      registerIRButton.style.display = "none";
      takePhotoButton.style.display = "none";
      irTitleInput.disabled = true;
      irDetaislInput.disabled = true;
      irTitleInput.value = report.title;
      irDetaislInput.value = report.report;
    }
  );
}

function searchVehicles(plate) {
  $.post(
    "http://will_ficha_v3/vehicleResult",
    JSON.stringify({ plate }),
    (data) => {
      dbNoResults.style.display = "none";
      dbInformation.style.display = "none";
      vehiclesWrap.style.display = "none";

      const vehicles = data.vehInfos;
      if (vehicles.length > 0) {
        vehicles.forEach((vehicle) => {
          if (vehicle) {
            currentVehicle = vehicle;

            dbInformation.style.display = "flex";
            vehiclesWrap.style.display = "flex";

            vehInformationName.innerText = vehicle.name;
            vehInformationPlate.innerText = vehicle.plate;
            vehInformationStatus.innerText = vehicle.status;
            vehInformationPhoto.src = vehicleImageURL + vehicle.spawn + ".png";
            vehInformationStatus.style.color = getVehStatusColor(
              vehicle.status
            );
            searchPerson(vehicle.ownerId);
            return;
          }
        });
      } else {
        dbNoResults.style.display = "flex";
      }
    }
  );
}

function searchAllVehicles(id) {
  vehicleTabContent.innerHTML = "";
  let plate = id;
  $.post(
    "http://will_ficha_v3/vehicleResult",
    JSON.stringify({ plate }),
    (data) => {
      const dbVehicles = data.vehInfos;
      if (dbVehicles.length > 0) {
        dbVehicles.forEach((vehicle) => {
          const vehicleCard = document.createElement("div");
          const vehObj = JSON.stringify(vehicle).replaceAll('"', "'");
          vehicleCard.id = vehicle.spawn;
          vehicleCard.classList.add("row");
          vehicleCard.classList.add("vehicle-item");
          vehicleCard.innerHTML = `
											<div class="row">
												<div class="col veh-col db-veh-img">
													<img id="db-veh-information-photo" src="${vehicleImageURL}${
            vehicle.spawn
          }.png"/><br/>
												</div>
												<div class="col veh-col">
													<div id="${vehicle.spawn}-informations" class="db-veh-information">
														NOME: <span style="color: #000">${vehicle.name}</span><br/>
														PLACA: <span style="color: #000">${vehicle.plate}</span><br/>
														STATUS: 
														<span 
															onclick="openModal('vehicle-status', ${vehObj})"
															id="${vehicle.spawn}-status"
															class="veh-status" 
															style="color: ${getVehStatusColor(vehicle.status)}"
														>
															${vehicle.status}
														</span><br/>
													</div>
												</div>
											</div>
										`;
          vehicleTabContent.appendChild(vehicleCard);
        });

        return;
      } else {
        const vehicleCard = document.createElement("div");
        vehicleCard.innerHTML = `<div class="no-has-veh">Não possui veículos cadastrados.</div>`;
        vehicleTabContent.appendChild(vehicleCard);
      }
    }
  );
}

function changeVehicleStatus(vehObj) {
  closeModal();

  const vehStatusIndex = vehicleStatusList.findIndex(
    (status) => status.toLowerCase() === currentVehicle.status.toLowerCase()
  );
  const newVehStatus =
    vehStatusIndex < vehicleStatusList.length - 1
      ? vehicleStatusList[vehStatusIndex + 1]
      : vehicleStatusList[0];

  let vehElement = vehObj
    ? document.getElementById(currentVehicle.spawn + "-status")
    : document.getElementById("veh-information-status");
  vehElement.style.color = getVehStatusColor(newVehStatus);
  vehElement.innerText = newVehStatus.toUpperCase();
  currentVehicle.status = newVehStatus;
  $.post(
    "http://will_ficha_v3/changeVehStatus",
    JSON.stringify({ currentVehicle, newVehStatus }),
    function () {}
  );

  saveVehicleStatus(true);
}

function saveVehicleStatus(needUpdate) {
  if (currentVehicle.spawn && currentVehicle.ownerId) {
    if (needUpdate) {
      let vehObj = JSON.stringify(currentVehicle).replaceAll('"', "'");

      document.getElementById(
        currentVehicle.spawn + "-informations"
      ).innerHTML = `
					NOME: <span style="color: #000">${currentVehicle.name}</span><br/>
					PLACA: <span style="color: #000">${currentVehicle.plate}</span><br/>
					STATUS: 
					<span 
						onclick="openModal('vehicle-status', ${vehObj})"
						id="${currentVehicle.spawn}-status"
						class="veh-status" 
						style="color: ${getVehStatusColor(currentVehicle.status)}"
					>
						${currentVehicle.status}
					</span><br/>
				`;
    }
    return;
  }
}

function setPersonStatus(status) {
  dbStatusTop.innerText = status.toUpperCase();
  dbStatusBottom.innerText = status.toUpperCase();
  dbStatusTop.style.display = "none";
  dbStatusBottom.style.display = "none";
  if (status.toUpperCase() === "PROCURADO") {
    dbStatusTop.style.display = "block";
    dbStatusBottom.style.display = "block";
    dbStatusTop.style.backgroundColor = "#921a1a";
    dbStatusBottom.style.backgroundColor = "#921a1a";
    dbStatusBottom.style.fontSize = "16px";
    return;
  }
  if (status.toUpperCase() === "DETIDO") {
    dbStatusTop.style.display = "block";
    dbStatusBottom.style.display = "block";
    dbStatusTop.style.backgroundColor = "rgb(255 165 0)";
    dbStatusBottom.style.backgroundColor = "rgb(255 165 0)";
    dbStatusBottom.style.fontSize = "20px";
    return;
  }

  return;
}

function getVehStatusColor(status) {
  if (status.toUpperCase() === "ROUBADO") {
    return "#921a1a";
  }
  if (status.toUpperCase() === "DETIDO") {
    return "rgb(255 165 0)";
  }

  return "rgb(26 146 41)";
}

function changeDbTab() {
  vehicleTab.classList.toggle("tab-deactive");
  criminalTab.classList.toggle("tab-deactive");
  vehicleTab.classList.toggle("tab-active");
  criminalTab.classList.toggle("tab-active");
  if (vehicleTab.onclick) {
    vehicleTab.onclick = null;
    criminalTab.onclick = changeDbTab;
    vehicleTabContent.style.display = "flex";
    criminalTabContent.style.display = "none";
  } else {
    criminalTab.onclick = null;
    vehicleTab.onclick = changeDbTab;
    vehicleTabContent.style.display = "none";
    criminalTabContent.style.display = "flex";
  }
}

function setPersonInformation(id) {
  $.post("http://will_ficha_v3/infoUser", JSON.stringify({ id }), (data) => {
    let info = data.infos;
    if (info) {
      currentPerson = info;
      /* userNameLabel.innerHTML = info.name
			userIdLabel.innerHTML = info.id 
			userRgLabel.innerHTML = info.rg 
			userTitleLabel.innerHTML = info.title
			userAvatar.style.background = `url(${info.photo}) no-repeat`
			userAvatar.style.backgroundSize = 'cover' */

      dbInformationTitleContent.style.display = "none";
      wantedAppButton.style.display = "none";
      porteAppButton.style.display = "none";
      addOfficerButton.style.display = "none";
      upgradeOfficerButton.style.display = "none";
      downgradeOfficerButton.style.display = "none";
      kickOfficerButton.style.display = "none";
      wantedBorder.style.height = "200px";
      officersBorder.style.height = "200px";
      dbInformation.style.display = "flex";
      dbInformationName.innerText = info.name;
      dbInformationId.innerText = info.id;
      dbInformationRg.innerText = info.rg;
      dbInformationAge.innerText = info.age;
      dbInformationPhone.innerText = info.phone;
      dbInformationPorte.innerText = info.porte;
      dbInformationTax.innerText = info.tax;
      dbInformationPhoto.style.background = `url(${info.photo}) no-repeat`;
      dbInformationPhoto.style.backgroundSize = "cover";
      dataInformation.style.lineHeight = "32px";
      if (info.porte.toUpperCase() === "APTO") {
        porteButtonLabel.innerText = "Remover porte";
      } else {
        porteButtonLabel.innerText = "Adicionar porte";
      }
      setPersonStatus(info.status);
      if (currentScreen === "database") {
        if (myInfos.porteManager == true) {
          porteAppButton.style.display = "flex";
        }
      }
      if (
        (currentScreen === "wanted" || currentScreen === "database") &&
        info.status.toUpperCase() === "PROCURADO"
      ) {
        const personObj = JSON.stringify(info).replaceAll('"', "'");
        wantedAppButton.style.display = "flex";
        wantedAppButton.innerHTML = `
            <div onclick="openModal('wanted-remove', ${personObj})" class="app-content app-mini-content">
                <img src="svg/wanted.svg" height="80px" width="80px" /><br/>
                <p>
                    REMOVER ALERTA<br/>
                    DE PROCURADO
                </p>
            </div>
        `;
        return;
      }
      if (
        (currentScreen === "wanted" || currentScreen === "database") &&
        info.status.toUpperCase() != "PROCURADO" &&
        info.status.toUpperCase() != "DETIDO"
      ) {
        const personObj = JSON.stringify(info).replaceAll('"', "'");
        wantedAppButton.style.display = "flex";
        wantedAppButton.innerHTML = `
            <div onclick="openModal('wanted-add', ${personObj})" class="app-content app-mini-content">
                <img src="svg/wanted.svg" height="80px" width="80px" /><br/>
                <p>
                    ADICIONAR ALERTA<br/>
                    DE PROCURADO
                </p>
            </div>
        `;
        return;
      }

      if (currentScreen === "management") {
        dbInformationTitleContent.style.display = "block";
        dbInformationTitle.innerText = info.title;
        dataInformation.style.lineHeight = "28px";
        if (myInfos.manager == true) {
          if (info.isPolice) {
            downgradeOfficerButton.style.display = "flex";
            upgradeOfficerButton.style.display = "flex";
            kickOfficerButton.style.display = "flex";
          } else {
            addOfficerButton.style.display = "flex";
          }
        }
        return;
      }
    }
  });
}

function getWantedList() {
  wantedContent.innerHTML = "";
  $.post("http://will_ficha_v3/getWantedList", JSON.stringify({}), (data) => {
    const wantedList = data.wantedList;

    if (wantedList.length) {
      wantedList.forEach((person) => {
        wantedContent.innerHTML += `
												<div onclick="setPersonInformation(${person.user_id})" class="col wanted-item">
													<div class="row">
														<div id="photo-mini" style="background: url(${person.photo}) no-repeat; background-size: cover;"></div>
														<div class="db-information-mini">
															NOME: <span id="data-information-name" class="span-light">${person.name}</span><br/>
															PASSAPORTE: <span id="data-information-id" class="span-light">${person.user_id}</span><br/>
														</div>
													</div>
												</div>
											`;
      });
    }
  });
}

function getOfficersList() {
  officersContent.innerHTML = "";
  $.post(
    "http://will_ficha_v3/getOfficersInfos",
    JSON.stringify({}),
    (data) => {
      const officersList = data.Officers;
      if (officersList.length) {
        officersList.forEach((officer) => {
          let netStatus = officer.online ? "online" : "offline";
          officersContent.innerHTML += `
                <div onclick="setPersonInformation(${officer.id})" class="col wanted-item">
                    <div class="row">
                        <div id="photo-mini" style="background: url(${officer.photo}) no-repeat; background-size: cover;"></div>
                        <div class="db-information-officer">
                            <span class="status-${netStatus}">${netStatus}</span><br/>
                            NOME: <span id="data-information-name" class="span-light">${officer.name}</span><br/>
                            PASSAPORTE: <span id="data-information-id" class="span-light">${officer.id}</span><br/>
                            PATENTE: <span id="data-information-id" class="span-light">${officer.title}</span><br/>
                        </div>
                    </div>
                </div>
            `;
        });
      }
    }
  );
}

function addWanted(person) {
  closeModal();
  let state = "PROCURADO";
  $.post(
    "http://will_ficha_v3/changeUserStatus",
    JSON.stringify({ person, state }),
    () => {}
  );
  setTimeout(() => {
    setPersonInformation(person.id);
  }, 100);
}

function removeWanted(person) {
  closeModal();
  let state = "CIDADAO";
  $.post(
    "http://will_ficha_v3/changeUserStatus",
    JSON.stringify({ person, state }),
    () => {}
  );
  setTimeout(() => {
    setPersonInformation(person.id);
  }, 100);
}

function officerAction(type) {
  let nuser_id = currentPerson.id;
  $.post(
    "http://will_ficha_v3/managment",
    JSON.stringify({ nuser_id, type }),
    (data) => {
      if (data.allowed) {
        if (type === "add") {
          notification(
            currentPerson.name + " recrutado com sucesso!",
            "rgba(0, 255, 0, 0.5)"
          );
        } else if (type === "upgrade") {
          notification(
            currentPerson.name + " promovido com sucesso!",
            "rgba(0, 0, 255, 0.5)"
          );
        } else if (type === "downgrade") {
          notification(
            currentPerson.name + " rebaixado com sucesso!",
            "rgba(0, 0, 255, 0.5)"
          );
        } else if (type === "kick") {
          notification(
            currentPerson.name + " demitido com sucesso!",
            "rgba(255, 0, 0, 0.5)"
          );
        }
        setTimeout(() => {
          if (type === "add" || type === "kick") {
            getOfficersList();
          }
          setPersonInformation(nuser_id);
        }, 100);
      }
    }
  );

  closeModal();
  return;
}

function renderPrisonScreen() {
  serviceTotal.innerHTML = "0";
  taxTotal.innerHTML = "R$: 0,00";

  getCrimesList();
  getTimeReductionList();
  crimesProfile.innerHTML = `
									<div class="col wanted-item prison-profile">
										<div class="row">
											<div id="photo-mini" style="background: url(${
                        currentPerson.photo
                      }.png) no-repeat; background-size: cover;"></div>
											<div class="db-information-mini">
												NOME: <span id="data-information-name" class="span-light">${
                          currentPerson.name
                        }</span><br/>
												PASSAPORTE: <span id="data-information-id" class="span-light">${
                          currentPerson.id
                        }</span><br/>
												${currentPerson.criminalList.length ? "" : "RÉU PRIMÁRIO"} 
											</div>
										</div>
									</div>
								`;
}

function getCrimesList(list = crimesList) {
  crimesSelectList.innerHTML = "";
  list.forEach((crime) => {
    const crimeObj = JSON.stringify(crime).replaceAll('"', "'");
    if (!selectedCrimes.includes(crime.name)) {
      crimesSelectList.innerHTML += `<li onclick="renderSelectCrimes(${crimeObj})">${crime.name}</li>`;
    }
  });
}
function getTimeReductionList() {
  timeReductionSelect.innerHTML = "";
  timeReductionList.forEach((timeReduction) => {
    timeReductionSelect.innerHTML += `
												<option 
													value="${timeReduction}"
													label="${
                            timeReduction > 0
                              ? "Redução de " + timeReduction + "%"
                              : "Sem redução de pena"
                          }"
												></option>
											`;
  });
}

function getServiceTotalWithTimeReduction(serviceValue = 0) {
  if (!serviceValue) {
    serviceValue = getServiceTotal();
  }

  serviceValue -= (serviceValue * timeReductionSelect.value) / 100;

  return serviceValue;
}

function getServiceTotal() {
  let serviceValue = 0;

  const crimes = selectedCrimes.map((crime) => {
    return crimesList.find((item) => item.name === crime);
  });

  crimes.forEach((crime) => {
    serviceValue += crime.serviceTime;
  });

  return serviceValue;
}

function getTaxTotal() {
  let taxValue = 0;

  const crimes = selectedCrimes.map((crime) => {
    return crimesList.find((item) => item.name === crime);
  });

  crimes.forEach((crime) => {
    taxValue += crime.taxValue;
  });

  return taxValue;
}

function renderSelectCrimes(crime) {
  if (crime) {
    selectedCrimes.push(crime.name);
  }
  let timeTotal = 0;
  let timeName = "";
  let taxValueTotal = 0.0;
  serviceTotal.innerHTML = "0";
  taxTotal.innerHTML = "R$: 0,00";
  crimesContentList.innerHTML = "";

  selectedCrimes.forEach((crimeName) => {
    crimesContentList.innerHTML += `
											<div class="criminal-item crimes-item">
												${crimeName}
												<i id="criminal-remove-icon" onclick="removeCrime('${crimeName}')" class="fas fa-times fa-sm action-icon"></i>
											</div>
										`;

    let localCrime = crimesList.find((item) => item.name === crimeName);
    timeTotal += localCrime.serviceTime;
    taxValueTotal += localCrime.taxValue;
    serviceTotal.innerHTML =
      getServiceTotalWithTimeReduction(timeTotal) + timeName;
    taxTotal.innerHTML = "R$: " + taxValueTotal;
  });

  if (timeTotal) timeName = timeTotal <= 1 ? " serviço" : " serviços";
  serviceTotal.innerHTML += timeName;

  getCrimesList();
}

function removeCrime(crimeName) {
  selectedCrimes = selectedCrimes.filter(
    (selectedCrime) => selectedCrime !== crimeName
  );
  renderSelectCrimes();
}

function takePhoto() {
  $.post(
    "http://will_ficha_v3/PostNewImage",
    JSON.stringify({}),
    function (url) {
      if (url.length > 0) {
        let user = currentPerson.id;
        $.post(
          "http://will_ficha_v3/updateImage",
          JSON.stringify({ url, user }),
          () => {}
        );
        dbInformationPhoto.style.background = `url(${url}) no-repeat`;
        dbInformationPhoto.style.backgroundSize = "cover";
      }
    }
  );
  return;
}

function userTakePhoto() {
  $.post(
    "http://will_ficha_v3/PostNewImage",
    JSON.stringify({}),
    function (url) {
      if (url.length > 0) {
        $.post(
          "http://will_ficha_v3/updateImage",
          JSON.stringify({ url }),
          () => {}
        );
        userAvatar.style.background = `url(${url}) no-repeat`;
        userAvatar.style.backgroundSize = "cover";
      }
    }
  );
  return;
}

function registerIR() {
  if (irTitleInput.value === "" || irDetaislInput.value === "") {
    notification("Preencha todos os campos", "rgba(255, 0, 0, 0.5)");
    return;
  }

  const person = {
    name: currentPerson.name,
    id: currentPerson.id,
    title: irTitleInput.value,
    details: irDetaislInput.value,
  };
  $.post(
    "http://will_ficha_v3/registerBO",
    JSON.stringify({ person }),
    () => {}
  );

  backScreen("database");

  return;
}

function sendToPrison() {
  if (selectedCrimes.length === 0) {
    notification("Selecione pelo menos um crime!", "rgba(255, 0, 0, 0.5)");
    return;
  }
  if (!prisonDetaislInput.value) {
    notification("Informe o relatório da ocorrência!", "rgba(255, 0, 0, 0.5)");
    return;
  }

  const crimes = selectedCrimes.map((crime) => {
    return crimesList.find((item) => item.name === crime);
  });

  const person = {
    name: currentPerson.name,
    id: currentPerson.id,
    crimes: crimes,
    report: prisonDetaislInput.value,
    taxTotal: getTaxTotal(),
    serviceTotal: getServiceTotalWithTimeReduction(),
  };
  $.post(
    "http://will_ficha_v3/arrestUser",
    JSON.stringify({ person }),
    function () {}
  );

  backScreen();

  return;
}

// Modal
function openModal(type, args) {
  modal.style.display = "block";
  if (type === "ir-decide") {
    modalTitle.innerHTML = `
									O que deseja fazer?
									<i onclick="closeModal()" class="fas fa-times fa-sm close-modal-icon action-icon"></i>
								`;
    modalBody.innerHTML = `
									<button class="modal-button green" onclick="openScreen('incident-report-new', 'REGISTRAR BOLETIM DE OCORRÊNCIA')">REGISTRAR BOLETIM</button>
									<button class="modal-button blue" onclick="openScreen('incident-report-view', 'CONSULTAR BOLETIM DE OCORRÊNCIA')">CONSULTAR BOLETIM</button>
								`;
    modal.style.display = "flex";
    return;
  }

  if (type === "wanted-add") {
    const personObj = JSON.stringify(args).replaceAll('"', "'");
    modalTitle.innerHTML = `
									Adicionar a lista de procurados
								`;
    modalBody.innerHTML = `
									<p class="modal-p">Tem certeza que deseja adicionar esta pessoa à lista de procurados?.</p>
									<button class="modal-button green" onclick="addWanted(${personObj})">SIM, TENHO CERTEZA</button>
									<button class="modal-button red" onclick="closeModal()">NÃO QUERO FAZER ISSO AGORA</button>
								`;
    modal.style.display = "flex";
    return;
  }

  if (type === "wanted-remove") {
    const personObj = JSON.stringify(args).replaceAll('"', "'");
    modalTitle.innerHTML = `
									Remover da lista de procurados
								`;
    modalBody.innerHTML = `
									<p class="modal-p">Tem certeza que deseja remover esta pessoa da lista de procurados?.</p>
									<button class="modal-button green" onclick="removeWanted(${personObj})">SIM, TENHO CERTEZA</button>
									<button class="modal-button red" onclick="closeModal()">NÃO QUERO FAZER ISSO AGORA</button>
								`;
    modal.style.display = "flex";
    return;
  }

  if (type === "officer-add") {
    modalTitle.innerHTML = `
									RECRUTAR CIVIL
								`;
    modalBody.innerHTML = `
									<p class="modal-p">Tem certeza que deseja recrutar este civil?</p>
									<button class="modal-button green" onclick="officerAction('add')">SIM, TENHO CERTEZA</button>
									<button class="modal-button red" onclick="closeModal()">NÃO QUERO FAZER ISSO AGORA</button>
								`;
    modal.style.display = "flex";
    return;
  }

  if (type === "officer-upgrade") {
    modalTitle.innerHTML = `
									PROMOVER OFICIAL
								`;
    modalBody.innerHTML = `
									<p class="modal-p">Tem certeza que deseja promover este oficial?</p>
									<button class="modal-button green" onclick="officerAction('upgrade')">SIM, TENHO CERTEZA</button>
									<button class="modal-button red" onclick="closeModal()">NÃO QUERO FAZER ISSO AGORA</button>
								`;
    modal.style.display = "flex";
    return;
  }

  if (type === "officer-downgrade") {
    modalTitle.innerHTML = `
									REBAIXAR OFICIAL
								`;
    modalBody.innerHTML = `
									<p class="modal-p">Tem certeza que deseja rebaixar este oficial?</p>
									<button class="modal-button green" onclick="officerAction('downgrade')">SIM, TENHO CERTEZA</button>
									<button class="modal-button red" onclick="closeModal()">NÃO QUERO FAZER ISSO AGORA</button>
								`;
    modal.style.display = "flex";
    return;
  }

  if (type === "officer-kick") {
    modalTitle.innerHTML = `
									DEMITIR OFICIAL
								`;
    modalBody.innerHTML = `
									<p class="modal-p">Tem certeza que deseja demitir este oficial?</p>
									<button class="modal-button green" onclick="officerAction('kick')">SIM, TENHO CERTEZA</button>
									<button class="modal-button red" onclick="closeModal()">NÃO QUERO FAZER ISSO AGORA</button>
								`;
    modal.style.display = "flex";
    return;
  }

  if (type === "vehicle-status") {
    let vehObj = null;
    if (args) {
      currentVehicle = args;
      vehObj = JSON.stringify(args).replaceAll('"', "'");
    }
    const vehStatusIndex = vehicleStatusList.findIndex(
      (status) => status.toLowerCase() === currentVehicle.status.toLowerCase()
    );
    const newVehSituation =
      vehStatusIndex < vehicleStatusList.length - 1
        ? vehicleStatusList[vehStatusIndex + 1]
        : vehicleStatusList[0];

    modalTitle.innerHTML = `ALTERAR SITUAÇÃO DO VEÍCULO`;
    modalBody.innerHTML = `
									<p class="modal-p">Tem certeza que deseja alterar a situação do veículo para ${newVehSituation}?</p>
									<button class="modal-button green" onclick="changeVehicleStatus(${vehObj})">SIM, TENHO CERTEZA</button>
									<button class="modal-button red" onclick="closeModal()">NÃO QUERO FAZER ISSO AGORA</button>
								`;
    modal.style.display = "flex";
    return;
  }

  modalTitle.innerHTML = `
								ALERTA!
							`;
  modalBody.innerHTML = `
								<p class="modal-p">Ocorreu um erro inesperado, tente novamente mais tarde, se o problema persistir, entre em contato com o setor de T.I.</p>
									<button class="modal-button red" onclick="closeModal()">OK, TENTAREI MAIS TARDE</button>
							`;
  modal.style.display = "flex";
}

function closeModal() {
  modal.style.display = "none";
  return;
}

// Porte Status
const changePorteStatus = () => {
  let user = currentPerson.id;
  let porteStatus = currentPerson.porte.toUpperCase();
  if (porteStatus === "INAPTO") {
    dbInformationPorte.innerText = "APTO";
    currentPerson.porte = "APTO";
    porteButtonLabel.innerText = "Remover porte";
  } else {
    dbInformationPorte.innerText = "INAPTO";
    currentPerson.porte = "INAPTO";
    porteButtonLabel.innerText = "Adicionar porte";
  }
  $.post(
    "http://will_ficha_v3/changePorteStatus",
    JSON.stringify({ user, porteStatus }),
    function () {}
  );
};

// Select with Filter
const inputField = document.querySelector(".chosen-value");
const dropdown = document.querySelector(".value-list");
const dropdownArray = [...document.querySelectorAll("li")];
let valueArray = [];
dropdownArray.forEach((item) => {
  valueArray.push(item.textContent.toUpperCase());
});

const closeDropdown = () => {
  dropdown.classList.remove("open");
};

inputField.addEventListener("input", () => {
  dropdown.classList.add("open");
  let inputValue = inputField.value.toUpperCase();
  let localCrimesList = [];
  crimesList
    .filter((item) => !selectedCrimes.includes(item.name))
    .forEach((crime) => {
      localCrimesList.push(crime);
    });
  if (inputValue.length > 0) {
    const filteresList = [];
    localCrimesList.filter((item) => {
      if (item.name.toUpperCase().includes(inputValue)) {
        filteresList.push(item);
      }
    });
    getCrimesList(filteresList);
  } else {
    for (let i = 0; i < dropArray.length; i++) {
      dropArray[i].classList.remove("closed");
    }
  }
});

inputField.addEventListener("click", () => {
  inputField.placeholder = "Pesquisar delito...";
  dropdown.classList.toggle("open");
});

document.addEventListener("click", (evt) => {
  const isDropdown = dropdown.contains(evt.target);
  const isInput = inputField.contains(evt.target);
  if (!isDropdown && !isInput) {
    dropdown.classList.remove("open");
    inputField.value = "";
  }
});

function openNav() {
  navBarOverlay.style.display = "block";
  navBarScreen.style.width = "250px";
}

function closeNav() {
  navBarScreen.style.width = "0";
  navBarOverlay.style.display = "none";
}

function notification(text, color) {
  $("#notifications").html(text);
  $("#notifications").css("background-color", color);
  $("#notifications").show();
  setTimeout(function () {
    $("#notifications").hide();
  }, 2500);
}
