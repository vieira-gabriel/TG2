clear

%values_vector = [45, 50, 55, 60, 65, 70, 75, 80, 85, 90, 95, 100, 110, 120, 130];
values_vector = [];

[r,columns] = size(values_vector);
path = 'Melhorias Qs 4\';

saidas_2 = [];
saidas_sim_2 = [];
controles_2 = [];
controles_sim_2 = [];
observador_2 = [];

for c = 1:columns
    filename = [path, 'arq2_tm', num2str(values_vector(1,c))];
    if exist('ref', 'var') == 0
        load([path, 'arq2_tm', num2str(values_vector(1,1))], 'sinalRef', 'sinalDisturbio')
        ref = sinalRef;
        disturb = sinalDisturbio;
        clear('sinalRef', 'sinalDisturbio');
    end

    load(filename, 'sinalObservador', 'sinalControle', 'sinalSaida', 'Controle_Simulado', 'Saida_Simulado')
    controle_corrigido = sinalControle - 52;
    controle_sim_corrigido = Controle_Simulado - 52;

    saidas_2 = [saidas_2 sinalSaida];
    saidas_sim_2 = [saidas_sim_2 Saida_Simulado];
    controles_2 = [controles_2 sinalControle];
    controles_sim_2 = [controles_sim_2 Controle_Simulado];
    observador_2 = [observador_2 sinalObservador];

end


%values_vector_4 = [85, 100, 120];
values_vector_4 = [50, 70, 75, 120];
[r,columns] = size(values_vector_4);

saidas_4 = [];
saidas_sim_4 = [];
controles_4 = [];
controles_sim_4 = [];
observador_4 = [];

for c = 1:columns
    filename = [path, 'arq4_tm', num2str(values_vector_4(1,c))];
    if exist('ref', 'var') == 0
        load([path, 'arq4_tm', num2str(values_vector_4(1,1))], 'sinalRef', 'sinalDisturbio')
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
end

load([path, 'arq1_result'], 'sinalControle', 'sinalSaida', 'Controle_Simulado', 'Saida_Simulado')
controle_corrigido = sinalControle - 52;
controle_sim_corrigido = Controle_Simulado - 52;

saida_1 = sinalSaida;
saida_sim_1 =  Saida_Simulado;
controle_1 = sinalControle;
controle_sim_1 = Controle_Simulado;

load([path, 'arq3_result'], 'sinalObservador', 'sinalControle', 'sinalSaida', 'Controle_Simulado', 'Saida_Simulado')
controle_corrigido = sinalControle - 52;
controle_sim_corrigido = Controle_Simulado - 52;

saida_3 = sinalSaida;
saida_sim_3 =  Saida_Simulado;
controle_3 = sinalControle;
controle_sim_3 = Controle_Simulado;
observador_3 = sinalObservador;

clear('r', 'columns', 'c', 'filename', 'controle_corrigido', 'controle_sim_corrigido', 'sinalObservador', 'sinalControle_saturado', 'sinalSaida', 'Controle_Simulado', 'Saida_Simulado');

save('compara');