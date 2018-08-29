$(document).on('turbolinks:load', function() {
  $("#new_user").validate({
    rules: {
      "user[user_name]": {
        required: true,
        maxlength: 30
      },
      "user[full_name]": {
        required: true,
        maxlength: 50
      },
      "user[password]":{
        required: true
      }
    },
    messages: {
      "user[user_name]": {
          required:  I18n.t("model.user.enter_val", {val: I18n.t("model.user.user_name")}),
          maxlength: I18n.t("model.user.character_validation", {val: I18n.t("model.user.user_name"), num: 30})
      },
      "user[full_name]": {
          required:  I18n.t("model.user.enter_val", {val: I18n.t("model.user.full_name")}),
          maxlength: I18n.t("model.user.character_validation", {val: I18n.t("model.user.full_name"), num: 50})
      },
      "user[password]": {
          required:  I18n.t("model.user.enter_val", {val: I18n.t("model.user.password")})
      }
    }
  });
});


$(function() {
  setTimeout(function(){
    $('.flash-msg').slideUp(800);
  }, 1500);
});

// Get the image and insert it inside the modal - use its "alt" text as a caption
$(document).on('click', '.display-pic', function(event){
  var modal             = document.getElementById('myModal');
  var modalImg          = document.getElementById("full_view_image");
  var captionText       = document.getElementById("caption");
  modal.style.display = "block";
  // $(window).scrollTop(0);
  modalImg.src          = this.src;
  captionText.innerHTML = this.alt;
});


$(document).on('click', '.close', function(event){
  var modal             = document.getElementById('myModal');
  modal.style.display   = "none";
})
