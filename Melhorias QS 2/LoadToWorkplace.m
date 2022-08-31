clear

values_vector = [45, 50, 55, 60, 65, 70, 75, 80, 85, 90, 95, 100, 110, 120, 130];

[r,columns] = size(values_vector);

saidas_2 = [];
saidas_sim_2 = [];
controles_2 = [];
controles_sim_2 = [];
observador_2 = [];

for c = 1:columns
    filename = ['arq2_tm', num2str(values_vector(1,c)), '.mat'];
    if exist('ref', 'var') == 0
        load('arq2_tm45.mat', 'refSignal', 'inputSignal')
        ref = refSignal;
        input = inputSignal;
        clear('refSignal', 'inputSignal');
    end
    
    load(filename, 'sinalObservador', 'sinalControle_saturado', 'sinalSaida_sem_filtro', 'Controle_Simulado', 'Saida_Simulado')
    controle_corrigido = sinalControle_saturado - 52;
    controle_sim_corrigido = Controle_Simulado - 52;

    saidas_2 = [saidas_2 sinalSaida_sem_filtro];
    saidas_sim_2 = [saidas_sim_2 Saida_Simulado];
    controles_2 = [controles_2 controle_corrigido];
    controles_sim_2 = [controles_sim_2 controle_sim_corrigido];
    observador_2 = [observador_2 sinalObservador];
    
end


values_vector_4 = [85, 100, 120];
[r,columns] = size(values_vector_4);

saidas_4 = [];
saidas_sim_4 = [];
controles_4 = [];
controles_sim_4 = [];
observador_4 = [];

for c = 1:columns
    filename = ['arq4_tm', num2str(values_vector_4(1,c)), '.mat'];
    
    load(filename, 'sinalObservador', 'sinalControle_saturado', 'sinalSaida_sem_filtro', 'Controle_Simulado', 'Saida_Simulado')
    controle_corrigido = sinalControle_saturado - 52;
    controle_sim_corrigido = Controle_Simulado - 52;

    saidas_4 = [saidas_4 sinalSaida_sem_filtro];
    saidas_sim_4 = [saidas_sim_4 Saida_Simulado];
    controles_4 = [controles_4 controle_corrigido];
    controles_sim_4 = [controles_sim_4 controle_sim_corrigido];
    observador_4 = [observador_4 sinalObservador];
end

load('arq1_result', 'sinalControle_saturado', 'sinalSaida_sem_filtro', 'Controle_Simulado', 'Saida_Simulado')
controle_corrigido = sinalControle_saturado - 52;
controle_sim_corrigido = Controle_Simulado - 52;

saida_1 = sinalSaida_sem_filtro;
saida_sim_1 =  Saida_Simulado;
controle_1 = controle_corrigido;
controle_sim_1 = controle_sim_corrigido;

load('arq3_result', 'sinalObservador', 'sinalControle_saturado', 'sinalSaida_sem_filtro', 'Controle_Simulado', 'Saida_Simulado')
controle_corrigido = sinalControle_saturado - 52;
controle_sim_corrigido = Controle_Simulado - 52;

saida_3 = sinalSaida_sem_filtro;
saida_sim_3 =  Saida_Simulado;
controle_3 = controle_corrigido;
controle_sim_3 = controle_sim_corrigido;
observador_3 = sinalObservador;
    
clear('r', 'columns', 'c', 'filename', 'controle_corrigido', 'controle_sim_corrigido', 'sinalObservador', 'sinalControle_saturado', 'sinalSaida_sem_filtro', 'Controle_Simulado', 'Saida_Simulado');

save('compara');