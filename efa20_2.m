% UC: 21180 - Computação Numérica
% Ano 2023/24 - AF1- UAb
% Aluno: 2100927 - Ivo Baptista

clc         % Limpa a tela do terminal
close all   % Fecha os gráficos que estão abertos
clear all   % Limpa o valor das variáveis em memória

% Função iteradora
funcaoIteradora = @(x) exp(-x) * cos(x) / 1.1;

% Número máximo de iterações
numMaxIteracoes = 100;

% Limite superior da derivada da função iteradora
limiteDerivada = abs(exp(0) * (-cos(0) - sin(0)) / 1.1);


% Critério de Paragem com erro absoluto máximo desejado
erroDesejado = (1 - limiteDerivada) / limiteDerivada * 0.5e-6;

% Valor inicial para a primeira solução
valorInicial1 = 0;

% Verificamos a primeira solução valor 0, utilizando o método de ponto fixo
[solucao1, erro1, it1, logErro1] = pontofixo(funcaoIteradora, valorInicial1, erroDesejado, numMaxIteracoes);

% Valor inicial para a segunda solução
valorInicial2 = 0.8;

% Verificamos a segunda solução valor 0.8, utilizando o método de ponto fixo
[solucao2, erro2, it2, logErro2] = pontofixo(funcaoIteradora, valorInicial2, erroDesejado, numMaxIteracoes);

% Mostra os resultados na tela
fprintf("A solucao para x0 = 0 é %.8f, com %d iteracoes.\n", solucao1, it1);
fprintf("A solucao para x0 = 0.8 é %.8f, com %d iteracoes.\n", solucao2, it2);

% Índice começa 0, com o erro inicial |x1-x0|, este resultado é utlizado na função log10
indexErro1 = 0:it1-1;
indexErro2 = 0:it2-1;

% Gráfico de log10(εi) em função das iterações, solução correta
figure(1);

plot(indexErro1, logErro1, 'b-', indexErro2, logErro2, 'r--', 'LineWidth', 2); % o'r--' mostra a linha tracejada vermelha
title('Grafico {x,[log10(ε1),log10(ε2)]}','FontSize', 14, 'FontWeight', 'bold');
xlabel('Iteracoes');
ylabel('log10(\epsilon)');
legend(['Erro para x0 = ', num2str(valorInicial1)], ['Erro para x0 = ', num2str(valorInicial2)], "location", "northeast");
grid on;



% Outros testes mas foram descartados o grafico da figura 1 é a meu ver a solução correta.
% Gráfico de log10(εi) em função das iterações
% figure(2); clf;
% iter = max([it1, it2]); % Obter o maior número de iterações entre os dois métodos
% semilogy(0:it1-1, log10(logErro1), 'b-', 0:it2-1, log10(logErro2), 'r--', 'LineWidth', 2);
% xlabel('Iterações');
% ylabel('log10(\epsilon)');
% legend(['Erro para x0 = 0'], ['Erro para x0 = 0.8'], "location", "northeast");
% grid on;

% Gráfico de log10(εi) em função das iterações
% figure(3); clf;
% semilogy(1:it1, logErro1, 'b-', 1:it2, logErro2, 'r--', 'LineWidth', 2);
% xlabel('Iterações');
% ylabel('log10(\epsilon)');
% legend(['Erro para x0 = ', num2str(valorInicial1)], ['Erro para x0 = ', num2str(valorInicial2)], "location", "northeast");
% grid on;
%EOF
