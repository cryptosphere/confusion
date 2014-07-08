function showCreateInviteCodeModal() {
  $("#add-contact").modal("hide");

  setTimeout(function() {
    $("#create-invite-code").modal("show");
    setTimeout(function() { $("#new-contact-name").focus(); }, 500);
  }, 100);

  return true;
}

$("#create-contact-button").click(showCreateInviteCodeModal);

function sendInvite() {
  $("#create-invite-code").modal("hide");
  setTimeout(function() { $("#do-the-dance").modal("show"); }, 100);

  /* Fake out completing the "dance" */
  setTimeout(function() { inviteAccepted(); }, 3000);

  return false;
}

$("#create-invite-form").submit(sendInvite);

function inviteAccepted() {
  $("#do-the-dance").modal("hide");
  $("#caroline").removeClass("active");
  $("#bobline").addClass("active");
  $("#bobline").fadeIn();

  $(".page-header h1").text("Bob");
  $(".main table").hide();

  setTimeout(function() { $("#dance-successful").modal("show"); }, 100);
}
