"use strict";

function openSesame() {
  $("#door-l").css("transform", "translateX(-150%)");
  $("#door-r").css("transform", "translateX(150%)");
}

$("#password-button").click(openSesame);
