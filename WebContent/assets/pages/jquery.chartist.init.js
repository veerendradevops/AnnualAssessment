//Horizontal bar chart

new Chartist.Bar('#horizontal-bar-chart', {
  labels: ['Completed', 'Salary Review', 'Manager Review', 'Started', 'Not Started'],
  series: [
    [6, 13, 18, 25, 15, 2]
  ]
}, {
  seriesBarDistance: 300,
  reverseData: true,
  horizontalBars: true,
  axisY: {
    offset: 80
  },
  axisX: {
    offset: 50
  },
  plugins: [
    Chartist.plugins.tooltip()
  ]
});


new Chartist.Bar('#horizontal-bar-chart1', {
  labels: ['Manager Review', 'Started', 'Not Started'],
  series: [
    [1, 1, 5]
  ]
}, {
  seriesBarDistance: 30,
  reverseData: true,
  horizontalBars: true,
  axisY: {
    offset: 80
  },
  axisX: {
    offset: 50
  },
  plugins: [
    Chartist.plugins.tooltip()
  ]
});