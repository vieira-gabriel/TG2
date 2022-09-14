clear

close all
%'Melhorias Qs 4\
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

fig = figure
load('Final\arq1_result.mat')

legenCell = cell(1,4);

plot(sinalSaida+24, 'g')
legendCell{1} = 'Nível da água (%)';
hold on
plot(Saida_Simulado+24, 'm')
legendCell{2} = 'Resposta simulação';
plot(sinalDisturbio, 'r')
legendCell{3} = 'Distúrbio aplicado';
plot(sinalRef+24, 'k')
legendCell{4} = 'Referência';
legend(legendCell);
title('Resposta da arquitetura MFB')
axis([0 inf -5 45]);
hold off
fig.WindowState = 'maximized';
saveas(fig,['Imagens\Arq1_output_PO.png'])

fig = figure
legenCell = cell(1,3);

plot(sinalControle-sinalDisturbio-52, 'b')
legendCell{1} = 'Sinal controlado';
hold on
plot(sinalDisturbio, 'r')
legendCell{2} = 'Distúrbio aplicado';
plot(sinalRef+24, 'k')
legendCell{3} = 'Referência';
legend(legendCell);
title('Sinal de controle da arquitetura MFB')
axis([0 inf -5 37]);
hold off
fig.WindowState = 'maximized';
saveas(fig,['Imagens\Arq1_cont_PO.png'])

%%
fig = figure
load('Final\arq3_result')

legenCell = cell(1,4);

plot(sinalSaida+24, 'g')
legendCell{1} = 'Nível da água (%)';
hold on
plot(Saida_Simulado+24, 'm')
legendCell{2} = 'Resposta simulação';
plot(sinalDisturbio, 'r')
legendCell{3} = 'Distúrbio aplicado';
plot(sinalRef+24, 'k')
legendCell{4} = 'Referência';
legend(legendCell);
title('Resposta da arquitetura MFE')
axis([0 inf -5 45]);
hold off
fig.WindowState = 'maximized';
saveas(fig,['Imagens\Arq3_output_PO.png'])

fig = figure
legenCell = cell(1,3);

plot(sinalControle-sinalDisturbio-52, 'b')
legendCell{1} = 'Sinal controlado';
hold on
plot(sinalDisturbio, 'r')
legendCell{2} = 'Distúrbio aplicado';
plot(sinalRef+24, 'k')
legendCell{3} = 'Referência';
legend(legendCell);
title('Sinal de controle da arquitetura MFE')
axis([0 inf -5 37]);
hold off
fig.WindowState = 'maximized';
saveas(fig,['Imagens\Arq3_cont_PO.png'])
%%

fig = figure
load('Melhorias Qs 4\arq1_result.mat')

legenCell = cell(1,4);

plot(sinalSaida+24, 'g')
legendCell{1} = 'Nível da água (%)';
hold on
plot(Saida_Simulado+24, 'm')
legendCell{2} = 'Resposta simulação';
plot(sinalDisturbio, 'r')
legendCell{3} = 'Distúrbio aplicado';
plot(sinalRef+24, 'k')
legendCell{4} = 'Referência';
legend(legendCell);
title('Resposta da arquitetura MFB')
axis([0 inf -5 45]);
hold off
fig.WindowState = 'maximized';
saveas(fig,['Imagens\Arq1_output.png'])

fig = figure
legenCell = cell(1,3);

plot(sinalControle-sinalDisturbio-52, 'b')
legendCell{1} = 'Sinal controlado';
hold on
plot(sinalDisturbio, 'r')
legendCell{2} = 'Distúrbio aplicado';
plot(sinalRef+24, 'k')
legendCell{3} = 'Referência';
legend(legendCell);
title('Sinal de controle da arquitetura MFB')
axis([0 inf -5 37]);
hold off
fig.WindowState = 'maximized';
saveas(fig,['Imagens\Arq1_cont.png'])

%%
fig = figure
load('Melhorias Qs 4\arq3_result')

legenCell = cell(1,4);

plot(sinalSaida+24, 'g')
legendCell{1} = 'Nível da água (%)';
hold on
plot(Saida_Simulado+24, 'm')
legendCell{2} = 'Resposta simulação';
plot(sinalDisturbio, 'r')
legendCell{3} = 'Distúrbio aplicado';
plot(sinalRef+24, 'k')
legendCell{4} = 'Referência';
legend(legendCell);
title('Resposta da arquitetura MFE')
axis([0 inf -5 45]);
hold off
fig.WindowState = 'maximized';
saveas(fig,['Imagens\Arq3_output.png'])

fig = figure
legenCell = cell(1,3);

plot(sinalControle-sinalDisturbio-52, 'b')
legendCell{1} = 'Sinal controlado';
hold on
plot(sinalDisturbio, 'r')
legendCell{2} = 'Distúrbio aplicado';
plot(sinalRef+24, 'k')
legendCell{3} = 'Referência';
legend(legendCell);
title('Sinal de controle da arquitetura MFE')
axis([0 inf -5 37]);
hold off
fig.WindowState = 'maximized';
saveas(fig,['Imagens\Arq3_cont.png'])

close all