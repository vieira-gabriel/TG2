plot(sinalSaida_sem_filtro, 'b')
hold on
plot(Saida_Simulado, 'm')
plot(refSignal + inputSignal, 'k')
legend('Saída real','Saída simulação', 'Ref + Dist')
axis([0 inf -25 35]);
hold off

figure
plot(sinalControle_sem_filtro -52, 'g')
hold on
plot(Controle_Simulado, 'r')
legend('Sinal controlador real','Sinal controlador simulação')
axis([0 inf -10 25]);
hold off