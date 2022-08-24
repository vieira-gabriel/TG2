plot(refSignal, 'red')
hold on
plot(inputSignal, 'blue')
plot(sinalSaida_sem_filtro, 'green')
plot(sinalControle_sem_filtro -52, 'magenta')
legend('input','disturbio','saida','controle')
axis([0 inf -25 35]);
hold off