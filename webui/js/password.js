"use strict";

function openSesame() {
  $("#door-l").addClass("door-moving");
  $("#door-r").addClass("door-moving");
  $("#door-l").css("transform", "translateX(-150%)");
  $("#door-r").css("transform", "translateX(150%)");

  $(".content").fadeIn(1500);

  setTimeout(function() {
    $("#doors").remove();
  }, 750);

  return false;
}

function passwordIncorrect() {
  /* Shake it! */
  var sphere = $("#password-sphere-outer");
  sphere.addClass("denied");
  setTimeout(function() { sphere.removeClass("denied") }, 500);

  /* Angrily! */
  var overlay = $("#password-sphere-overlay");
  overlay.fadeTo(0, 1);
  overlay.show();
  overlay.fadeTo(1000, 0);
}

function login() {
  $.ajax({
    type: "POST",
    url: "/login/",
    data: $("#password-form").serialize(),
    async: true,
    success: function(response, status, xhr) {
      openSesame();
    },
    error: function(xhr, status, message) {
      passwordIncorrect();
    }
  });

  return false;
}

$("#password-form").submit(login);
