function newUserSetup() {
  $.ajax({
    type:  "POST",
    url:   "/setup/",
    data:  $("#setup-form").serialize(),
    async: true,
    success: function () {
      alert("Great success!");
    },
    error: function(xhr, status, message) {
      alert("Horrible errors!");
    }
  });

  return false;
}

$("#setup-form").submit(newUserSetup);
