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

var myRadar;

//合計の計算
function updateEiyouso() {
  var protein_sum = 0;
  var calcium_sum = 0;
  var kalium_sum = 0;
  var vitaminc_sum = 0;
  var magnesium_sum = 0;
  var kcal_sum = 0;

  console.log(myRadar.data);

  $( '.food_quantity' ).each(function() {
    var food_quantity = parseFloat($(this).val());
    // プロテインの合計値
    var protein = $(this).data('protein');
    protein_sum += food_quantity * protein;

    // カルシウムの合計値
    var calcium = $(this).data('calcium');
    calcium_sum += food_quantity * calcium;

    // カリウムの合計値
    var kalium = $(this).data('kalium');
    kalium_sum += food_quantity * kalium;

    // ビタミンCの合計値
    var vitaminc = $(this).data('vitaminc');
    vitaminc_sum += food_quantity * vitaminc;

    // マグネシウムの合計値
    var magnesium = $(this).data('magnesium');
    magnesium_sum += food_quantity * magnesium;

    // カロリーの合計値
    var kcal = $(this).data('kcal');
    kcal_sum += food_quantity * kcal;
  });

  // 栄養素の合計値をテキスト形式に変換
  $("#protein_sum").text(protein_sum);
  $("#calcium_sum").text(calcium_sum);
  $("#kalium_sum").text(kalium_sum);
  $("#magnesium_sum").text(magnesium_sum);
  $("#vitaminc_sum").text(vitaminc_sum);
  $("#kcal_sum").text(kcal_sum);

  // 合計値をグラフに反映
  myRadar.data.datasets[0].data[0] = protein_sum
  myRadar.data.datasets[0].data[1] = calcium_sum
  myRadar.data.datasets[0].data[2] = kalium_sum
  myRadar.data.datasets[0].data[3] = vitaminc_sum
  myRadar.data.datasets[0].data[4] = magnesium_sum

  // 数量の変更を反映
  myRadar.update();
}


// 数量入力スピナー
function spinner(counter, i){
  var step = 0.5;
  var min = 0.0;
  var max = 10.0;

  var food_quantity = $(".food_quantity_" + i).val();
  var food_quantity = parseFloat(food_quantity);
    if (counter == 'up') { food_quantity += step; };
    if (counter == 'down') { food_quantity -= step; };

  if ( food_quantity < min ) { food_quantity = min; };
  if ( max < food_quantity ) { food_quantity = max; };

  // 「food_quantity」の値を取得
  $(".food_quantity_" + i).val(food_quantity);
  updateEiyouso();
}


// レーダーチャート
$(document).ready(function () {
  $('.food_quantity').on('change', function() {
    updateEiyouso();
  });

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

  var eiyou_list = $("#myChart").data("target").split(',')
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
        data: [0, 0, 0, 0, 0]
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
  myRadar = new Chart($("#myChart"), config);
});

// 無限スクロール
$('.page').on('turbolinks:load', function() {
  $('#smoothies').infiniteScroll({
    // options
    path: '.pagination__next',
    append: '.page',
    history: true,
    prefill: true,
    hideNav: '.pagination__next',
    status: '.page-load-status',
  });
});