clear

load_variables

path = 'Estudos Observador\Melhorias Qs 4\';

%%

disp('Runing MA')
sim('teste_ma', Tsim);
save([path, 'MA']);
   
pause(20);

%%

disp('Runing arq 1')
sim('arq1', Tsim);
save([path, 'arq1_result']);

        figure
        plot(sinalSaida_sem_filtro, 'b')
        hold on
        plot(Saida_Simulado, 'm')
        plot(refSignal + inputSignal, 'k')
        legend('Saída real','Saída simulação', 'Ref + Dist')
        axis([0 inf -25 35]);
        hold off
        title([arq, num2str(Ts_vector(1,c)), '%'])
   
pause(20);

%%

disp('Runing arq 3')
sim('arq3', Tsim);
save([path, 'arq3_result']);

        figure
        plot(sinalSaida_sem_filtro, 'b')
        hold on
        plot(Saida_Simulado, 'm')
        plot(refSignal + inputSignal, 'k')
        legend('Saída real','Saída simulação', 'Ref + Dist')
        axis([0 inf -25 35]);
        hold off
        title([arq, num2str(Ts_vector(1,c)), '%'])

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
        plot(sinalSaida_sem_filtro, 'b')
        hold on
        plot(Saida_Simulado, 'm')
        plot(refSignal + inputSignal, 'k')
        legend('Saída real','Saída simulação', 'Ref + Dist')
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
        plot(sinalSaida_sem_filtro, 'b')
        hold on
        plot(Saida_Simulado, 'm')
        plot(refSignal + inputSignal, 'k')
        legend('Saída real','Saída simulação', 'Ref + Dist')
        axis([0 inf -25 35]);
        hold off
        title([arq, num2str(Ts_vector(1,c)), '%'])
    
        pause(20);
    end
end
