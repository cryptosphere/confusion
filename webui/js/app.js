function showCreateInviteCodeModal() {
  $("#add-contact").modal("hide");

  setTimeout(function() {
    $("#create-invite-code").modal("show");
    setTimeout(function() { $("#new-contact-name").focus(); }, 500);
  }, 100);

  return true;
}

$("#create-contact-button").click(showCreateInviteCodeModal);
