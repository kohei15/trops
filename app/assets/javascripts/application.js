// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery
//= require jquery3
//= require jquery_ujs
//= require activestorage
//= require turbolinks
//= require_tree .
//= require popper
//= require bootstrap-sprockets
//= require infinite-scroll.pkgd.min

function spinner(counter){
    var step = 0.25;
    var min = 0.0;
    var max = 10.0;

    var food_quantity = $(".food_quantity").val();
    var food_quantity = parseFloat(food_quantity);
      if (counter == 'up') { food_quantity += step; };
      if (counter == 'down') { food_quantity -= step; };

    if ( food_quantity < min ) { food_quantity = min; };
    if ( max < food_quantity ) { food_quantity = max; };

    $(".food_quantity").val(food_quantity);
}

$(document).on('turbolinks:load', function() {
    $('#smoothies').infiniteScroll({
  // options
  path: '.pagination__next',
  append: '.page',
  history: true,
  prefill: true,
  hideNav: '.pagination__next',
  status: '.page-load-status',
    });
    console.log("init");
 });