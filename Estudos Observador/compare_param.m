addpath('.');
addpath('./functions/');

clear
path = 'Final\'; % Pasta com os arquivos dos testes finais

p_vector = [30, 35, 40, 45, 50, 55, 60, 65, 70, 75, 80, 85, 90, 95, 100, 120];
[r,columns] = size(p_vector);
filter = 5;

load([path, 'arq1_result'], 'sinalControle', 'sinalSaida', 'Tsim', 'sinalRef')
name = 'Arq1';

tv = calcTV(sinalControle.data,Tsim);
ise = calcISE(sinalSaida.data,sinalRef.data,Tsim);
iae = calcIAE(sinalSaida.data,sinalRef.data,Tsim);
iae_ise = iae/ise;
disp([name, ' : tv = ', num2str(tv), ' | iae = ', num2str(iae), ' | ise = ', num2str(ise)])

load([path, 'arq3_result'], 'sinalControle', 'sinalSaida', 'Tsim', 'sinalRef')
name = 'Arq3';

tv = calcTV(sinalControle.data,Tsim);
ise = calcISE(sinalSaida.data,sinalRef.data,Tsim);
iae = calcIAE(sinalSaida.data,sinalRef.data,Tsim);
iae_ise = iae/ise;
disp([name, ' : tv = ', num2str(tv), ' | iae = ', num2str(iae), ' | ise = ', num2str(ise)])


for arq = 1:2
    for c = 1:columns
        if arq == 1
            filename = [path, 'arq2_tm', num2str(p_vector(1,c)), '.mat'];
            arq_name = 'MOD';
        else
            filename = [path, 'arq4_tm', num2str(p_vector(1,c)), '.mat'];
            arq_name = 'MOF';
        end

        load(filename, 'sinalControle', 'sinalSaida', 'Tsim', 'sinalRef')
        tv = calcTV(sinalControle.data,Tsim);
        ise = calcISE(sinalSaida.data,sinalRef.data,Tsim);
        iae = calcIAE(sinalSaida.data,sinalRef.data,Tsim);
        if exist('tv_vec','var') == 0
            tv_vec = [tv];
            ise_vec = [ise];
            iae_vec = [iae];
        else
            tv_vec = [tv_vec tv];
            ise_vec = [ise_vec ise];
            iae_vec = [iae_vec iae];
        end   
    end
    
    [sorted_tv,idx_tv] = sort(tv_vec);
    [sorted_iae,idx_iae] = sort(iae_vec);
    [sorted_ise,idx_ise] = sort(ise_vec);
    
    chosed_values = intersect(idx_tv(1:filter), idx_iae(1:filter));
    
    best = [];
    
    for i = chosed_values
        best = [best p_vector(1,i)];
        disp([num2str(p_vector(1,i)), '  : tv = ', num2str(tv_vec(i)), ' | iae = ', num2str(iae_vec(i)), ' | ise = ', num2str(ise_vec(i))])
    end
    
    disp(['Valores selecionados como melhores para arq ', arq_name, ': '])
    disp(best)
    
    bestTV = [];
    bestIAE = [];
    bestISE = [];
    for i = 1:filter
        bestTV = [bestTV p_vector(1,idx_tv(i))];
        bestIAE = [bestIAE p_vector(1,idx_iae(i))];
        bestISE = [bestISE p_vector(1,idx_ise(i))];
    end
    disp(['Melhores TV para arq ', arq_name])
    disp(bestTV)
    disp(['Melhores IAE para arq ', arq_name])
    disp(bestIAE)
    disp(['Melhores ISE para arq ', arq_name])
    disp(bestISE)
    clear tv_vec ise_vec iae_vec
end
