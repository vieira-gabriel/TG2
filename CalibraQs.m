load_variables

Ts_vector = [95, 100, 110, 120, 130];
[rows,columns] = size(Ts_vector);

for c = 1:columns
    this_value = Ts_vector(1,c);
    disp(['Runing Ts ', num2str(this_value), '%'])
    Tm = Tb*(this_value/100);
    Qs = 1/((Tm*s+1)^2);
    
    workspace_name = ['arq2_tm', num2str(this_value)];
    
    sim('arq2', Tsim);
    
    clear this_value
    
    save(['Melhorias QS 2\',workspace_name]);
    
    pause(30);
end