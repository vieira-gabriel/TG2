addpath('.');
addpath('./functions/');

clear

compare_arq = 'arq4';

if strcmp(compare_arq, 'arq2')
    values_vector = [45, 50, 55, 60, 65, 70, 75, 80, 85, 90, 95, 100, 110, 120, 130];
else
    values_vector = [85, 100, 120];
end

[r,columns] = size(values_vector);


for c = 1:columns
    filename = [compare_arq, '_tm', num2str(values_vector(1,c)), '.mat'];
    
    load(filename, 'sinalControle_saturado', 'sinalSaida_sem_filtro', 'Tsim', 'refSignal')
    tv = calcTV(sinalControle_saturado.data,Tsim);
    ise = calcISE(sinalSaida_sem_filtro.data,refSignal.data,Tsim);
    iae = calcIAE(sinalSaida_sem_filtro.data,refSignal.data,Tsim);
    if exist('tv_vec','var') == 0
        tv_vec = [tv];
        ise_vec = [ise];
        iae_vec = [iae];
        iae_ise_vec = [iae/ise];
    else
        tv_vec = [tv_vec tv];
        ise_vec = [ise_vec ise];
        iae_vec = [iae_vec iae];
        iae_ise_vec = [iae_ise_vec iae/ise];
    end   
end

[sorted_tv,idx_tv] = sort(tv_vec);
[sorted_iae_ise,idx_iae_ise] = sort(iae_ise_vec);


if strcmp(compare_arq, 'arq2')
    filter = 5;
else
    filter = 2;
end

chosed_values = intersect(idx_tv(1:filter), idx_iae_ise(1:filter));

best = [];

for i = chosed_values
    best = [best values_vector(1,i)];
end

disp('Valores selecionados como melhores: ')
disp(best)