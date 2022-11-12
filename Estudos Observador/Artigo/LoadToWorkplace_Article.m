clear

close all

path = 'Artigo\';

p_vector = [30, 35, 40, 45, 50, 55, 60, 65, 70, 75, 80, 85, 90, 95, 100, 110, 120, 130, 140, 150];

[r,columns] = size(p_vector);

enablePlot = true;

saidas_11 = [];
saidas_sim_11 = [];
controles_11 = [];
controles_sim_11 = [];
observador_11 = [];

for c = 1:columns
    filename = [path, 'arq11_tm', num2str(p_vector(1,c))];
    if exist('ref', 'var') == 0
        load([path, 'arq11_tm', num2str(p_vector(1,1))], 'sinalRef', 'sinalDisturbio')
        ref = sinalRef;
        disturb = sinalDisturbio;
        clear('sinalRef', 'sinalDisturbio');
    end

    load(filename,'sinalRef', 'sinalDisturbio', 'sinalObservador', 'sinalControle', 'sinalSaida', 'Controle_Simulado', 'Saida_Simulado')
    controle_corrigido = sinalControle - 52;
    controle_sim_corrigido = Controle_Simulado - 52;

    saidas_11 = [saidas_11 sinalSaida];
    saidas_sim_11 = [saidas_sim_11 Saida_Simulado];
    controles_11 = [controles_11 sinalControle];
    controles_sim_11 = [controles_sim_11 Controle_Simulado];
    observador_11 = [observador_11 sinalObservador];
    
    if enablePlot
    fig1 = figure;
    plot(sinalSaida+24, 'g')
    hold on
    plot(Saida_Simulado+24, 'm')
    plot(sinalRef+24, 'k')
    plot(sinalDisturbio, 'r')
    legend('Nível da água (%)','Resposta simulação', 'Referência', 'Distúrbio')
    title(['Resposta com Td = ',num2str(p_vector(1,c)),'% * Tb'])
    axis([0 inf -5 45]);
    ylabel('Valor do sinal') 
    set(gca, 'fontsize', 20, 'fontweight', 'bold');
    hold off
    fig1.WindowState = 'maximized';
    saveas(fig1,['Figuras\', path, 'arq11_', num2str(p_vector(1,c)),'.png'])

    fig2 = figure;
    %plot(sinalControle - sinalDisturbio + sinalObservador - 52, 'b')
    plot(sinalControle - sinalDisturbio - 52, 'b')
    hold on
    plot(sinalObservador, 'c')
    plot(sinalRef+24, 'k')
    plot(sinalDisturbio, 'r')
    legend('Sinal controlador','Sinal observador', 'Referência', 'Distúrbio')
    title(['Sinais de controle e do observador com Td = ',num2str(p_vector(1,c)),'% * Tb'])
    axis([0 inf -5 45]);
    ylabel('Valor do sinal') 
    set(gca, 'fontsize', 20, 'fontweight', 'bold');
    hold off
    fig2.WindowState = 'maximized';
    saveas(fig2,['Figuras\', path, 'arq11_', num2str(p_vector(1,c)),'_cont.png'])
    end
end

saidas_11_d90 = [];
saidas_sim_11_d90 = [];
controles_11_d90 = [];
controles_sim_11_d90 = [];
observador_11_d90 = [];

for c = 1:columns
    filename = [path, 'arq11_d90_tm', num2str(p_vector(1,c))];
    if exist('ref', 'var') == 0
        load([path, 'arq11_tm', num2str(p_vector(1,1))], 'sinalRef', 'sinalDisturbio')
        ref = sinalRef;
        disturb = sinalDisturbio;
        clear('sinalRef', 'sinalDisturbio');
    end

    load(filename,'sinalRef', 'sinalDisturbio', 'sinalObservador', 'sinalControle', 'sinalSaida', 'Controle_Simulado', 'Saida_Simulado')
    controle_corrigido = sinalControle - 52;
    controle_sim_corrigido = Controle_Simulado - 52;

    saidas_11_d90 = [saidas_11_d90 sinalSaida];
    saidas_sim_11_d90 = [saidas_sim_11_d90 Saida_Simulado];
    controles_11_d90 = [controles_11_d90 sinalControle];
    controles_sim_11_d90 = [controles_sim_11_d90 Controle_Simulado];
    observador_11_d90 = [observador_11 sinalObservador];
    
    if enablePlot
    fig1 = figure;
    plot(sinalSaida+24, 'g')
    hold on
    plot(Saida_Simulado+24, 'm')
    plot(sinalRef+24, 'k')
    plot(sinalDisturbio, 'r')
    legend('Nível da água (%)','Resposta simulação', 'Referência', 'Distúrbio')
    title(['Resposta com Td = ',num2str(p_vector(1,c)),'% * Tb | Detuning 10%'])
    axis([0 inf -5 45]);
    ylabel('Valor do sinal') 
    set(gca, 'fontsize', 20, 'fontweight', 'bold');
    hold off
    fig1.WindowState = 'maximized';
    saveas(fig1,['Figuras\', path, 'arq11_', num2str(p_vector(1,c)),'.png'])

    fig2 = figure;
    %plot(sinalControle - sinalDisturbio + sinalObservador - 52, 'b')
    plot(sinalControle - sinalDisturbio - 52, 'b')
    hold on
    plot(sinalObservador, 'c')
    plot(sinalRef+24, 'k')
    plot(sinalDisturbio, 'r')
    legend('Sinal controlador','Sinal observador', 'Referência', 'Distúrbio')
    title(['Sinais de controle e do observador com Td = ',num2str(p_vector(1,c)),'% * Tb | Detuning 10%'])
    axis([0 inf -5 45]);
    ylabel('Valor do sinal') 
    set(gca, 'fontsize', 20, 'fontweight', 'bold');
    hold off
    fig2.WindowState = 'maximized';
    saveas(fig2,['Figuras\', path, 'arq11_', num2str(p_vector(1,c)),'_cont.png'])
    end
end
%{
close all;

[r,columns] = size(p_vector);

saidas_4 = [];
saidas_sim_4 = [];
controles_4 = [];
controles_sim_4 = [];
observador_4 = [];

for c = 1:columns
    filename = [path, 'arq4_tm', num2str(p_vector(1,c))];
    if exist('ref', 'var') == 0
        load([path, 'arq4_tm', num2str(p_vector(1,1))], 'sinalRef', 'sinalDisturbio')
        ref = sinalRef;
        disturb = sinalDisturbio;
        clear('sinalRef', 'sinalDisturbio');
    end

    load(filename, 'sinalObservador', 'sinalControle', 'sinalSaida', 'Controle_Simulado', 'Saida_Simulado')
    controle_corrigido = sinalControle - 52;
    controle_sim_corrigido = Controle_Simulado - 52;

    saidas_4 = [saidas_4 sinalSaida];
    saidas_sim_4 = [saidas_sim_4 Saida_Simulado];
    controles_4 = [controles_4 sinalControle];
    controles_sim_4 = [controles_sim_4 Controle_Simulado];
    observador_4 = [observador_4 sinalObservador];

    if enablePlot
    fig1 = figure;
    plot(sinalSaida+24, 'g')
    hold on
    plot(Saida_Simulado+24, 'm')
    plot(sinalRef+24, 'k')
    plot(sinalDisturbio, 'r')
    legend('Nível da água (%)','Resposta simulação', 'Referência', 'Distúrbio')
    title(['Resposta com Td = ',num2str(p_vector(1,c)),'% * Tb'])
    axis([0 inf -5 45]);
    ylabel('Valor do sinal') 
    set(gca, 'fontsize', 20, 'fontweight', 'bold');
    hold off
    fig1.WindowState = 'maximized';
    %saveas(fig1,['Imagens\', path, 'arq4_', num2str(p_vector(1,c)),'.png'])

    fig2 = figure;
    plot(sinalControle - sinalDisturbio + sinalObservador - 52, 'b')
    hold on
    plot(sinalObservador, 'c')
    plot(sinalRef+24, 'k')
    plot(sinalDisturbio, 'r')
    legend('Sinal controlador','Sinal observador', 'Referência', 'Distúrbio')
    title(['Sinais de controle e do observador com Td = ',num2str(p_vector(1,c)),'% * Tb'])
    axis([0 inf -5 45]);
    ylabel('Valor do sinal') 
    set(gca, 'fontsize', 20, 'fontweight', 'bold');
    hold off
    fig2.WindowState = 'maximized';
    %saveas(fig2,['Imagens\', path, 'arq4_', num2str(p_vector(1,c)),'_cont.png'])
    end
    
end
    %}
load([path, 'arq1'], 'sinalControle', 'sinalSaida', 'Controle_Simulado', 'Saida_Simulado')
controle_corrigido = sinalControle - 52;
controle_sim_corrigido = Controle_Simulado - 52;

saida_1 = sinalSaida;
saida_sim_1 =  Saida_Simulado;
controle_1 = sinalControle;
controle_sim_1 = Controle_Simulado;

load([path, 'arq3'], 'sinalControle', 'sinalSaida', 'Controle_Simulado', 'Saida_Simulado')
controle_corrigido = sinalControle - 52;
controle_sim_corrigido = Controle_Simulado - 52;

saida_3 = sinalSaida;
saida_sim_3 =  Saida_Simulado;
controle_3 = sinalControle;
controle_sim_3 = Controle_Simulado;
observador_3 = sinalObservador;

clear('r', 'columns', 'c', 'filename', 'controle_corrigido', 'controle_sim_corrigido', 'sinalObservador', 'sinalControle_saturado', 'sinalSaida', 'Controle_Simulado', 'Saida_Simulado');
%}
save('compara');

close all;

