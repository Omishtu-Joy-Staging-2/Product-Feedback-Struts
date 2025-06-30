// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#858796';

// Pie Chart Example
// Pie Chart - Feedback Category Breakdown
var ctx = document.getElementById("myPieChart");
var myPieChart = new Chart(ctx, {
  type: 'doughnut',
  data: {
    labels: ["Feature Requests", "Bugs/Issues", "Complaints", "Compliments", "General Feedback"],
    datasets: [{
      data: [25, 20, 15, 30, 10],
      backgroundColor: [
        '#4e73df', // Feature Requests
        '#1cc88a', // Bugs/Issues
        '#e74a3b', // Complaints (red)
        '#36b9cc', // Compliments
        '#f6c23e'  // General Feedback (yellow)
      ],
      hoverBackgroundColor: [
        '#2e59d9',
        '#17a673',
        '#be2617',
        '#2c9faf',
        '#dda20a'
      ],
      hoverBorderColor: "rgba(234, 236, 244, 1)",
    }],
  },
  options: {
    maintainAspectRatio: false,
    tooltips: {
      backgroundColor: "rgb(255,255,255)",
      bodyFontColor: "#858796",
      borderColor: '#dddfeb',
      borderWidth: 1,
      xPadding: 15,
      yPadding: 15,
      displayColors: false,
      caretPadding: 10,
      callbacks: {
        label: function(tooltipItem, data) {
          var label = data.labels[tooltipItem.index] || '';
          var value = data.datasets[tooltipItem.datasetIndex].data[tooltipItem.index];
          var percentage = Math.round((value / data.datasets[tooltipItem.datasetIndex].data.reduce((a, b) => a + b, 0)) * 100);
          return label + ': ' + value + ' (' + percentage + '%)';
        }
      }
    },
    legend: {
      display: false
    },
    cutoutPercentage: 80,
  },
});

// Update the legend text below the pie chart
document.querySelector('.chart-pie + .text-center').innerHTML = `
  <span class="mr-2">
    <i class="fas fa-circle text-primary"></i> Feature Requests
  </span>
  <span class="mr-2">
    <i class="fas fa-circle text-success"></i> Bugs/Issues
  </span>
  <span class="mr-2">
    <i class="fas fa-circle text-danger"></i> Complaints
  </span>
  <span class="mr-2">
    <i class="fas fa-circle text-info"></i> Compliments
  </span>
  <span class="mr-2">
    <i class="fas fa-circle text-warning"></i> General
  </span>
`;
