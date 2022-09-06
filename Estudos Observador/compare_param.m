addpath('.');
addpath('./functions/');

clear

compare_arq = 'arq2';
path = 'Melhorias Qs 3\';

if strcmp(compare_arq, 'arq2')
    %values_vector = [45, 50, 55, 60, 65, 70, 75, 80, 85, 90, 95, 100, 110, 120, 125, 130];
    values_vector = [45, 50, 55, 60, 65, 70, 75, 80, 85, 100, 110, 120];
else
    values_vector = [50, 70, 75, 85, 120];
end

[r,columns] = size(values_vector);


for c = 1:columns
    filename = [path, compare_arq, '_tm', num2str(values_vector(1,c)), '.mat'];

    load(filename, 'sinalControle_sem_filtro', 'sinalSaida_sem_filtro', 'Tsim', 'refSignal')
    tv = calcTV(sinalControle_sem_filtro.data,Tsim);
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
[sorted_iae,idx_iae] = sort(iae_vec);
[sorted_ise,idx_ise] = sort(ise_vec);


if strcmp(compare_arq, 'arq2')
    filter = 3;
else
    filter = 3;
end

chosed_values = intersect(idx_tv(1:filter), idx_iae(1:filter));

best = [];

for i = chosed_values
    best = [best values_vector(1,i)];
    disp([num2str(values_vector(1,i)), ' : tv = ', num2str(tv_vec(i)), ' | iae = ', num2str(iae_vec(i)), ' | ise = ', num2str(ise_vec(i))])
end

if strcmp(compare_arq, 'arq2')
    load([path, 'arq1_result'], 'sinalControle_sem_filtro', 'sinalSaida_sem_filtro', 'Tsim', 'refSignal')
    name = 'Arq1';
else
    load([path, 'arq3_result'], 'sinalControle_sem_filtro', 'sinalSaida_sem_filtro', 'Tsim', 'refSignal')
    name = 'Arq3';
end

tv = calcTV(sinalControle_sem_filtro.data,Tsim);
ise = calcISE(sinalSaida_sem_filtro.data,refSignal.data,Tsim);
iae = calcIAE(sinalSaida_sem_filtro.data,refSignal.data,Tsim);
iae_ise = iae/ise;
disp([name, ' : tv = ', num2str(tv), ' | iae = ', num2str(iae), ' | ise = ', num2str(ise)])

disp('Valores selecionados como melhores: ')
disp(best)

bestTV = [];
bestIAE = [];
bestISE = [];
for i = 1:filter
    bestTV = [bestTV values_vector(1,idx_tv(i))];
    bestIAE = [bestIAE values_vector(1,idx_iae(i))];
    bestISE = [bestISE values_vector(1,idx_ise(i))];
end
disp('Melhores TV')
disp(bestTV)
disp('Melhores IAE')
disp(bestIAE)
disp('Melhores ISE')
disp(bestISE)
