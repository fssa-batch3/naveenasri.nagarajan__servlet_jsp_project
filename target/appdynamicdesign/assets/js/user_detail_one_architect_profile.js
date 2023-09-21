function moreDetail() {
  const arcInfo = JSON.parse(localStorage.getItem("personArchitect"));
  let urlSearch = window.location.search;
  let url_params = new URLSearchParams(urlSearch);
  let get_id = url_params.get("id");

  let urlObj = arcInfo.find(function (select_architect) {
    let id = select_architect["arcId"];
    console.log(id);

    if (get_id == id) {
      return true;
    }
  });
  document.getElementById("userImage").setAttribute("src", urlObj["arcUrl"]);
  document.getElementById("userName").innerHTML = urlObj["arcName"];
  document.getElementById("userGender").innerHTML = urlObj["arcGender"];
  document.getElementById("userPhoneNumber").innerHTML =
    urlObj["arcPhoneNumber"];
  document.getElementById("userAddress").innerHTML = urlObj["arcAddress"];
  document
    .getElementById("userCoverPhoto")
    .setAttribute("src", urlObj["arcCoverPhoto"]);
  document.getElementById("userEducation").innerHTML = urlObj["arcEducation"];
  document.getElementById("userExperience").innerHTML = urlObj["arcExperience"];
  document.getElementById("userEmail").innerHTML = urlObj["arcEmail"];
  document
    .getElementById("userDocument")
    .setAttribute("src", urlObj["arcDocument"]);
  document
    .getElementById("userNataCertificate")
    .setAttribute("src", urlObj["arcNataCertificate"]);

  let oneArchitectdesign = [];

  let deslist = JSON.parse(localStorage.getItem("personDesign"));

  for (let alldesign of deslist) {
    if (urlObj["arcEmail"] == alldesign["designemail"]) {
      oneArchitectdesign.push(alldesign);
    }
  }

  for (let onearcdes of oneArchitectdesign) {
    let card;
    let img;
    let info_div;
    let design_name;
    let square_feet;
    let para;
    let details;

    card = document.createElement("div");
    card.setAttribute("class", "card");
    document.querySelector("#model-designs").append(card);
    console.log(card);

    img = document.createElement("img");
    img.setAttribute("alt", "inteior design");
    img.setAttribute("src", onearcdes["designimg"]);
    card.append(img);

    info_div = document.createElement("div");
    info_div.setAttribute("class", "info");
    card.append(info_div);

    design_name = document.createElement("h3");
    design_name.innerText = onearcdes["designdname"];
    info_div.append(design_name);

    square_feet = document.createElement("p");
    square_feet.innerText = onearcdes["designsquarefeet"];
    info_div.append(square_feet);

    para = document.createElement("p");
    para.innerText = onearcdes["designpara"];
    info_div.append(para);

    details = document.createElement("a");
    details.setAttribute("class", "btn");
    details.innerText = " More details";
    details.setAttribute(
      "href",
      "./user_design_detail.html?id=" + onearcdes.designid
    );
    info_div.append(details);
  }
}

function bookNow() {
  const bookingform = document.getElementById("bookingform");
  bookingform.addEventListener("submit", function (e) {
    e.preventDefault();

    const allarc = JSON.parse(localStorage.getItem("personArchitect"));
    console.log(allarc);

    let urlSearch = window.location.search;
    console.log(urlSearch);
    let url_params = new URLSearchParams(urlSearch);
    console.log(url_params);
    let get_id = url_params.get("id");
    console.log(get_id);

    let oneArc = allarc.find(function (event) {
      let arcId = event["arcId"];
      if (get_id == arcId) {
        return true;
      }
    });
    console.log(oneArc);

    const thisuser = JSON.parse(localStorage.getItem("this_user"));
    const alluser = JSON.parse(localStorage.getItem("register"));

    let ownuser = alluser.find(function (event) {
      let userEmail = event["userEmail"];
      if (thisuser == userEmail) {
        return true;
      }
    });
    console.log(ownuser);

    const bookdesignname = document.getElementById("designname").value.trim();
    const bookdesignurl = document.getElementById("designurl").value.trim();
    const bookamount = document.getElementById("amount").value.trim();
    const booktime = document.getElementById("time").value.trim();
    const bookmessage = document.getElementById("messagetextarea").value.trim();
    const bookid = Date.now();

    let bookuserdetail = {
      userId: ownuser.userId,
      userName: ownuser.userName,
      userEmail: ownuser.userEmail,
      userNumber: ownuser.userNumber,
      bookid: bookid,
      bookdesignname: bookdesignname,
      bookdesignurl: bookdesignurl,
      bookamount: bookamount,
      booktime: booktime,
      bookmessage: bookmessage,
    };

    oneArc.booked.push(bookuserdetail);
    console.log(bookuserdetail);
    let onearcindex = allarc.indexOf(oneArc);
    console.log(onearcindex);
    allarc[onearcindex] = oneArc;
    console.log(oneArc);
    const str = JSON.stringify(allarc);
    confirm(
      "Make sure the given details should be correct we give this details to the Architect whom you select"
    );
    window.localStorage.setItem("personArchitect", str);
    window.location.href = "./user_architect.html";
  });
}

function architectBookNow() {
  const bookingform = document.getElementById("bookingform");
  bookingform.addEventListener("submit", function (e) {
    e.preventDefault();

    const allarc = JSON.parse(localStorage.getItem("personArchitect"));
    console.log(allarc);

    let urlSearch = window.location.search;
    console.log(urlSearch);
    let url_params = new URLSearchParams(urlSearch);
    console.log(url_params);
    // console.log(URLSearchParams)
    let get_id = url_params.get("id");
    console.log(get_id);

    let oneArc = allarc.find(function (event) {
      let arcId = event["arcId"];
      if (get_id == arcId) {
        return true;
      }
    });
    console.log(oneArc);

    const thisarc = JSON.parse(localStorage.getItem("Single_Data"));
    const personarc = JSON.parse(localStorage.getItem("personArchitect"));

    let ownuser = personarc.find(function (event) {
      let arcEmail = event["arcEmail"];
      if (thisarc == arcEmail) {
        return true;
      }
    });
    console.log(ownuser);

    const bookdesignname = document.getElementById("designname").value.trim();
    const bookdesignurl = document.getElementById("designurl").value.trim();
    const bookamount = document.getElementById("amount").value.trim();
    const booktime = document.getElementById("time").value.trim();
    const bookmessage = document.getElementById("messagetextarea").value.trim();
    const bookid = Date.now();

    let bookuserdetail = {
      userId: ownuser.arcId,
      userName: ownuser.arcName,
      userEmail: ownuser.arcEmail,
      userNumber: ownuser.arcPhoneNumber,
      bookid: bookid,
      bookdesignname: bookdesignname,
      bookdesignurl: bookdesignurl,
      bookamount: bookamount,
      booktime: booktime,
      bookmessage: bookmessage,
    };

    oneArc.booked.push(bookuserdetail);
    console.log(bookuserdetail);
    let onearcindex = allarc.indexOf(oneArc);
    console.log(onearcindex);
    allarc[onearcindex] = oneArc;
    console.log(oneArc);
    const str = JSON.stringify(allarc);
    confirm(
      "Make sure the given details should be correct we give this details to the Architect whom you select"
    );
    window.localStorage.setItem("personArchitect", str);
  });
}
