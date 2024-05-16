var database = require("../database/config")

function autenticar(email, senha) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function entrar(): ", email, senha)
    var instrucaoSql = `
        SELECT id, nome, email, fk_empresa as empresaId FROM usuario WHERE email = '${email}' AND senha = '${senha}';
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

// Coloque os mesmos parâmetros aqui. Vá para a var instrucaoSql
function cadastrar(empresa, celular, representante, senha, email, cnpj) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function cadastrar():", empresa, celular, representante, senha, email, cnpj);
    
    // Insira exatamente a query do banco aqui, lembrando da nomenclatura exata nos valores
    //  e na ordem de inserção dos dados.
    var instrucaoSqlEmpresa = `
        INSERT INTO empresa (cnpj, nome) VALUES ('${cnpj}', '${empresa}');
        `;

    var instrucaoSqlUsuario = `
    INSERT INTO usuario (nome, email, senha, celular, fkEmpresa) VALUES ('${representante}', '${email}', '${senha}', '${celular}', '${cnpj}');
        `;

        console.log("Executando a instrução SQL Empresa: \n" + instrucaoSqlEmpresa);
        console.log("Executando a instrução SQL Usuario: \n" + instrucaoSqlUsuario);
        
        // Execute cada instrução SQL separadamente
        database.executar(instrucaoSqlEmpresa);
        return database.executar(instrucaoSqlUsuario);
}

module.exports = {
    autenticar,
    cadastrar
};