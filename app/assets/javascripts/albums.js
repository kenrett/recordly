function toggleStar() {
  $('.glyphicon').on("click", function () {
    var img1 = "glyphicon-star-empty",
        img2 = "glyphicon-star";

    $(this).toggleClass(img1).toggleClass(img2);
  });
}

$(document).on("ready", function () {
  if ($('.all-albums').length) {
    toggleStar();
  }
});