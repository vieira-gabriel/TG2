clear

close all

path = 'Final\'
%%
%{
load('MA.mat')

legenCell = cell(1,3);

plot(sinalSaida+24, 'g')
legendCell{1} = 'Nível da água (%)';
hold on
plot(Saida_Simulado+24, 'm')
legendCell{2} = 'Resposta simulação';
plot(sinalRef+24, 'b')
legendCell{3} = 'Referência';
legend(legendCell);
title('Resposta da malha aberta')
axis([0 2100 -5 55]);
hold off
%}

%%
figure
load([path, 'arq1_result.mat'])

legenCell = cell(1,4);

plot(sinalSaida+24, 'g')
legendCell{1} = 'Nível da água (%)';
hold on
plot(Saida_Simulado+24, 'm')
legendCell{2} = 'Resposta simulação';
plot(sinalDisturbio, 'k')
legendCell{3} = 'Distúrbio aplicado';
plot(sinalRef+24, 'b')
legendCell{4} = 'Referência';
legend(legendCell);
title('Resposta da arquitetura base')
hold off

figure
legenCell = cell(1,2);

plot(sinalControle-sinalDisturbio-52, 'b')
legendCell{1} = 'Sinal controlado';
hold on
plot(sinalDisturbio, 'k')
legendCell{2} = 'Distúrbio aplicado';
legend(legendCell);
title('Sinal de controle da arquitetura base')
axis([0 inf -30 30]);
hold off

%%
figure
load([path, 'arq3_result.mat'])

legenCell = cell(1,4);

plot(sinalSaida+24, 'g')
legendCell{1} = 'Nível da água (%)';
hold on
plot(Saida_Simulado+24, 'm')
legendCell{2} = 'Resposta simulação';
plot(sinalDisturbio, 'k')
legendCell{3} = 'Distúrbio aplicado';
plot(sinalRef+24, 'b')
legendCell{4} = 'Referência';
legend(legendCell);
title('Resposta da arquitetura com filtro estatístico')
hold off

figure
legenCell = cell(1,2);

plot(sinalControle-sinalDisturbio-52, 'b')
legendCell{1} = 'Sinal controlado';
hold on
plot(sinalDisturbio, 'k')
legendCell{2} = 'Distúrbio aplicado';
legend(legendCell);
title('Sinal de controle da arquitetura com filtro estatístico')
axis([0 inf -30 30]);
hold off
