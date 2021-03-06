//// 2) CSVから２次元配列に変換
//function csv2Array(str) {
//    var csvData = [];
//    var lines = str.split("\n");
//    for (var i = lines.length-1; i > 0; i--) {
//      var cells = lines[i].split(",");
//      csvData.push(cells);
//    }
//    return csvData;
//  }
//
//  function drawBarChart(data) {
//    // 3)chart.jsのdataset用の配列を用意
//    var tmpLabels = [], tmpData1 = [], tmpData2 = [], tmpData3 = [],
//     tmpData4 = [], tmpData5 = [], tmpData6 = [], tmpData7 = [];
//    for (var row in data) {
//      tmpLabels.push(data[row][0])
//      tmpData1.push(data[row][1])
//      tmpData2.push(data[row][2])
//      tmpData3.push(data[row][3])
//      tmpData4.push(data[row][4])
//      tmpData5.push(data[row][5])
//      tmpData6.push(data[row][6])
//      tmpData7.push(data[row][7])
//    };
//    var color = Chart.helpers.color;
//    // 4)chart.jsで描画
//    var ctx = document.getElementById("myChart").getContext("2d");
//    var myChart = new Chart(ctx, {
//      type: 'line',
//      //bar,line
//      data: {
//        labels: tmpLabels,
//        // datasets: [
//        //   { label: "始値", data: tmpData1, backgroundColor: window.chartColors.red,
//        //   borderColor: window.chartColors.red,fill: false },
//        //   { label: "高値", data: tmpData2, backgroundColor: window.chartColors.blue,
//        //   borderColor: window.chartColors.blue ,fill: false},
//        //   { label: "安値", data: tmpData3, backgroundColor: window.chartColors.yellow,
//        //   borderColor: window.chartColors.yellow ,fill: false},
//        //   { label: "終値", data: tmpData4, backgroundColor: window.chartColors.green,
//        //   borderColor: window.chartColors.green ,fill: false},
//        //   { label: "移動平均5日", data: tmpData5, backgroundColor: window.chartColors.orange,
//        //   borderColor: window.chartColors.orange,fill: false },
//        //   { label: "移動平均25日", data: tmpData6, backgroundColor: window.chartColors.purple,
//        //   borderColor: window.chartColors.purple ,fill: false},
//        //   { label: "平均出来高", data: tmpData7, backgroundColor: window.chartColors.grey,
//        //   borderColor: window.chartColors.grey ,fill: true},
//        // ],
//
//
//        datasets: [
//          { label: "始値", data: tmpData1,
//          backgroundColor:color(window.chartColors.red).alpha(0.5).rgbString(),
//          borderColor: window.chartColors.red,
//          pointRadius: 0,lineTension: 0,borderWidth: 2,
//          fill: false },
//          { label: "高値", data: tmpData2,
//          backgroundColor: color(window.chartColors.blue).alpha(0.5).rgbString(),
//          borderColor: window.chartColors.blue ,
//          pointRadius: 0,lineTension: 0,borderWidth: 2,
//          fill: false},
//          { label: "安値", data: tmpData3,
//          backgroundColor: color(window.chartColors.yellow).alpha(0.5).rgbString(),
//          borderColor: window.chartColors.yellow ,
//          pointRadius: 0,lineTension: 0,borderWidth: 2,
//          fill: false},
//          { label: "終値", data: tmpData4,
//          backgroundColor: color(window.chartColors.green).alpha(0.5).rgbString(),
//          borderColor: window.chartColors.green ,
//          pointRadius: 0,lineTension: 0,borderWidth: 2,
//          fill: false},
//          { label: "移動平均5日", data: tmpData5,
//          backgroundColor: color(window.chartColors.orange).alpha(0.5).rgbString(),
//          borderColor: window.chartColors.orange,
//          pointRadius: 0,lineTension: 0,borderWidth: 2,
//          fill: false },
//          { label: "移動平均25日", data: tmpData6,
//          backgroundColor: color(window.chartColors.purple).alpha(0.5).rgbString(),
//          borderColor: window.chartColors.purple ,
//          pointRadius: 0,lineTension: 0,borderWidth: 2,
//          fill: false},
//          { label: "平均出来高", data: tmpData7,
//          backgroundColor: color(window.chartColors.grey).alpha(0.5).rgbString(),
//          borderColor: window.chartColors.grey ,
//          pointRadius: 0,lineTension: 0,borderWidth: 2,
//          fill: true},
//          ],
//      },
//    // options: {
//    //     responsive: true,
//    //     title: {
//    //         display: true,
//    //         text: 'Chart.js Line Chart'
//    //     },
//    //     tooltips: {
//    //         mode: 'index',
//    //         intersect: false,
//    //     },
//    //     hover: {
//    //         mode: 'nearest',
//    //         intersect: true
//    //     },
//    //     scales: {
//    //         x: {
//    //             display: true,
//    //             scaleLabel: {
//    //                 display: true,
//    //                 labelString: 'Month'
//    //             }
//    //         },
//    //         y: {
//    //             display: true,
//    //             scaleLabel: {
//    //                 display: true,
//    //                 labelString: 'Value'
//    //             }
//    //         }
//    //     },
//    // }
//    options: {
//      title:{
//        display:true,
//        text:'日経平均指数'
//      },
//      animation: {
//          duration: 0
//      },
//      hover: {
//            mode: 'nearest',
//            intersect: true
//      },
//      scales: {
//          x: {
//              type: 'timeseries',
//              offset: true,
//              ticks: {
//                  major: {
//                      enabled: true,
//                  },
//                  font: function(context) {
//                      return context.tick && context.tick.major ? {style: 'bold'} : undefined;
//                  },
//                  source: 'data',
//                  autoSkip: true,
//                  autoSkipPadding: 75,
//                  maxRotation: 0,
//                  sampleSize: 100
//              },
//
//          // Custom logic that chooses major ticks by first timestamp in time period
//          // E.g. if March 1 & 2 are missing from dataset because they're weekends, we pick March 3 to be beginning of month
//          afterBuildTicks: function(scale) {
//              var majorUnit = scale._majorUnit;
//              var ticks = scale.ticks;
//              var firstTick = ticks[0];
//
//              let val = luxon.DateTime.fromMillis(ticks[0].value);
//              if ((majorUnit === 'minute' && val.second === 0)
//                      || (majorUnit === 'hour' && val.minute === 0)
//                      || (majorUnit === 'day' && val.hour === 9)
//                      || (majorUnit === 'month' && val.day <= 3 && val.weekday === 1)
//                      || (majorUnit === 'year' && val.month === 1)) {
//                  firstTick.major = true;
//              } else {
//                  firstTick.major = false;
//              }
//              let lastMajor = val.get(majorUnit);
//
//              for (let i = 1; i < ticks.length; i++) {
//                  var tick = ticks[i];
//                  val = luxon.DateTime.fromMillis(tick.value);
//                  var currMajor = val.get(majorUnit);
//                  tick.major = currMajor !== lastMajor;
//                  lastMajor = currMajor;
//              }
//              scale.ticks = ticks;
//          }
//      },
//      y: {
//          type: 'linear',
//          gridLines: {
//              drawBorder: false
//          },
//          scaleLabel: {
//              display: true,
//              labelString: 'Closing price'
//          }
//      }
//  },
//  tooltips: {
//      intersect: false,
//      mode: 'index',
//      callbacks: {
//          label: function(context) {
//              let label = context.dataset.label || '';
//              if (label) {
//                  label += ': ';
//              }
//              label += context.dataPoint.y.toFixed(2);
//              return label;
//              }
//          }
//      }
//  }
//    });
//  }
//
//
//window.onload =function() {
//    // 1) ajaxでCSVファイルをロード
//    var req = new XMLHttpRequest();
//    var filePath = 'http://localhost:8080/newproject/stock/data/data0.csv';
//    req.open("GET", filePath, true);
//    req.onload = function() {
//      // 2) CSVデータ変換の呼び出し
//      data = csv2Array(req.responseText);
//      // 3) chart.jsデータ準備、4) chart.js描画の呼び出し
//      drawBarChart(data);
//    }
//    req.send(null);
//
//
//  };
//
//
