plot(saida45, 'b')
hold on
plot(saida50, 'yellow')
plot(saida60, 'c')
plot(saida80, 'black')
plot(saida100, 'r')
plot(saida120, 'g')
plot(refSignal + inputSignal, 'm')
legend('Sa�da real 45', 'Sa�da real 50', 'Sa�da real 60', 'Sa�da real 80', 'Sa�da real 100', 'Sa�da real 120', 'ref + dist')
axis([0 inf -25 35]);
hold off

figure
plot(controle45, 'b')
hold on
plot(controle50, 'y')
plot(controle60, 'c')
plot(controle80, 'k')
plot(controle100, 'r')
plot(controle120, 'g')
plot(refSignal + inputSignal, 'm')
legend('Sinal controlador real 45', 'Sinal controlador real 50', 'Sinal controlador real 60', 'Sinal controlador real 80', 'Sinal controlador real 100', 'Sinal controlador real 120','ref + dist')
axis([0 inf -10 25]);
hold off