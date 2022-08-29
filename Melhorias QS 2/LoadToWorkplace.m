clear

values_vector = [45, 50, 55, 60, 65, 70, 75, 80, 85, 90, 95, 100, 110, 120, 130];

[r,columns] = size(values_vector);

saidas = [];
saidas_sim = [];
controles = [];
controles_sim = [];
observador = [];

for c = 1:columns
    filename = ['arq2_tm', num2str(values_vector(1,c)), '.mat'];
    if exist('ref', 'var') == 0
        load('arq2_tm45.mat', 'refSignal', 'inputSignal')
        ref = refSignal;
        input = inputSignal;
    end
    
    load(filename, 'sinalObservador', 'sinalControle_saturado', 'sinalSaida_sem_filtro', 'Controle_Simulado', 'Saida_Simulado')
    controle_corrigido = sinalControle_saturado - 52;
    controle_sim_corrigido = Controle_Simulado - 52;

    saidas = [saidas sinalSaida_sem_filtro];
    saidas_sim = [saidas_sim Saida_Simulado];
    controles = [controles controle_corrigido];
    controles_sim = [controles_sim controle_sim_corrigido];
    observador = [observador sinalObservador];
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
    observador_4 = [observador sinalObservador];
end

save('compara', 'ref', 'input', 'saidas', 'saidas_sim', 'controles', 'controles_sim', 'values_vector', 'observador', 'saidas_4', 'saidas_sim_4', 'controles_4', 'controles_sim_4', 'values_vector_4', 'observador_4');
