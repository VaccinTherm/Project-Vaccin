const ctxs = document.getElementById('myChartLine');
  new Chart(ctxs, {
    type: 'line',
    data: {
      labels: ['12:00', '13:00', '14:00', '15:00', '16:00', '17:00'],
      datasets: [{
        label: 'Temperatura',
        data: [30, 29, 28, 25, 22, 23],
        borderWidth: 1,
        backgroundColor: '#7FA9C7',
        borderColor: '#7FA9C7'
      }

      ]
    },
  });

  const ctx = document.getElementById('myChartBar');
  new Chart(ctx, {
    type: 'bar',
    data: {
      labels: ['Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho'],
      datasets: [{
        label: 'Umidade',
        data: [60, 24, 27, 23, 20, 18],
        backgroundColor: '#7FA9C7',
      }
      ]
    },
  });