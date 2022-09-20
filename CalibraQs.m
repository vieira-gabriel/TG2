clear

load_variables

path = 'Estudos Observador\Melhorias Qs 4\';

Ts_vector = [45, 50, 55, 60, 65, 70, 75, 80, 85, 100];
[rows,columns] = size(Ts_vector);

for c = 1:columns
    disp(['Runing Ts ', num2str(Ts_vector(1,c)), '%'])
    Tm = Tb*(Ts_vector(1,c)/100);
    Qs = 1/((Tm*s+1)^2);

    disp('Runing arq2')
    workspace_name = ['arq2_tm', num2str(Ts_vector(1,c))];
    
    sim('arq2', Tsim); % Roda arquitetura com observador de disturbio e sem filtro estatistico
    
    save([path, workspace_name]);
    
    pause(20);
end

%%
Ts_vector = [45, 50, 55, 60, 65, 70, 75, 80, 85, 100, 110, 120];
[rows,columns] = size(Ts_vector);
   
pause(20);

for c = 1:columns
    disp(['Runing Ts ', num2str(Ts_vector(1,c)), '%'])
    Tm = Tb*(Ts_vector(1,c)/100);
    Qs = 1/((Tm*s+1)^2);
    
    disp('Runing arq4')
    workspace_name = ['arq4_tm', num2str(Ts_vector(1,c))];
    
    sim('arq4', Tsim); % Roda arquitetura com observador de disturbio e com filtro estatistico
    
    save([path, workspace_name]);
    
    pause(20);
end
