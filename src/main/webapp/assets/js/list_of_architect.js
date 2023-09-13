const select_architect_list = [];

let arclist = JSON.parse(localStorage.getItem("personArchitect"));

const singleArc = JSON.parse(localStorage.getItem("Single_Data"));

let arcmatch = arclist.find(function (event) {
  let arcEmail = event["arcEmail"];
  if (singleArc == arcEmail) {
    return true;
  }
});
console.log(arcmatch);

console.log(arclist);

for (let allarc of arclist) {
  select_architect_list.push(allarc);
  console.log(select_architect_list);
}

function architectLoop() {
  for (let i = 0; i < select_architect_list.length; i++) {
    if (select_architect_list[i]["arcId"] == arcmatch["arcId"]) {
      continue;
    }

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
    document.querySelector("div.all-architect-list").append(card);
    console.log(card);

    design_img_div = document.createElement("div");
    design_img_div.setAttribute("class", "cover-photo");
    design_img_div.setAttribute(
      "style",
      "background: url(" +
        select_architect_list[i]["arcCoverPhoto"] +
        ") no-repeat center center / contain;"
    );
    card.append(design_img_div);

    design_img = document.createElement("img");
    design_img.setAttribute("src", select_architect_list[i]["arcUrl"]);
    design_img.setAttribute("class", "profile");
    design_img.setAttribute("alt", "architect-profile");
    design_img_div.append(design_img);

    arcname = document.createElement("h3");
    arcname.setAttribute("class", "profile-name");
    arcname.innerText = select_architect_list[i]["arcName"];
    card.append(arcname);

    exp_div = document.createElement("div");
    exp_div.setAttribute("class", "exp_div");
    card.append(exp_div);

    preExp = document.createElement("pre");
    preExp.innerText = "Experience : ";
    exp_div.append(preExp);

    arcexperience = document.createElement("p");
    arcexperience.setAttribute("class", "about");
    arcexperience.innerText = select_architect_list[i]["arcExperience"];
    exp_div.append(arcexperience);

    detailsbtn = document.createElement("a");
    detailsbtn.setAttribute("class", "btn");
    detailsbtn.setAttribute(
      "href",
      "./user_detail_one_architect_profile.html?id=" + arclist[i].arcId
    );
    detailsbtn.setAttribute("id", "detailsbtn");
    detailsbtn.innerText = " More Details";
    card.append(detailsbtn);

    bookbtn = document.createElement("a");
    bookbtn.setAttribute("class", "btn");
    bookbtn.setAttribute(
      "href",
      "./architect_book_now_form.html?id=" + arclist[i].arcId
    );
    bookbtn.setAttribute("id", "bookbtn");
    bookbtn.innerText = "Book now";
    card.append(bookbtn);
  }
}

architectLoop();
