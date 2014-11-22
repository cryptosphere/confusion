function newUserSetup() {
  $.ajax({
    type:  "POST",
    url:   "/setup/",
    data:  $("#setup-form").serialize(),
    async: true,
    success: function () {
      $("#password-form").hide();
      $("#success-message").fadeIn();
    },
    error: function(xhr, status, message) {
      alert("Horrible errors!");
    }
  });

  return false;
}

$("#setup-form").submit(newUserSetup);
