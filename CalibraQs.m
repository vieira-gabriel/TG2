clear

load_variables

path = 'Estudos Observador\Melhorias Qs 4\';

%%

ref = 10;       % Amplitude do degrau de entrada do sistema
Tref = 800;     % Instante em que o degrau de referencia eh aplicado
dist = 0;       % Amplitude do degrau do disturbio
Tdist = 0; % Momento em que o disturbio eh aplicado
Thold = 0;    % Tempo em que deseja que o disturbio seja aplicado
Tdistdown = 0;    % Momento em que o disturbio é retirado
Trefdown = Tref*2;  % Momento em que a referencia retorna para zero
Tsim = Tref+Trefdown;       % Tempo total que sera executado o Simulink


disp('Runing MA')
sim('teste_ma', Tsim);
save([path, 'MA']);

        figure
        plot(sinalSaida+24, 'b')
        hold on
        plot(Saida_Simulado+24, 'm')
        plot(sinalRef + 24, 'k')
        plot(sinalDisturbio, 'r')
        legend('Saída real','Saída simulação', 'Sinal de entrada', 'Disturbio')
        axis([0 inf -25 35]);
        hold off
        title('Malha Aberta')
   
pause(20);

%%

clear

load_variables

path = 'Estudos Observador\Melhorias Qs 4\';

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
        axis([0 inf -25 35]);
        hold off
        title('Arq 1')
   
pause(20);

%%

disp('Runing arq 3')
sim('arq3', Tsim);
save([path, 'arq3_result']);

        figure
        plot(sinalSaida+24, 'b')
        hold on
        plot(Saida_Simulado+24, 'm')
        plot(sinalRef + 24, 'k')
        plot(sinalDisturbio, 'r')
        legend('Saída real','Saída simulação', 'Sinal de entrada', 'Disturbio')
        axis([0 inf -25 35]);
        hold off
        title('Arq 3')

%%
Ts_vector = [70, 75, 50, 120, 65, 55];
[rows,columns] = size(Ts_vector);
   
pause(20);

for c = 1:columns
    disp(['Runing Ts ', num2str(Ts_vector(1,c)), '%'])
    Tm = Tb*(Ts_vector(1,c)/100);
    Qs = 1/((Tm*s+1)^2);
    
    for i = 2:2
        arq = ['arq', num2str(i*2)];
        disp(['Runing ' arq])
        workspace_name = [arq, '_tm', num2str(Ts_vector(1,c))];
    
        sim(arq, Tsim);
    
        save([path, workspace_name]);

        figure
        plot(sinalSaida+24, 'b')
        hold on
        plot(Saida_Simulado+24, 'm')
        plot(sinalRef + 24, 'k')
        plot(sinalDisturbio, 'r')
        legend('Saída real','Saída simulação', 'Sinal de entrada', 'Disturbio')
        axis([0 inf -25 35]);
        hold off
        title([arq, num2str(Ts_vector(1,c)), '%'])
    
        pause(20);
    end
end

%%
Ts_vector = [45, 50, 55, 60, 65, 70, 75, 80, 85, 100, 110, 120];
[rows,columns] = size(Ts_vector);
   
pause(20);

for c = 1:columns
    disp(['Runing Ts ', num2str(Ts_vector(1,c)), '%'])
    Tm = Tb*(Ts_vector(1,c)/100);
    Qs = 1/((Tm*s+1)^2);
    
    for i = 1:1
        arq = ['arq', num2str(i*2)];
        disp(['Runing ' arq])
        workspace_name = [arq, '_tm', num2str(Ts_vector(1,c))];
    
        sim(arq, Tsim);
    
        save([path, workspace_name]);


        figure
        plot(sinalSaida+24, 'b')
        hold on
        plot(Saida_Simulado+24, 'm')
        plot(sinalRef + 24, 'k')
        plot(sinalDisturbio, 'r')
        legend('Saída real','Saída simulação', 'Sinal de entrada', 'Disturbio')
        axis([0 inf -25 35]);
        hold off
        title([arq, num2str(Ts_vector(1,c)), '%'])
    
        pause(20);
    end
end
