const ctxs = document.getElementById('myChartLine');
  new Chart(ctxs, {
    type: 'line',
    data: {
      labels: ['12:00', '13:00', '14:00', '15:00', '16:00', '17:00'],
      datasets: [{
        label: 'Temperatura',
        data: [30, 29, 28, 25, 22, 23],
        borderWidth: 1,
        backgroundColor: '#ff6384',
        borderColor: '#ff6384'
      },
      {
        label: 'Umidade',
        data: [80, 82, 80, 85, 80, 83],
        borderWidth: 1,
        backgroundColor: '#36a2eb',
        borderColor: '#36a2eb'
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
        label: 'Temperatura Média',
        data: [22, 24, 27, 23, 20, 18],
        backgroundColor: '#ff6384',
      },
      {
        label: 'Umidade Média',
        data: [90, 89, 93, 87, 88, 82],
        backgroundColor: '#36a2eb',
      }
      ]
    },
  });