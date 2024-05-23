var database = require("../database/config");

function buscarUltimasMedidas(idSensor, limite_linhas) {

    var instrucaoSql = `      SELECT 
    dht11_temperatura as temperatura, 
    dht11_umidade as umidade,
    dataHora,
                    DATE_FORMAT(dataHora,'%H:%i:%s') as momento_grafico
                FROM registro
                WHERE registro.fkSensor_registro = ${idSensor}
                    ORDER BY id DESC LIMIT ${limite_linhas}`;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function buscarMedidasEmTempoReal(idSensor) {

    var instrucaoSql = `SELECT 
        dht11_temperatura as temperatura, 
        dht11_umidade as umidade,
                        DATE_FORMAT(data_Hora,'%H:%i:%s') as momento_grafico, 
                        registro.fkSensor_registro
                        FROM registro WHERE registro.fkSensor_registro = ${idSensor} 
                    ORDER BY id DESC LIMIT 1`;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

module.exports = {
    buscarUltimasMedidas,
    buscarMedidasEmTempoReal
}
