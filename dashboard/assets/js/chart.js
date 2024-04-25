let temp = []
let umidade = []

for (let i = 1; i <= 6; i++) {  
  temp.push(Math.round(Math.random() * 8));
  umidade.push(Math.round(Math.random() * (75 - 65) + 65));
}

console.log(temp, umidade);

const ctxs = document.getElementById('myChartLine');
let graphLine = new Chart(ctxs, {
    type: 'line',
    options: {
      scales: {
        y: {
          max: 10,
          min: -2
        },
      }
    },
    data: {
      labels: ['12:00', '13:00', '14:00', '15:00', '16:00', '17:00'],
      datasets: [{
        label: 'Temperatura',
        data: temp,
        borderWidth: 1,
        backgroundColor: '#ff6384',
        borderColor: '#ff6384'
      },
      ]
    },
  });
  
  
  
  const ctx = document.getElementById('myChartBar');
  let graphBar = new Chart(ctx, {
    type: 'bar',
    options: {
      scales: {
        y: {
          max: 80,
          min: 50
        },
      }
    },
    data: {
      labels: ['Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho'],
      datasets: [{
        label: 'Umidade Média',
        data: umidade,
        label: 'Umidade',
        backgroundColor: '#7FA9C7',
      }
    ]
  },
});

setInterval(function() {
  temp.unshift(Math.round(Math.random() * 8))
  temp.pop();
  umidade.unshift(Math.round(Math.random() * (75 - 65) + 65));
  umidade.pop();
  graphLine.data.datasets[0].data = temp;
  graphLine.update('active');
  graphBar.data.datasets[0].data = umidade;
  graphBar.update('active');
}, 2000);