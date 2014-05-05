"use strict";

function openSesame() {
  $("#door-l").addClass("door-moving");
  $("#door-r").addClass("door-moving");
  $("#door-l").css("transform", "translateX(-150%)");
  $("#door-r").css("transform", "translateX(150%)");

  return false;
}

function passwordIncorrect() {
  var overlay = $("#password-sphere-overlay");
  overlay.fadeTo(0, 1);
  overlay.show();
  overlay.fadeTo(1000, 0);
}

function login() {
  var password = $("#password-field").val();

  $.ajax({
    type: "POST",
    url: "/login/",
    data: $("password-form").serialize(),
    async: true,
    success: function(response, status, xhr) {
      alert("success");
      openSesame();
    },
    error: function(xhr, status, message) {
      passwordIncorrect();
    }
  });

  return false;
}

$("#password-form").submit(login);
