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



 // レーダーチャート
$(document).ready(function () {
// 変数の定義（自分で追加）
// var protein =  ;
// var calcium =  ;
// var kalium =  ;
// var magnesium =  ;
// var vitaminc =  ;

// 色の設定
var colorSet = {
  red: 'rgb(255, 99, 132)',
  orange: 'rgb(255, 159, 64)',
  yellow: 'rgb(255, 205, 86)',
  green: 'rgb(75, 192, 192)',
  blue: 'rgb(54, 162, 235)',
  purple: 'rgb(153, 102, 255)',
  grey: 'rgb(201, 203, 207)'
};

// 色のRGB変換
var color = Chart.helpers.color;

// チャートの初期設定
var config = {
  type: 'radar',
  data: {
    labels: ["たんぱく質", "カルシウム", "カリウム", "マグネシウム", "ビタミンC"],
    datasets: [{
      label: "１杯あたりの栄養素",
      backgroundColor: color(colorSet.red).alpha(0.5).rgbString(),
      borderColor: colorSet.red,
      pointBackgroundColor: colorSet.red,
      data: [100, 100, 100, 100, 100]
    },]
  },
  options: {
    animation:false,
    showTooltips: false,
    legend: { position: 'bottom' },
    title: {
      display: true,
      fontSize:20,
      fontColor:'#666',
      text: '栄養成分チャート'
    },
    responsive: true,
    scale: {
      display: true,
      pointLabels: {
        fontSize: 15,
        fontColor: colorSet.red
      },
      ticks: {
        display: true,
        fontSize: 12,
        min: 0,
        max: 100,
        stepSize: 10,
        beginAtZero: true
      },
      gridLines: {
        display: true,
        color: colorSet.grey
      }
    }
  }
};

// チャートの作成
var myRadar = new Chart($("#myChart"), config);
});