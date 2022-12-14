function fixedAnime(){
  // const headerH = $('#menu-nav').outerHeight(true);
  const scroll = $(window).scrollTop();
  if(scroll>=185){
    $('#menu-nav').addClass('fixed');
  }else{
    $('#menu-nav').removeClass('fixed');
  }
};

$(window).scroll(function () {
	fixedAnime();
  console.log("ok");
});