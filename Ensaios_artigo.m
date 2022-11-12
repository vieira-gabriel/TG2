clear

load_variables

path = 'Estudos Observador\New_Tests\';

%%
%{
ref = 10;       % Amplitude do degrau de entrada do sistema
Tref = 700;     % Instante em que o degrau de referencia eh aplicado
dist = 0;       % Amplitude do degrau do disturbio
Tdist = 0; % Momento em que o disturbio eh aplicado
Thold = 0;    % Tempo em que deseja que o disturbio seja aplicado
Tdistdown = 0;    % Momento em que o disturbio é retirado
Trefdown = Tref*2;  % Momento em que a referencia retorna para zero
Tsim = Tref+Trefdown;       % Tempo total que sera executado o Simulink
disp('Runing MA')
sim('teste_ma', Tsim);
save([path, 'MA']);
   
pause(20);

load_variables
%}

%%
%{
disp('Runing arq 1')
sim('arq1', Tsim);
save([path, 'arq1']);
   
pause(20);

disp('Runing arq 3')
sim('arq3', Tsim);
save([path, 'arq3']);
%}

%%
%{
Ts_vector = [40, 45, 50, 55, 60, 65];
[rows,columns] = size(Ts_vector);

for c = 1:columns
    disp(['Runing Ts ', num2str(Ts_vector(1,c)), '%'])
    Td = Tb*(Ts_vector(1,c)/100);
    Qs = 1/((Td*s+1)^2);

        disp('Running arq 8')
        workspace_name = ['arq8_tm', num2str(Ts_vector(1,c))];
        
        sim('arq8_2', Tsim);
        
        save([path, workspace_name]);
    
        pause(20);
end
%}
%%
pause(20);
%Ts_vector = [30, 35, 40, 45, 50, 55, 60, 65, 70, 75, 80, 85, 90, 95, 100, 110, 120, 130, 140, 150];
Ts_vector = [30];
[rows,columns] = size(Ts_vector);

for c = 1:columns
    disp(['Runing Ts ', num2str(Ts_vector(1,c)), '%'])
    Td = Tb*(Ts_vector(1,c)/100);
    Qs = 1/((Td*s+1)^2);
    G_inv_Q = Gs^(-1) * Qs;

        disp('Running arq 11')
        workspace_name = ['arq11_tm', num2str(Ts_vector(1,c))];
        
        sim('arq11', Tsim);
        
        save([path, workspace_name]);
    
        pause(20);
end

%%
gain_reduce = 0.9;
pause(20);
%Ts_vector = [30, 35, 40, 45, 50, 55, 60, 65, 70, 75, 80, 85, 90, 95, 100, 110, 120, 130, 140, 150];
Ts_vector = [30];
[rows,columns] = size(Ts_vector);

for c = 1:columns

    disp(['Running arq 11 with detuning of', num2str(1-gain_reduce), '%'])
    disp(['Runing Ts ', num2str(Ts_vector(1,c)), '%'])
    Td = Tb*(Ts_vector(1,c)/100);
    Qs = 1/((Td*s+1)^2);
    G_inv_Q = Gs^(-1) * Qs;
        workspace_name = ['arq11_d90_tm', num2str(Ts_vector(1,c))];
        
        sim('arq11', Tsim);
        
        save([path, workspace_name]);
    
        pause(20);
end

%%
sim('shutDown', 100);
