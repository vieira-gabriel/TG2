clear

gain_reduce = 0.9;

load_variables

path = 'Estudos Observador\New_Tests\';

%%
disp('Runing MA')
sim('teste_ma', Tsim);
save([path, 'MA']);
   
pause(20);

%%
%{
disp('Runing arq 1')
sim('arq1', Tsim);
save([path, 'arq1_result']);

        figure
        plot(sinalSaida+24, 'b')
        hold on
        plot(Saida_Simulado+24, 'm')
        plot(sinalRef + 24, 'k')
        plot(sinalDisturbio, 'r')
        legend('Saída real','Saída simulação', 'Sinal de entrada', 'Disturbio')
        hold off
        title('Arq 1')
   
pause(20);
%}

disp('Runing arq 3')
sim('arq3', Tsim);
save([path, 'arq3_result']);

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

Ts_vector = [];
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
sim('shutDown', 100);
