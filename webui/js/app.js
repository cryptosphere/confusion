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

  return false;
}

$("#create-invite-form").submit(sendInvite);
