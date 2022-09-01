clear

load_variables

%%
Ts_vector = [85, 120];
[rows,columns] = size(Ts_vector);

path = 'Estudos Observador\Melhorias Qs 3\';

Tstepdown = Tstep+(Tref/2);

for c = 1:columns
    disp(['Runing Ts ', num2str(Ts_vector(1,c)), '%'])
    Tm = Tb*(Ts_vector(1,c)/100);
    Qs = 1/((Tm*s+1)^2);
    
    for i = 1:2
    arq = ['arq', num2str(i*2)];
    disp(['Runing ' arq])
    workspace_name = [arq, '_tm', num2str(Ts_vector(1,c))];
    
    sim(arq, Tsim);
    
    save([path, workspace_name]);
    
    pause(30);
    end
end

%%

disp('Runing arq 1')
sim('arq1', Tsim);
save([path, 'arq1_result']);

%%

disp('Runing arq 3')
sim('arq3', Tsim);
save([path, 'arq3_result']);
