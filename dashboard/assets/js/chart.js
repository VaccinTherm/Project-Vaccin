let temp = []
let umidade = []

for (let i = 1; i <= 6; i++) {  
  temp.push(Math.round(Math.random() * 8));
  umidade.push(Math.round(Math.random() * (75 - 65) + 65));
}

console.log(temp, umidade);

const ctxs = document.getElementById('myChartLine');
  new Chart(ctxs, {
    type: 'line',
    data: {
      labels: ['12:00', '13:00', '14:00', '15:00', '16:00', '17:00'],
      datasets: [{
        label: 'Temperatura',
        data: [temp[0], temp[1], temp[2], temp[3], temp[4], temp[5]],
        borderWidth: 1,
        backgroundColor: '#ff6384',
        borderColor: '#ff6384'
      },
      ]
    },
  });

  const ctx = document.getElementById('myChartBar');
  new Chart(ctx, {
    type: 'bar',
    data: {
      labels: ['Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho'],
      datasets: [{
        label: 'Umidade Média',
        data: [umidade[0], umidade[1], umidade[2], umidade[3], umidade[4], umidade[5]],
        label: 'Umidade',
        backgroundColor: '#7FA9C7',
      }
      ]
    },
  });