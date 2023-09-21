const Architectlist = JSON.parse(localStorage.getItem("personArchitect"));
const singleArc = JSON.parse(localStorage.getItem("Single_Data"));

let arcmatch = Architectlist.find(function (event) {
  let arcEmail = event["arcEmail"];
  if (singleArc == arcEmail) {
    return true;
  }
});
console.log(arcmatch);

for (let i = 0; i < arcmatch.booked.length; i++) {
  // Create a new div element
  const formDiv = document.createElement("div");
  formDiv.setAttribute("id", "a-form");

  // Create a new pre element for design URL
  const designUrlImg = document.createElement("img");
  designUrlImg.id = "designUrl";
  designUrlImg.setAttribute("class", "designurl");
  designUrlImg.setAttribute("src", arcmatch["booked"][i]["bookdesignurl"]);

  // Create a new div element for name
  const nameDiv = document.createElement("div");
  const namePre = document.createElement("pre");
  namePre.textContent = "Name             : ";
  const nameSpan = document.createElement("span");
  nameSpan.setAttribute("id", "name");
  nameSpan.innerText = arcmatch["booked"][i]["userName"];
  namePre.appendChild(nameSpan);
  nameDiv.appendChild(namePre);

  // Create a new div element for email
  const emailDiv = document.createElement("div");
  const emailPre = document.createElement("pre");
  emailPre.textContent = "Email            : ";
  const emailSpan = document.createElement("span");
  emailSpan.id = "mail";
  emailSpan.innerText = arcmatch["booked"][i]["userEmail"];
  emailPre.appendChild(emailSpan);
  emailDiv.appendChild(emailPre);

  // Create a new div element for phone number
  const phoneNumberDiv = document.createElement("div");
  const phoneNumberPre = document.createElement("pre");
  phoneNumberPre.textContent = "Phone number     : ";
  const phoneNumberSpan = document.createElement("span");
  phoneNumberSpan.id = "phoneNumber";
  phoneNumberSpan.innerText = arcmatch["booked"][i]["userNumber"];
  phoneNumberPre.appendChild(phoneNumberSpan);
  phoneNumberDiv.appendChild(phoneNumberPre);

  // Create a new div element for design name
  const designNameDiv = document.createElement("div");
  const designNamePre = document.createElement("pre");
  designNamePre.textContent = "Design name      : ";
  const designNameSpan = document.createElement("span");
  designNameSpan.id = "designName";
  designNameSpan.innerText = arcmatch["booked"][i]["bookdesignname"];
  designNamePre.appendChild(designNameSpan);
  designNameDiv.appendChild(designNamePre);

  // Create a new div element for expected amount
  const amountDiv = document.createElement("div");
  const amountPre = document.createElement("pre");
  amountPre.textContent = "Expected Amount  : ";
  const amountSpan = document.createElement("span");
  amountSpan.id = "amount";
  amountSpan.innerText = arcmatch["booked"][i]["bookamount"];
  amountPre.appendChild(amountSpan);
  amountDiv.appendChild(amountPre);

  // Create a new div element for time period
  const timeDiv = document.createElement("div");
  const timePre = document.createElement("pre");
  timePre.textContent = "Time period      : ";
  const timeSpan = document.createElement("span");
  timeSpan.id = "time";
  timeSpan.innerText = arcmatch["booked"][i]["booktime"];
  timePre.appendChild(timeSpan);
  timeDiv.appendChild(timePre);

  // Create a new div element for id
  const bookIdDiv = document.createElement("div");
  const bookIdPre = document.createElement("pre");
  bookIdPre.textContent = "Book ID          : ";
  const bookIdSpan = document.createElement("span");
  bookIdSpan.id = "message";
  bookIdSpan.innerText = arcmatch["booked"][i]["bookid"];
  bookIdPre.appendChild(bookIdSpan);
  bookIdDiv.appendChild(bookIdPre);

  // Create a new div element for message
  const messageDiv = document.createElement("div");
  const messagePre = document.createElement("pre");
  messagePre.textContent = "Message          : ";
  const messageSpan = document.createElement("span");
  messageSpan.id = "message";
  messageSpan.innerText = arcmatch["booked"][i]["bookmessage"];
  messagePre.appendChild(messageSpan);
  messageDiv.appendChild(messagePre);

  // Create a new div element for both buttons
  const bothBtnDiv = document.createElement("div");
  bothBtnDiv.classList.add("both-btn");

  // Create a new accept button
  const acceptBtn = document.createElement("a");
  acceptBtn.classList.add("verifybtn");
  acceptBtn.setAttribute(
    "href",
    "./architect_accept_form.html?id=" + arcmatch["booked"][i]["bookid"]
  );
  acceptBtn.setAttribute("onclick", "accept()");
  acceptBtn.textContent = "Accept";

  // Create a new not accept button
  const notAcceptBtn = document.createElement("a");
  notAcceptBtn.classList.add("verifybtn");
  notAcceptBtn.href = "#";
  notAcceptBtn.textContent = "Not Accept";

  // Append all the elements to the form div
  formDiv.appendChild(designUrlImg);
  formDiv.appendChild(nameDiv);
  formDiv.appendChild(emailDiv);
  formDiv.appendChild(phoneNumberDiv);
  formDiv.appendChild(designNameDiv);
  formDiv.appendChild(amountDiv);
  formDiv.appendChild(timeDiv);
  formDiv.appendChild(bookIdDiv);
  formDiv.appendChild(messageDiv);
  formDiv.appendChild(bothBtnDiv);
  bothBtnDiv.appendChild(acceptBtn);
  bothBtnDiv.appendChild(notAcceptBtn);

  document.querySelector(".list-of-customer").append(formDiv);
}
