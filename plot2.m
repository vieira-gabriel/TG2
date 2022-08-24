plot(refSignal, 'red')
hold on
plot(inputSignal, 'blue')
plot(sinalSaida_sem_filtro, 'green')
plot(sinalControle_sem_filtro -52, 'black')
plot(sinalObservador, 'magenta')
legend('input','disturbio','saida','controle','observador')
hold off