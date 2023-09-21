function arcSignUp() {
  let check = false;
  const applyFrom = document.getElementById("architectForm1");
  console.log(applyFrom);

  applyFrom.addEventListener("submit", function (event) {
    event.preventDefault();

    let architectNew = [];
    console.log(architectNew);

    if (localStorage.getItem("personArchitect") != null) {
      architectNew = JSON.parse(localStorage.getItem("personArchitect"));
    }

    const getUrl = document.getElementById("image").value.trim();
    const getName = document.getElementById("name").value.trim();
    const getGender = document.getElementById("gender").value.trim();
    const getPhoneNumber = document.getElementById("phonenumber").value.trim();
    const getAddress = document.getElementById("address").value.trim();
    const getCoverPhoto = document.getElementById("coverphoto").value.trim();
    const getEducation = document.getElementById("education").value.trim();
    const getExperience = document.getElementById("experience").value.trim();
    const getEmail = document.getElementById("email").value.trim();
    const getPassword = document.getElementById("password").value.trim();
    const getDocument = document.getElementById("document").value.trim();
    const getNataCertificate = document
      .getElementById("natacertificate")
      .value.trim();
    const getId = Date.now();

    let architectData = {
      arcId: getId,
      arcUrl: getUrl,
      arcName: getName,
      arcGender: getGender,
      arcPhoneNumber: getPhoneNumber,
      arcAddress: getAddress,
      arcCoverPhoto: getCoverPhoto,
      arcEducation: getEducation,
      arcExperience: getExperience,
      arcEmail: getEmail,
      arcPassword: getPassword,
      booked: [],
      arcDocument: getDocument,
      arcNataCertificate: getNataCertificate,
    };

    console.log(architectData);

    for (let checkemail of architectNew) {
      if (checkemail["arcEmail"] === getEmail) {
        check = true;
        alert("user already exit");
        break;
      } else {
        check = false;
      }
    }

    if (check === false) {
      architectNew.push(architectData);
      const data = JSON.stringify(architectNew);
      alert("sucessfully completed");
      window.localStorage.setItem("personArchitect", data);
      window.location.href = "./architect_login.html";
    }
  });
}

function arcLogin() {
  let arcLogin = document.getElementById("architectForm2");

  arcLogin.addEventListener("submit", (event) => {
    event.preventDefault();

    let wholeData = JSON.parse(localStorage.getItem("personArchitect"));
    console.log(wholeData);

    const getEmail = document.getElementById("email").value;
    const getPassword = document.getElementById("password").value;

    let match = false;

    for (let verify of wholeData) {
      if (getEmail == verify.arcEmail && getPassword == verify.arcPassword) {
        match = true;
        break;
      }
    }

    if (match === true) {
      alert("successfully completed");
      const matchData = wholeData.find((o) => o["arcEmail"] == getEmail);
      const singleData = JSON.stringify(matchData.arcEmail);
      localStorage.setItem("Single_Data", singleData);
      window.location.href = "./architect_architect_list.html";
    } else {
      alert("Failed");
    }
  });
}

// profile page is redirect to the different page

function arcProfileEdit() {
  const singleData = JSON.parse(localStorage.getItem("Single_Data"));
  const arcInfo = JSON.parse(localStorage.getItem("personArchitect"));

  let oneArchitect = arcInfo.find(function (event) {
    let arcEmail = event["arcEmail"];
    if (singleData == arcEmail) {
      return true;
    }
  });

  console.log(oneArchitect);

  document.getElementById("userImage").value = oneArchitect["arcUrl"];
  document.getElementById("userName").value = oneArchitect["arcName"];
  document.getElementById("userGender").value = oneArchitect["arcGender"];
  document.getElementById("userPhoneNumber").value =
    oneArchitect["arcPhoneNumber"];
  document.getElementById("userAddress").value = oneArchitect["arcAddress"];
  document.getElementById("userCoverPhoto").value =
    oneArchitect["arcCoverPhoto"];
  document.getElementById("userEducation").value = oneArchitect["arcEducation"];
  document.getElementById("userExperience").value =
    oneArchitect["arcExperience"];
  document.getElementById("userEmail").value = oneArchitect["arcEmail"];
  document.getElementById("userDocument").value = oneArchitect["arcDocument"];
  document.getElementById("userNataCertificate").value =
    oneArchitect["arcNataCertificate"];

  // edit page function
  let complete = document.getElementById("architectForm3");

  console.log(complete);

  complete.addEventListener("submit", function (event) {
    event.preventDefault();
    // get data from edit form
    let arcUrl = document.getElementById("userImage").value;
    let arcName = document.getElementById("userName").value;
    let arcGender = document.getElementById("userGender").value;
    let arcPhoneNumber = document.getElementById("userPhoneNumber").value;
    let arcAddress = document.getElementById("userAddress").value;
    let arcCoverPhoto = document.getElementById("userCoverPhoto").value;
    let arcEducation = document.getElementById("userEducation").value;
    let arcExperience = document.getElementById("userExperience").value;
    let arcEmail = document.getElementById("userEmail").value;
    let arcDocument = document.getElementById("userDocument").value;
    let arcNataCertificate = document.getElementById(
      "userNataCertificate"
    ).value;

    let regex = /^[6789]\d{8,14}$/;
    if (regex.test(arcPhoneNumber)) {
      console.log("Valid phone number!");
    } else {
      alert("Phone number is invalid kindly change your number");
      return;
    }

    let architectUser_data = {
      arcUrl,
      arcName,
      arcGender,
      arcPhoneNumber,
      arcAddress,
      arcCoverPhoto,
      arcEducation,
      arcExperience,
      arcEmail,
      arcDocument,
      arcNataCertificate,
    };

    let architectData = JSON.parse(localStorage.getItem("personArchitect"));
    let lastData = architectData.find((i) => i.arcEmail == arcEmail);
    let convert = Object.assign(lastData, architectUser_data);
    console.log(convert);
    let index = architectData.indexOf(lastData);
    architectData[index] = convert;
    localStorage.setItem("personArchitect", JSON.stringify(architectData));
    window.location.href = "./own_architect_profile.html";
  });
}
