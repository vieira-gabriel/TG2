clear
values_vector = [45, 50, 55, 60, 65, 70, 75, 80, 85, 90, 95, 100, 110, 120, 130];

[r,columns] = size(values_vector);


for c = 1:columns
    filename = ['arq2_tm', num2str(values_vector(1,c)), '.mat'];
    if exist('ref', 'var') == 0
        load('arq2_tm45.mat', 'refSignal', 'inputSignal')
        ref = refSignal;
        input = inputSignal;
        
        save('compara', 'ref', 'input');
    end
    
    load(filename, 'sinalControle_saturado', 'sinalSaida_sem_filtro', 'Controle_Simulado', 'Saida_Simulado')
    controle_corrigido = sinalControle_saturado - 52;
    controle_sim_corrigido = Controle_Simulado - 52;
    if exist('saidas','var') == 0
        saidas = [sinalSaida_sem_filtro];
        saidas_sim = [Saida_Simulado];
        controles = [controle_corrigido];
        controles_sim = [controle_sim_corrigido];
    else
        saidas = [saidas sinalSaida_sem_filtro];
        saidas_sim = [saidas_sim Saida_Simulado];
        controles = [controles controle_corrigido];
        controles_sim = [controles_sim controle_sim_corrigido];
    end   
end

save('compara', 'ref', 'input', 'saidas', 'saidas_sim', 'controles', 'controles_sim', 'values_vector');