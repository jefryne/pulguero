(function($) {
  'use strict';
  $.fn.andSelf = function() {
    return this.addBack.apply(this, arguments);
  }
  $(function() {
    if ($("#currentBalanceCircle").length) {
      var bar = new ProgressBar.Circle(currentBalanceCircle, {
        color: '#000',
        // This has to be the same size as the maximum width to
        // prevent clipping
        strokeWidth: 12,
        trailWidth: 12,
        trailColor: '#0d0d0d',
        easing: 'easeInOut',
        duration: 1400,
        text: {
          autoStyleContainer: false
        },
        from: { color: '#d53f3a', width: 12 },
        to: { color: '#d53f3a', width: 12 },
        // Set default step function for all animate calls
        step: function(state, circle) {
          circle.path.setAttribute('stroke', state.color);
          circle.path.setAttribute('stroke-width', state.width);
      
          var value = Math.round(circle.value() * 100);
          circle.setText('');
      
        }
      });

      bar.text.style.fontSize = '1.5rem';
      bar.animate(0.4);  // Number from 0.0 to 1.0
    }
    if($('#audience-map').length) {
      $('#audience-map').vectorMap({
        map: 'world_mill_en',
        backgroundColor: 'transparent',
        panOnDrag: true,
        focusOn: {
          x: 0.5,
          y: 0.5,
          scale: 1,
          animate: true
        },
        series: {
          regions: [{
            scale: ['#3d3c3c', '#f2f2f2'],
            normalizeFunction: 'polynomial',
            values: {

              "BZ": 75.00,
              "US": 56.25,
              "AU": 15.45,
              "GB": 25.00,
              "RO": 10.25,
              "GE": 33.25
            }
          }]
        }
      });
    }
    if ($("#transaction-history").length) {
      console.log("se llego");
      $.ajax({
        url: 'http://localhost/pulguero/pulguero/index.php/Dashboard/getCategory', // La URL para la petición se debe cambiar en cada navegador hasta definir el dominio
        type: "GET",
        dataType: "json",
        success: function(data){
          console.log(data);
          var categoryNames = data.map(item => item.category_name);
          var totalSold = data.map(item => item.total_sold);
          console.log(categoryNames);
          // Inserción de categorías en el dashboard en el chart
          var areaData = {
            labels: categoryNames,
            datasets: [{
              data: totalSold,
              backgroundColor: [
                "#111111","#00d25b","#ffab00"
              ]
            }]
          };
          var areaOptions = {
            responsive: true,
            maintainAspectRatio: true,
            segmentShowStroke: false,
            cutoutPercentage: 70,
            elements: {
              arc: {
                  borderWidth: 0
              }
            },      
            legend: {
              display: false
            },
            tooltips: {
              enabled: true
            }
          }
          var transactionhistoryChartPlugins = {
            beforeDraw: function(chart) {
              var width = chart.chart.width,
                  height = chart.chart.height,
                  ctx = chart.chart.ctx;
          
              ctx.restore();
              var fontSize = 1;
              ctx.font = fontSize + "rem sans-serif";
              ctx.textAlign = 'left';
              ctx.textBaseline = "middle";
              ctx.fillStyle = "#ffffff";
          
              var text = "Estadisticas de ventas", 
                  textX = Math.round((width - ctx.measureText(text).width) / 2),
                  textY = height / 2.4;
          
              ctx.fillText(text, textX, textY);
    
              ctx.restore();
              var fontSize = 0.75;
              ctx.font = fontSize + "rem sans-serif";
              ctx.textAlign = 'left';
              ctx.textBaseline = "middle";
              ctx.fillStyle = "#6c7293";
    
              var texts = "basadas en las categorias", 
                  textsX = Math.round((width - ctx.measureText(text).width) / 2.1),
                  textsY = height / 2.1;
          
              ctx.fillText(texts, textsX, textsY);
              ctx.save();
            }
          }
          var transactionhistoryChartCanvas = $("#transaction-history").get(0).getContext("2d");
          var transactionhistoryChart = new Chart(transactionhistoryChartCanvas, {
            type: 'doughnut',
            data: areaData,
            options: areaOptions,
            plugins: transactionhistoryChartPlugins
          });

          // Inserción de categorías en el dashboard en texto
          var container = $("#categoryContainer");

          container.empty();
          console.log("Se llegó a la inserción de categorías");
          console.log(categoryNames+" si aja"+totalSold);
          categoryNames.forEach(function(categoryNames, index){
            console.log("se llego aca felizx2");
            var categoryDiv = $('<div class="bg-gray-dark d-flex d-md-block d-xl-flex flex-row py-3 px-4 px-md-3 px-xl-4 rounded mt-3">' +
                '<div class="text-md-center text-xl-left">' +
                '<h6 class="mb-1">' + categoryNames + '</h6>' +
                '</div>' +
                '<div class="align-self-center flex-grow text-right text-md-center text-xl-right py-md-2 py-xl-0">' +
                '<h6 class="font-weight-bold mb-0">' + totalSold[index] + '</h6>' +
                '</div>' +
                '</div>');
            container.append(categoryDiv);
          });
        },
        error: function(xhr, status, error) {
          console.error(error);
        }
      });
    }
    if ($("#transaction-history-arabic").length) {
      var areaData = {
        labels: ["Vestidos", "Pañaleras","Medias"],
        datasets: [{
            data: [236, 593, 120],
            backgroundColor: [
              "#111111","#00d25b","#ffab00"
            ]
          }
        ]
      };
      var areaOptions = {
        responsive: true,
        maintainAspectRatio: true,
        segmentShowStroke: false,
        cutoutPercentage: 70,
        elements: {
          arc: {
              borderWidth: 0
          }
        },      
        legend: {
          display: false
        },
        tooltips: {
          enabled: true
        }
      }
      var transactionhistoryChartPlugins = {
        beforeDraw: function(chart) {
          var width = chart.chart.width,
              height = chart.chart.height,
              ctx = chart.chart.ctx;
      
          ctx.restore();
          var fontSize = 1;
          ctx.font = fontSize + "rem sans-serif";
          ctx.textAlign = 'left';
          ctx.textBaseline = "middle";
          ctx.fillStyle = "#ffffff";
      
          var text = "$1200", 
              textX = Math.round((width - ctx.measureText(text).width) / 2),
              textY = height / 2.4;
      
          ctx.fillText(text, textX, textY);

          ctx.restore();
          var fontSize = 0.75;
          ctx.font = fontSize + "rem sans-serif";
          ctx.textAlign = 'left';
          ctx.textBaseline = "middle";
          ctx.fillStyle = "#6c7293";

          var texts = "مجموع", 
              textsX = Math.round((width - ctx.measureText(text).width) / 1.93),
              textsY = height / 1.7;
      
          ctx.fillText(texts, textsX, textsY);
          ctx.save();
        }
      }
      var transactionhistoryChartCanvas = $("#transaction-history-arabic").get(0).getContext("2d");
      var transactionhistoryChart = new Chart(transactionhistoryChartCanvas, {
        type: 'doughnut',
        data: areaData,
        options: areaOptions,
        plugins: transactionhistoryChartPlugins
      });
    }
    if ($('#owl-carousel-basic').length) {
      $('#owl-carousel-basic').owlCarousel({
        loop: true,
        margin: 10,
        dots: false,
        nav: true,
        autoplay: true,
        autoplayTimeout: 4500,
        navText: ["<i class='mdi mdi-chevron-left'></i>", "<i class='mdi mdi-chevron-right'></i>"],
        responsive: {
          0: {
            items: 1
          },
          600: {
            items: 1
          },
          1000: {
            items: 1
          }
        }
      });
    }
    var isrtl = $("body").hasClass("rtl");
    if ($('#owl-carousel-rtl').length) {
      $('#owl-carousel-rtl').owlCarousel({
        loop: true,
        margin: 10,
        dots: false,
        nav: true,
        rtl: isrtl,
        autoplay: true,
        autoplayTimeout: 4500,
        navText: ["<i class='mdi mdi-chevron-right'></i>", "<i class='mdi mdi-chevron-left'></i>"],
        responsive: {
          0: {
            items: 1
          },
          600: {
            items: 1
          },
          1000: {
            items: 1
          }
        }
      });
    }
    });
})(jQuery);



