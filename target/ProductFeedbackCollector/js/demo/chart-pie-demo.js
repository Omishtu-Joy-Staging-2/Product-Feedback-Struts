// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#858796';
console.log('pie chart log.......');

const pieLabelsEl = document.getElementById("pieLabels");
const pieValuesEl = document.getElementById("pieValues");

if (pieLabelsEl && pieValuesEl) {
  const pieLabels = JSON.parse(pieLabelsEl.textContent);
  const pieData = JSON.parse(pieValuesEl.textContent);

  const ctx = document.getElementById("myPieChart").getContext("2d");

  new Chart(ctx, {
    type: 'doughnut',
    data: {
      labels: pieLabels,
      datasets: [{
        data: pieData,
        backgroundColor: ['#4e73df', '#1cc88a', '#f6c23e', '#e74a3b', '#36b9cc'],
        hoverBackgroundColor: ['#2e59d9', '#17a673', '#dda20a', '#c0392b', '#2c9faf'],
        hoverBorderColor: "rgba(234, 236, 244, 1)"
      }]
    },
    options: {
      maintainAspectRatio: false,
      legend: { display: true, position: 'bottom' },
      tooltips: {
        backgroundColor: "rgb(255,255,255)",
        bodyFontColor: "#858796",
        borderColor: '#dddfeb',
        borderWidth: 1,
        xPadding: 15,
        yPadding: 15,
        displayColors: true,
        caretPadding: 10
      },
      cutoutPercentage: 60
    }
  });
}
