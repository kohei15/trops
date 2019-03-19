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


// 数量入力スピナー
function spinner(counter, i){
    var step = 0.25;
    var min = 0.0;
    var max = 10.0;

    var food_quantity = $(".food_quantity_" + i).val();
    var food_quantity = parseFloat(food_quantity);
      if (counter == 'up') { food_quantity += step; };
      if (counter == 'down') { food_quantity -= step; };

    if ( food_quantity < min ) { food_quantity = min; };
    if ( max < food_quantity ) { food_quantity = max; };

    $(".food_quantity_" + i).val(food_quantity);
}





// 無限スクロール
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



function keisan(i){

  // 設定開始

  // 商品1
  var price1 = $(".food_quantity_" + i).options[document.form1.goods1.selectedIndex].value;

  // 合計を計算
  var total = parseInt(price1) + parseInt(price2) + parseInt(price3);

  // 設定終了


  document.form1.field_total.value = total; // 合計を表示

}







