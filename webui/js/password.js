"use strict";

function openSesame() {
  $("#door-l").addClass("door-moving");
  $("#door-r").addClass("door-moving");
  $("#door-l").css("transform", "translateX(-150%)");
  $("#door-r").css("transform", "translateX(150%)");

  return false;
}

$("#password-form").submit(openSesame);
