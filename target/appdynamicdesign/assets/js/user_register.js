function userSignUp() {
  let checker = false;
  const signupfrom = document.getElementById("form2");
  console.log(signupfrom);
  signupfrom.addEventListener("submit", function (event) {
    event.preventDefault();

    let userNew = [];
    console.log(userNew);

    if (localStorage.getItem("register") != null) {
      userNew = JSON.parse(localStorage.getItem("register"));
    }

    const getNorName = document.getElementById("norname").value.trim();
    const getName = document.getElementById("name").value.trim();
    const getEmail = document.getElementById("email").value.trim();
    const getNumber = document.getElementById("number").value.trim();
    const getPassword = document.getElementById("password").value.trim();
    const getConfirmPassword = document
      .getElementById("confirm_password")
      .value.trim();
    const userId = Date.now();

    let userData = {
      userId: userId,
      userNorName: getNorName,
      userName: getName,
      userEmail: getEmail,
      userNumber: getNumber,
      userPassword: getPassword,
      userconPassword: getConfirmPassword,
    };

    console.log(userData);

    for (let newarr of userNew) {
      if (newarr["userNorName"] === getNorName) {
        checker = true;
        alert("User name already exit");
        break;
      } else {
        checker = false;
      }
    }
    for (let newarr of userNew) {
      if (newarr["userEmail"] === getEmail) {
        checker = true;
        alert("same email is already exit");
        break;
      } else {
        checker = false;
      }
    }
    if (checker === false) {
      if (getPassword === getConfirmPassword) {
        userNew.push(userData);
        const str = JSON.stringify(userNew);
        alert("Sucess");
        window.localStorage.setItem("register", str);
        window.location.href = "./user_login.html";
      } else {
        alert("Password and confirmpassword should be same");
      }
    }
  });
}

function userLogin() {
  let logIn = document.getElementById("form3");

  logIn.addEventListener("submit", (event) => {
    event.preventDefault();

    let defult = JSON.parse(localStorage.getItem("register"));
    console.log(defult);

    const getEmail = document.getElementById("email").value;
    const getPassword = document.getElementById("password").value;

    let match = false;

    for (let checker of defult) {
      if (
        getEmail == checker.userEmail &&
        getPassword == checker.userPassword
      ) {
        match = true;
        break;
      }
    }

    if (match === true) {
      alert("successfully completed");
      const matchObject = defult.find((o) => o["userEmail"] == getEmail);
      const thisUser = JSON.stringify(matchObject.userEmail);
      localStorage.setItem("this_user", thisUser);
      window.location.href = "./user_home.html";
    } else {
      alert("failed");
    }
  });
}

function userProfile() {
  //get data from local storage
  const thisUser = JSON.parse(localStorage.getItem("this_user"));
  const userinfo = JSON.parse(localStorage.getItem("register"));
  //get object from local storage used by email
  let singleUser = userinfo.find(function (event) {
    let useremail = event["userEmail"];
    if (thisUser == useremail) {
      return true;
    }
  });

  document.getElementById("name").value = singleUser["userNorName"];
  document.getElementById("email").value = singleUser["userEmail"];
  document.getElementById("userName").value = singleUser["userName"];
  document.getElementById("phoneNumber").value = singleUser["userNumber"];

  let delete_user = document.getElementById("delete_btn");
  delete_user.addEventListener("click", function (event) {
    event.preventDefault();
    let index = userinfo.indexOf(singleUser);
    let msg = confirm("Are you sure you want to delete this account");
    if (msg !== true) {
      return;
    } else {
      userinfo.splice(index, 1);
      localStorage.setItem("register", JSON.stringify(userinfo));
      window.location.href = "../index.html";
    }
  });
}

function userProfileEdit() {
  //get data from local storage
  const thisUser = JSON.parse(localStorage.getItem("this_user"));
  const userinfo = JSON.parse(localStorage.getItem("register"));
  //get object from local storage used by email
  let singleUser = userinfo.find(function (event) {
    let useremail = event["userEmail"];
    if (thisUser == useremail) {
      return true;
    }
  });

  document.getElementById("name").value = singleUser["userNorName"];
  document.getElementById("email").value = singleUser["userEmail"];
  document.getElementById("userName").value = singleUser["userName"];
  document.getElementById("phoneNumber").value = singleUser["userNumber"];

  // edit page function
  let submit = document.getElementById("form_E");
  submit.addEventListener("submit", function (event) {
    event.preventDefault();
    // get data from edit form
    let userNorName = document.getElementById("name").value;
    let userName = document.getElementById("userName").value;
    let userEmail = document.getElementById("email").value;
    let userNumber = document.getElementById("phoneNumber").value;

    let regex = /^[6789]\d{8,14}$/;
    if (regex.test(userNumber)) {
      console.log("Valid phone number!");
    } else {
      alert("Phone number is invalid kindly change your number");
      return;
    }

    let editUser_data = {
      userNorName,
      userName,
      userEmail,
      userNumber,
    };

    let newData = JSON.parse(localStorage.getItem("register"));
    let oldData = newData.find((i) => i.userEmail == userEmail);
    let change = Object.assign(oldData, editUser_data);
    let index = newData.indexOf(oldData);
    newData[index] = change;
    localStorage.setItem("register", JSON.stringify(newData));
    window.location.href = "./user_home.html";
  });
}
