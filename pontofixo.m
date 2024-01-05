% Função para encontrar a solução de uma equação pelo método do ponto fixo.
%
% Entradas:
%   - funcaoIteradora: Função do ponto fixo para iteração.
%   - valorInicial: Valor inicial da iteração o X0 = 0 e X0 = 0.8 
%   - erroMax: Tolerância máxima de erro aceitável.
%   - numMaxIteracoes: Número máximo de iterações permitidas.
%
function [solucao, erroFinal, iteracoes, errosLog] = pontofixo(funcaoIteradora, valorInicial, erroMax, numMaxIteracoes)
% Saídas:
%   - solucao: Aproximação da solução encontrada.
%   - erroFinal: Erro entre a solução encontrada e o valor inicial.
%   - iteracoes: Número de iterações realizadas para encontrar a solução.
%   - errosLog: Log dos erros durante as iterações.
%
% Este método realiza iterações até que o erro entre iterações consecutivas
% seja menor que o erroMax especificado ou o número máximo de iterações seja atingido.
% A cada iteração, o valor de "solucao" é atualizado de acordo com a "funcaoIteradora".
% Os resultados são retornados quando a condição de parada é atingida.

% UC: 21180 - Computação Numérica
% Ano 2023/24 - AF1- UAb
% Aluno: 2100927 - Ivo Baptista

    % Inicialização
    solucao = funcaoIteradora(valorInicial);
    iteracoes = 0;
    errosLog = [];

    % Iteração do método do ponto fixo
    while abs(solucao - valorInicial) > erroMax && iteracoes < numMaxIteracoes
        valorInicial = solucao;
        solucao = funcaoIteradora(valorInicial);
        errosLog = [errosLog, log10(abs(solucao - valorInicial))]; % Armazenar o erro em escala logarítmica
        iteracoes = iteracoes + 1;
    end

    erroFinal = abs(solucao - valorInicial); % Erro final
end
%EOF