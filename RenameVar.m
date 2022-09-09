clear

%values_vector = [45, 50, 55, 60, 65, 70, 75, 80, 85, 90, 95, 100, 110, 120, 130];
values_vector = [45, 50, 55, 60, 65, 70, 75, 80, 85, 100, 110, 120];

[r,columns] = size(values_vector);
path = 'Melhorias Qs 3\';

for c = 1:columns
    filename = [path, 'arq2_tm', num2str(values_vector(1,c))];
    
    load(filename,'Tstep', 'Tstepdown', 'Tm', 'sinalErro_sem_filtro', 'tanque2_sem_filtro', 'refSignal', 'inputSignal', 'sinalControle_sem_filtro', 'sinalSaida_sem_filtro')
    sinalControle = sinalControle_sem_filtro;
    sinalRef = refSignal;
    sinalDisturbio = inputSignal;
    sinalSaida = sinalSaida_sem_filtro;
    tanque2 = tanque2_sem_filtro;
    sinalErro = sinalErro_sem_filtro;
    Td = Tm;
    Tdist = Tstep;
    Tdistdown = Tstepdown;

    save(filename, 'sinalControle', 'sinalRef', 'sinalDisturbio', 'sinalSaida', 'tanque2', 'sinalErro', 'Td', 'Tdist', 'Tdistdown', '-append')
    
end


%values_vector_4 = [85, 100, 120];
values_vector_4 = [50, 70, 75, 85, 120];
[r,columns] = size(values_vector_4);

for c = 1:columns
    filename = [path, 'arq4_tm', num2str(values_vector_4(1,c))];
    
    load(filename,'Tstep', 'Tstepdown', 'Tm', 'sinalErro_sem_filtro', 'tanque2_sem_filtro', 'refSignal', 'inputSignal', 'sinalControle_sem_filtro', 'sinalSaida_sem_filtro')
    sinalControle = sinalControle_sem_filtro;
    sinalRef = refSignal;
    sinalDisturbio = inputSignal;
    sinalSaida = sinalSaida_sem_filtro;
    tanque2 = tanque2_sem_filtro;
    sinalErro = sinalErro_sem_filtro;
    Td = Tm;
    Tdist = Tstep;
    Tdistdown = Tstepdown;

    save(filename, 'sinalControle', 'sinalRef', 'sinalDisturbio', 'sinalSaida', 'tanque2', 'sinalErro', 'Td', 'Tdist', 'Tdistdown', '-append')
end

load([path, 'arq1_result'],'Tstep', 'Tstepdown', 'Tm', 'sinalErro_sem_filtro', 'tanque2_sem_filtro', 'refSignal', 'inputSignal', 'sinalControle_sem_filtro', 'sinalSaida_sem_filtro')
    sinalControle = sinalControle_sem_filtro;
    sinalRef = refSignal;
    sinalDisturbio = inputSignal;
    sinalSaida = sinalSaida_sem_filtro;
    tanque2 = tanque2_sem_filtro;
    sinalErro = sinalErro_sem_filtro;
    Td = Tm;
    Tdist = Tstep;
    Tdistdown = Tstepdown;

    save([path, 'arq1_result'], 'sinalControle', 'sinalRef', 'sinalDisturbio', 'sinalSaida', 'tanque2', 'sinalErro', 'Td', 'Tdist', 'Tdistdown', '-append')

load([path, 'arq3_result'],'Tstep', 'Tstepdown', 'Tm', 'sinalErro_sem_filtro', 'tanque2_sem_filtro', 'refSignal', 'inputSignal', 'sinalControle_sem_filtro', 'sinalSaida_sem_filtro')
    sinalControle = sinalControle_sem_filtro;
    sinalRef = refSignal;
    sinalDisturbio = inputSignal;
    sinalSaida = sinalSaida_sem_filtro;
    tanque2 = tanque2_sem_filtro;
    sinalErro = sinalErro_sem_filtro;
    Td = Tm;
    Tdist = Tstep;
    Tdistdown = Tstepdown;

    save([path, 'arq3_result'], 'sinalControle', 'sinalRef', 'sinalDisturbio', 'sinalSaida', 'tanque2', 'sinalErro', 'Td', 'Tdist', 'Tdistdown', '-append')
