% UC: 21180 - Computação Numérica
% Ano 2023/24 - AF1- UAb
% Aluno: 2100927 - Ivo Baptista

clc         % Limpa a tela do terminal
close all   % Fecha os gráficos que estão abertos
clear all   % Limpa o valor das variáveis em memória

% Define a função g(x)
g = @(x) exp(-x) .* cos(x) - 1.1 * x;


% Define o intervalo [0, 1] com pelo menos 100 pontos
x = linspace(0, 1, 100);

% Avalia a função f(x) e a derivada f'(x) em todos os pontos de x
y = g(x);

f = exp(-x).*cos(x)./1.1;

dfx = exp(-x) .* (-cos(x) - sin(x))./1.1;

% Encontra o valor máximo de |f'(x)|
L = max(abs(dfx));

% Cria o primeiro gráfico {x, g(x)}
figure (1);
plot(x, y, 'b', 'LineWidth', 2);
title('Grafico de {x, g(x)}', 'FontSize', 14, 'FontWeight', 'bold');
xlabel('x');
ylabel('g(x)');
grid on;
legend('g(x)', 'Location', 'NorthEast');

% Cria o segundo gráfico {x, [x, f(x)]}
figure(2);
plot(x, [x; f], 'r', 'LineWidth', 2);
title('Grafico de {x, [x, f(x)]}', 'FontSize', 14, 'FontWeight', 'bold');
xlabel('x');
ylabel('[x, f(x)]');
grid on;
legend('x', 'y = f(x)', 'Location', 'SouthWest');

% Cria o terceiro gráfico {x, f'(x)}
figure(3);
plot(x, dfx, 'g', 'LineWidth', 2);
title('Grafico de {x, f''(x)}', 'FontSize', 14, 'FontWeight', 'bold');
xlabel('x');
ylabel('f''(x)');
grid on;
legend('f''(x)', 'Location', 'NorthEast');

% Imprime o valor de L
disp(['O valor maximo de |f''(x)| é L = ' num2str(L)]);
fprintf('O valor de L = %.8f\n', L);
%EOF