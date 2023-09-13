function designList() {
  const select_design_list = [];

  let deslist = JSON.parse(localStorage.getItem("personDesign"));

  console.log(deslist);

  for (let fulldesign of deslist) {
    select_design_list.push(fulldesign);
    console.log(select_design_list);
  }

  for (let i = 0; i < select_design_list.length; i++) {
    let card;
    let img;
    let info_div;
    let design_name;
    let square_feet;
    let para;
    let details;

    card = document.createElement("div");
    card.setAttribute("class", "card");
    document.querySelector("div.designs").append(card);
    console.log(card);

    img = document.createElement("img");
    img.setAttribute("alt", "inteior design");
    img.setAttribute("src", select_design_list[i]["designimg"]);
    card.append(img);

    info_div = document.createElement("div");
    info_div.setAttribute("class", "info");
    card.append(info_div);

    design_name = document.createElement("h3");
    design_name.innerText = select_design_list[i]["designdname"];
    info_div.append(design_name);

    square_feet = document.createElement("p");
    square_feet.innerText = select_design_list[i]["designsquarefeet"];
    info_div.append(square_feet);

    para = document.createElement("p");
    para.innerText = select_design_list[i]["designpara"];
    info_div.append(para);

    details = document.createElement("a");
    details.setAttribute("class", "btn");
    details.innerText = " More details";
    details.setAttribute(
      "href",
      "./user_design_detail.html?id=" + deslist[i].designid
    );
    info_div.append(details);
  }
}

function arcDesignList() {
  const select_design_list = [];

  let deslist = JSON.parse(localStorage.getItem("personDesign"));

  console.log(deslist);

  for (let designlist of deslist) {
    select_design_list.push(designlist);
    console.log(select_design_list);
  }

  for (let i = 0; i < select_design_list.length; i++) {
    let card;
    let img;
    let info_div;
    let design_name;
    let square_feet;
    let para;
    let details;

    card = document.createElement("div");
    card.setAttribute("class", "card");
    document.querySelector("div.designs").append(card);
    console.log(card);

    img = document.createElement("img");
    img.setAttribute("alt", "inteior design");
    img.setAttribute("src", select_design_list[i]["designimg"]);
    card.append(img);

    info_div = document.createElement("div");
    info_div.setAttribute("class", "info");
    card.append(info_div);

    design_name = document.createElement("h3");
    design_name.innerText = select_design_list[i]["designdname"];
    info_div.append(design_name);

    square_feet = document.createElement("p");
    square_feet.innerText = select_design_list[i]["designsquarefeet"];
    info_div.append(square_feet);

    para = document.createElement("p");
    para.innerText = select_design_list[i]["designpara"];
    info_div.append(para);

    details = document.createElement("a");
    details.setAttribute("class", "btn");
    details.innerText = " More details";
    details.setAttribute(
      "href",
      "./architect_design_detail.html?id=" + deslist[i].designid
    );
    info_div.append(details);
  }
}

function designDetail() {
  const desInfo = JSON.parse(localStorage.getItem("personDesign"));
  console.log(desInfo);

  let urlSearch = window.location.search;
  console.log(urlSearch);
  let url_params = new URLSearchParams(urlSearch);
  console.log(url_params);
  let get_id = url_params.get("id");
  console.log(get_id);

  let designObj = desInfo.find(function (select_design) {
    let id = select_design["designid"];
    console.log(id);

    if (get_id == id) {
      return true;
    }
  });
  console.log(designObj);

  document.getElementById("mainimage").setAttribute("src", designObj.designimg);
  document
    .getElementById("mainimage2")
    .setAttribute("src", designObj.designimg2);
  document
    .getElementById("mainimage3")
    .setAttribute("src", designObj.designimg3);
  document
    .getElementById("mainimage4")
    .setAttribute("src", designObj.designimg4);
  document
    .getElementById("mainimage5")
    .setAttribute("src", designObj.designimg5);
  document
    .getElementById("mainimage6")
    .setAttribute("src", designObj.designimg6);
  document
    .getElementById("mainimage7")
    .setAttribute("src", designObj.designimg7);
  document
    .getElementById("mainimage8")
    .setAttribute("src", designObj.designimg8);
  document
    .getElementById("mainimage9")
    .setAttribute("src", designObj.designimg9);
  document
    .getElementById("mainimage10")
    .setAttribute("src", designObj.designimg10);
  document.getElementById("dname").innerHTML = designObj["designdname"];
  document.getElementById("pdesign").innerHTML = designObj["designpdesign"];
  document.getElementById("squarefeet").innerHTML =
    designObj["designsquarefeet"];
  document.getElementById("ppsquarefeet").innerHTML =
    designObj["designppsquarefeet"];
  document.getElementById("dates").innerHTML = designObj["designdates"];
  document.getElementById("bathroom").innerHTML = designObj["designbathroom"];
  document.getElementById("bedroom").innerHTML = designObj["designbedroom"];
  document.getElementById("balcony").innerHTML = designObj["designbalcony"];
  document.getElementById("para").innerHTML = designObj["designpara"];
  document.getElementById("brief_para").innerHTML =
    designObj["designbriefpara"];

  // card java script

  const arclist = JSON.parse(localStorage.getItem("personArchitect"));

  let designEmail = designObj["designemail"];

  let design_owner = arclist.find(function (select_owner) {
    let arcEmail = select_owner["arcEmail"];

    if (designEmail == arcEmail) {
      return true;
    }
  });

  let card;
  let design_img_div;
  let design_img;
  let arcname;
  let exp_div;
  let preExp;
  let arcexperience;
  let detailsbtn;
  let bookbtn;

  card = document.createElement("div");
  card.setAttribute("class", "card");
  document.querySelector("div.AboutArchitect").append(card);

  design_img_div = document.createElement("div");
  design_img_div.setAttribute("class", "cover-photo");
  design_img_div.setAttribute(
    "style",
    "background: url(" +
      design_owner["arcCoverPhoto"] +
      ") no-repeat center center / contain;"
  );
  card.append(design_img_div);

  design_img = document.createElement("img");
  design_img.setAttribute("src", design_owner["arcUrl"]);
  design_img.setAttribute("class", "profile");
  design_img.setAttribute("alt", "architect-profile");
  design_img_div.append(design_img);

  arcname = document.createElement("h3");
  arcname.setAttribute("class", "profile-name");
  arcname.innerText = design_owner["arcName"];
  card.append(arcname);

  exp_div = document.createElement("div");
  exp_div.setAttribute("class", "exp_div");
  card.append(exp_div);

  preExp = document.createElement("pre");
  preExp.innerText = "Experience : ";
  exp_div.append(preExp);

  arcexperience = document.createElement("p");
  arcexperience.setAttribute("class", "about");
  arcexperience.innerText = design_owner["arcExperience"];
  exp_div.append(arcexperience);

  detailsbtn = document.createElement("a");
  detailsbtn.setAttribute("class", "btn");
  detailsbtn.setAttribute(
    "href",
    "./user_detail_one_architect_profile.html?id=" + design_owner.arcId
  );
  detailsbtn.setAttribute("id", "detailsbtn");
  detailsbtn.innerText = " More Details";
  card.append(detailsbtn);

  bookbtn = document.createElement("a");
  bookbtn.setAttribute("class", "btn");
  bookbtn.setAttribute(
    "href",
    "./user_book_now_form.html?id=" + design_owner.arcId
  );
  bookbtn.setAttribute("id", "bookbtn");
  bookbtn.innerText = "Book now";
  card.append(bookbtn);
}

function arcDesignDetail() {
  const desInfo = JSON.parse(localStorage.getItem("personDesign"));
  console.log(desInfo);

  let urlSearch = window.location.search;
  console.log(urlSearch);
  let url_params = new URLSearchParams(urlSearch);
  console.log(url_params);
  let get_id = url_params.get("id");
  console.log(get_id);

  let designObj = desInfo.find(function (select_design) {
    let id = select_design["designid"];
    console.log(id);

    if (get_id == id) {
      return true;
    }
  });
  console.log(designObj);

  document.getElementById("mainimage").setAttribute("src", designObj.designimg);
  document
    .getElementById("mainimage2")
    .setAttribute("src", designObj.designimg2);
  document
    .getElementById("mainimage3")
    .setAttribute("src", designObj.designimg3);
  document
    .getElementById("mainimage4")
    .setAttribute("src", designObj.designimg4);
  document
    .getElementById("mainimage5")
    .setAttribute("src", designObj.designimg5);
  document
    .getElementById("mainimage6")
    .setAttribute("src", designObj.designimg6);
  document
    .getElementById("mainimage7")
    .setAttribute("src", designObj.designimg7);
  document
    .getElementById("mainimage8")
    .setAttribute("src", designObj.designimg8);
  document
    .getElementById("mainimage9")
    .setAttribute("src", designObj.designimg9);
  document
    .getElementById("mainimage10")
    .setAttribute("src", designObj.designimg10);
  document.getElementById("dname").innerHTML = designObj["designdname"];
  document.getElementById("pdesign").innerHTML = designObj["designpdesign"];
  document.getElementById("squarefeet").innerHTML =
    designObj["designsquarefeet"];
  document.getElementById("ppsquarefeet").innerHTML =
    designObj["designppsquarefeet"];
  document.getElementById("dates").innerHTML = designObj["designdates"];
  document.getElementById("bathroom").innerHTML = designObj["designbathroom"];
  document.getElementById("bedroom").innerHTML = designObj["designbedroom"];
  document.getElementById("balcony").innerHTML = designObj["designbalcony"];
  document.getElementById("para").innerHTML = designObj["designpara"];
  document.getElementById("brief_para").innerHTML =
    designObj["designbriefpara"];

  // card java script

  const arclist = JSON.parse(localStorage.getItem("personArchitect"));

  let designEmail = designObj["designemail"];

  let design_owner = arclist.find(function (select_owner) {
    let arcEmail = select_owner["arcEmail"];

    if (designEmail == arcEmail) {
      return true;
    }
  });

  let card;
  let design_img_div;
  let design_img;
  let arcname;
  let exp_div;
  let preExp;
  let arcexperience;
  let detailsbtn;
  let bookbtn;

  card = document.createElement("div");
  card.setAttribute("class", "card");
  document.querySelector("div.AboutArchitect").append(card);

  design_img_div = document.createElement("div");
  design_img_div.setAttribute("class", "cover-photo");
  design_img_div.setAttribute(
    "style",
    "background: url(" +
      design_owner["arcCoverPhoto"] +
      ") no-repeat center center / contain;"
  );
  card.append(design_img_div);

  design_img = document.createElement("img");
  design_img.setAttribute("src", design_owner["arcUrl"]);
  design_img.setAttribute("class", "profile");
  design_img.setAttribute("alt", "architect-profile");
  design_img_div.append(design_img);

  arcname = document.createElement("h3");
  arcname.setAttribute("class", "profile-name");
  arcname.innerText = design_owner["arcName"];
  card.append(arcname);

  exp_div = document.createElement("div");
  exp_div.setAttribute("class", "exp_div");
  card.append(exp_div);

  preExp = document.createElement("pre");
  preExp.innerText = "Experience : ";
  exp_div.append(preExp);

  arcexperience = document.createElement("p");
  arcexperience.setAttribute("class", "about");
  arcexperience.innerText = design_owner["arcExperience"];
  exp_div.append(arcexperience);

  detailsbtn = document.createElement("a");
  detailsbtn.setAttribute("class", "btn");
  detailsbtn.setAttribute(
    "href",
    "./user_detail_one_architect_profile.html?id=" + design_owner.arcId
  );
  detailsbtn.setAttribute("id", "detailsbtn");
  detailsbtn.innerText = " More Details";
  card.append(detailsbtn);

  bookbtn = document.createElement("a");
  bookbtn.setAttribute("class", "btn");
  bookbtn.setAttribute(
    "href",
    "./architect_book_now_form.html?id=" + design_owner.arcId
  );
  bookbtn.setAttribute("id", "bookbtn");
  bookbtn.innerText = "Book now";
  card.append(bookbtn);
}

function arcDesignCreate() {
  let check = false;
  const designapplyFrom = document.getElementById("designForm1");
  console.log(designapplyFrom);

  designapplyFrom.addEventListener("submit", function (event) {
    event.preventDefault();

    let designNew = [];
    console.log(designNew);

    if (localStorage.getItem("personDesign") != null) {
      designNew = JSON.parse(localStorage.getItem("personDesign"));
    }

    const detailimg = document.getElementById("designimage").value.trim();
    const detailimg2 = document.getElementById("designimage2").value.trim();
    const detailimg3 = document.getElementById("designimage3").value.trim();
    const detailimg4 = document.getElementById("designimage4").value.trim();
    const detailimg5 = document.getElementById("designimage5").value.trim();
    const detailimg6 = document.getElementById("designimage6").value.trim();
    const detailimg7 = document.getElementById("designimage7").value.trim();
    const detailimg8 = document.getElementById("designimage8").value.trim();
    const detailimg9 = document.getElementById("designimage9").value.trim();
    const detailimg10 = document.getElementById("designimage10").value.trim();
    const detaildname = document.getElementById("designname").value.trim();
    const detailemail = document.getElementById("email").value.trim();
    const detailpdesign = document.getElementById("pricedesign").value.trim();
    const detailsquarefeet = document.getElementById("squarefeet").value.trim();
    const detailppsquarefeet = document
      .getElementById("pricepersquarefeet")
      .value.trim();
    const detailtype = document.getElementById("browser").value.trim();
    const detaildates = document.getElementById("dates").value.trim();
    const detailbathroom = document.getElementById("bathrooms").value.trim();
    const detailbedroom = document.getElementById("bedroom").value.trim();
    const detailbalcony = document.getElementById("balcony").value.trim();
    const detailpara = document.getElementById("paragraph").value.trim();
    const detailbriefpara = document
      .getElementById("brief_paragraph")
      .value.trim();
    const detailid = Date.now();

    let designData = {
      designid: detailid,
      designimg: detailimg,
      designimg2: detailimg2,
      designimg3: detailimg3,
      designimg4: detailimg4,
      designimg5: detailimg5,
      designimg6: detailimg6,
      designimg7: detailimg7,
      designimg8: detailimg8,
      designimg9: detailimg9,
      designimg10: detailimg10,
      designdname: detaildname,
      designemail: detailemail,
      designpdesign: detailpdesign,
      designsquarefeet: detailsquarefeet,
      designppsquarefeet: detailppsquarefeet,
      designtype: detailtype,
      designdates: detaildates,
      designbathroom: detailbathroom,
      designbedroom: detailbedroom,
      designbalcony: detailbalcony,
      designpara: detailpara,
      designbriefpara: detailbriefpara,
    };

    console.log(designData);

    if (check === false) {
      designNew.push(designData);
      const data = JSON.stringify(designNew);
      alert("sucessfully completed");
      localStorage.setItem("personDesign", data);
      window.location.href = "./own_architect_profile.html";
    }
  });
}
function arcDesignEdit() {
  let designID = JSON.parse(localStorage.getItem("designID"));
  console.log(designID);
  let designData = JSON.parse(localStorage.getItem("personDesign"));
  console.log(designData);

  let currentdesign = designData.find(function (des) {
    let id = des["designid"];
    if (designID == id) {
      return true;
    }
  });

  console.log(currentdesign);

  document.getElementById("designimage").value = currentdesign.designimg;
  document.getElementById("designimage2").value = currentdesign.designimg2;
  document.getElementById("designimage3").value = currentdesign.designimg3;
  document.getElementById("designimage4").value = currentdesign.designimg4;
  document.getElementById("designimage5").value = currentdesign.designimg5;
  document.getElementById("designimage6").value = currentdesign.designimg6;
  document.getElementById("designimage7").value = currentdesign.designimg7;
  document.getElementById("designimage8").value = currentdesign.designimg8;
  document.getElementById("designimage9").value = currentdesign.designimg9;
  document.getElementById("designimage10").value = currentdesign.designimg10;
  document.getElementById("designname").value = currentdesign.designdname;
  document.getElementById("pricedesign").value = currentdesign.designpdesign;
  document.getElementById("squarefeet").value = currentdesign.designsquarefeet;
  document.getElementById("pricepersquarefeet").value =
    currentdesign.designppsquarefeet;
  document.getElementById("browser").value = currentdesign.designtype;
  document.getElementById("dates").value = currentdesign.designdates;
  document.getElementById("bathrooms").value = currentdesign.designbathroom;
  document.getElementById("bedroom").value = currentdesign.designbedroom;
  document.getElementById("balcony").value = currentdesign.designbalcony;
  document.getElementById("paragraph").value = currentdesign.designpara;
  document.getElementById("brief_paragraph").value =
    currentdesign.designbriefpara;

  let designForm1 = document.getElementById("designForm1");
  designForm1.addEventListener("submit", (e) => {
    e.preventDefault();
    let currentdesign = designData.find(function (des) {
      let id = des["designid"];
      if (designID == id) {
        return true;
      }
    });

    const detailimg = document.getElementById("designimage").value.trim();
    const detailimg2 = document.getElementById("designimage2").value.trim();
    const detailimg3 = document.getElementById("designimage3").value.trim();
    const detailimg4 = document.getElementById("designimage4").value.trim();
    const detailimg5 = document.getElementById("designimage5").value.trim();
    const detailimg6 = document.getElementById("designimage6").value.trim();
    const detailimg7 = document.getElementById("designimage7").value.trim();
    const detailimg8 = document.getElementById("designimage8").value.trim();
    const detailimg9 = document.getElementById("designimage9").value.trim();
    const detailimg10 = document.getElementById("designimage10").value.trim();
    const detaildname = document.getElementById("designname").value.trim();
    const detailpdesign = document.getElementById("pricedesign").value.trim();
    const detailsquarefeet = document.getElementById("squarefeet").value.trim();
    const detailppsquarefeet = document
      .getElementById("pricepersquarefeet")
      .value.trim();
    const detailtype = document.getElementById("browser").value.trim();
    const detaildates = document.getElementById("dates").value.trim();
    const detailbathroom = document.getElementById("bathrooms").value.trim();
    const detailbedroom = document.getElementById("bedroom").value.trim();
    const detailbalcony = document.getElementById("balcony").value.trim();
    const detailpara = document.getElementById("paragraph").value.trim();
    const detailbriefpara = document
      .getElementById("brief_paragraph")
      .value.trim();

    currentdesign.designimg = detailimg;
    currentdesign.designimg2 = detailimg2;
    currentdesign.designimg3 = detailimg3;
    currentdesign.designimg4 = detailimg4;
    currentdesign.designimg5 = detailimg5;
    currentdesign.designimg6 = detailimg6;
    currentdesign.designimg7 = detailimg7;
    currentdesign.designimg8 = detailimg8;
    currentdesign.designimg9 = detailimg9;
    currentdesign.designimg10 = detailimg10;
    currentdesign.designdname = detaildname;
    currentdesign.designpdesign = detailpdesign;
    currentdesign.designsquarefeet = detailsquarefeet;
    currentdesign.designppsquarefeet = detailppsquarefeet;
    currentdesign.designtype = detailtype;
    currentdesign.designdates = detaildates;
    currentdesign.designbathroom = detailbathroom;
    currentdesign.designbedroom = detailbedroom;
    currentdesign.designbalcony = detailbalcony;
    currentdesign.designpara = detailpara;
    currentdesign.designbriefpara = detailbriefpara;

    localStorage.setItem("personDesign", JSON.stringify(designData));
    window.location.href = "./own_architect_profile.html";
  });
}
