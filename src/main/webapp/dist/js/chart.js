  var chartData =  org.json.JSONArray().toString() ;

    var labels = [];
    var values = [];
    chartData.forEach(function(data) {
      labels.push(data.label);
      values.push(data.value);
    });

    var ctx = document.getElementById('myChart').getContext('2d');
    var myChart = new Chart(ctx, {
      type: 'line',
      data: {
        labels: labels,
        datasets: [{
          label: 'Tổng số tiền theo tháng',
          data: values,
          fill: true,
          backgroundColor: 'rgba(75, 192, 192, 0.2)',
          borderColor: 'rgba(75, 192, 192, 1)',
          borderWidth: 1
        }]
      },
      options: {
        scales: {
          y: {
            beginAtZero: true,
            ticks: {
              callback: function(value, index, values) {
                return value.toLocaleString() + 'đ';
              }
            }
          }
        },
        plugins: {
          tooltip: {
            callbacks: {
              label: function(context) {
                var label = context.dataset.label || '';
                var value = context.parsed.y.toLocaleString() + 'đ';
                return label + ': ' + value;
              }
            }
          }
        }
      }
    });