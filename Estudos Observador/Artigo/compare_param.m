addpath('..');
addpath('../functions/');

clear
close all

p_vector = [30, 35, 40, 45, 50, 55, 60, 65, 70, 75, 80, 85, 90, 95, 100, 110, 120, 130, 140, 150]; % Vetor com todas as porcentagens testadas
[r,columns] = size(p_vector);
filter = 6; % Filtro para obter os x melhores valores de cada parâmetro
filter_tv = 15;

Tmin = 1100;
Tmax = 2300;

plot_graph = true;

load('arq1', 'sinalControle', 'sinalSaida', 'Tsim', 'sinalRef') % Arq1 é o nome dado durante os testes para a arquitetura MFB
name1 = 'MFB';

idx = (sinalRef.time > Tmin & sinalRef.time < Tmax);

tv_1 = calcTV(sinalControle.data(idx),Tsim);
ise_1 = calcISE(sinalSaida.data(idx),sinalRef.data(idx),Tsim);
iae_1 = calcIAE(sinalSaida.data(idx),sinalRef.data(idx),Tsim);
disp([name1, ' : iae = ', num2str(iae_1), ' | ise = ', num2str(ise_1), ' | tv = ', num2str(tv_1)])

load('arq3', 'sinalControle', 'sinalSaida', 'Tsim', 'sinalRef') % Arq3 é o nome dado durante os testes para a arquitetura MFE
name = 'MFE'; 
idx = (sinalRef.time > Tmin & sinalRef.time < Tmax);

tv_3 = calcTV(sinalControle.data(idx),Tsim);
ise_3 = calcISE(sinalSaida.data(idx),sinalRef.data(idx),Tsim);
iae_3 = calcIAE(sinalSaida.data(idx),sinalRef.data(idx),Tsim);
disp([name, ' : iae = ', num2str(iae_3), ' | ise = ', num2str(ise_3), ' | tv = ', num2str(tv_3)])

tv_sum = 0;
for arq = 1:1
    for c = 1:columns
        if arq == 1
            filename = ['arq11_tm', num2str(p_vector(1,c)), '.mat']; % Arq2 é o nome dado durante os testes para a arquitetura MOD
            arq_name = 'Arq 11';
            colour = 'g';
        else
            %{
            filename = ['arq4_tm', num2str(p_vector(1,c)), '.mat'];% Arq4 é o nome dado durante os testes para a arquitetura MOF
            arq_name = 'MOF';
            colour = 'b';
            %}
        end

        load(filename, 'sinalControle', 'sinalSaida', 'Tsim', 'sinalRef')
        idx = (sinalRef.time > Tmin & sinalRef.time < Tmax);
        tv = calcTV(sinalControle.data(idx),Tsim);
        ise = calcISE(sinalSaida.data(idx),sinalRef.data(idx),Tsim);
        iae = calcIAE(sinalSaida.data(idx),sinalRef.data(idx),Tsim);
        if exist('tv_vec','var') == 0
            tv_vec = [tv];
            ise_vec = [ise];
            iae_vec = [iae];
        else
            tv_vec = [tv_vec tv];
            ise_vec = [ise_vec ise];
            iae_vec = [iae_vec iae];
        end  
        if arq == 2
            tv_sum = tv_sum + tv; 
        end
    end
 
    
    % Ordena o o vetor com os indicadores do menor valor para o maior
    [sorted_tv,idx_tv] = sort(tv_vec);
    [sorted_iae,idx_iae] = sort(iae_vec);
    [sorted_ise,idx_ise] = sort(ise_vec);
    
    chosen_values = intersect(idx_tv(1:filter_tv), idx_iae(1:filter)); % Confere os melhores valores correspondentes de TV e IAE (quantidade de valores selecionados é determinada por filter) e armazena em chosen_values
    chosen_values = intersect(chosen_values, idx_ise(1:filter)); % Confere os melhores valores correspondentes de ISE e chosen_values (que já possui os correspondentes de TV e IAE) e armazena em chosen_values

    best = [];
    % Identifica qual o valor da porcentagem corresponde aos melhores valores armazenados em chosen_values
    for i = chosen_values
        best = [best p_vector(1,i)];
    end

    for i = 1:columns
        disp([num2str(p_vector(1,i)), '  : iae = ', num2str(iae_vec(i)), ' | ise = ', num2str(ise_vec(i)), ' | tv = ', num2str(tv_vec(i))])
    end

    
    disp(['Valores selecionados como melhores para arq ', arq_name, ': '])
    disp(best)
    
    bestTV = [];
    bestIAE = [];
    bestISE = [];
    for i = 1:filter
        bestIAE = [bestIAE p_vector(1,idx_iae(i))];
        bestISE = [bestISE p_vector(1,idx_ise(i))];
    end
    for i = 1:filter_tv
        bestTV = [bestTV p_vector(1,idx_tv(i))];
    end
    disp(['Melhores IAE para arq ', arq_name])
    disp(bestIAE)
    disp(['Melhores ISE para arq ', arq_name])
    disp(bestISE)
    disp(['Melhores TV para arq ', arq_name])
    disp(bestTV)
  
    % Plotagem dos gráficos com os indicadores
    
    if plot_graph
        f = figure;
        plot(p_vector, iae_vec,colour)
        hold on
        yline(iae_1, '-.r', 'MFB IAE')
        yline(iae_3, '-.r', 'MFE IAE')
        xlim([p_vector(1)-5 p_vector(columns)+5])
        xlabel('Porcentagem (Td=x%*Tb)') 
        ylabel('Valor de IAE') 
        hold off
        title(['Comparação do parâmetro IAE para arquitetura ', arq_name])
        set(gca, 'fontsize', 20, 'fontweight', 'bold');
        f.WindowState = 'maximized';
        saveas(f,['Figuras\Parâmetros\IAE_', arq_name, '.png'])

        f = figure;
        plot(p_vector, ise_vec,colour)
        hold on
        yline(ise_1, '-.r', 'MFB ISE')
        yline(ise_3, '-.r', 'MFE ISE')
        xlim([p_vector(1)-5 p_vector(columns)+5])
        xlabel('Porcentagem (Td=x%*Tb)') 
        ylabel('Valor de ISE') 
        hold off
        title(['Comparação do parâmetro ISE para arquitetura ', arq_name])
        set(gca, 'fontsize', 20, 'fontweight', 'bold');
        f.WindowState = 'maximized';
        saveas(f,['Figuras\Parâmetros\ISE_', arq_name, '.png'])

        f = figure;
        plot(p_vector, tv_vec,colour)
        hold on
        yline(tv_1, '-.r', 'MFB TV')
        yline(tv_3, '-.r', 'MFE TV')
        xlim([p_vector(1)-5 p_vector(columns)+5])
        xlabel('Porcentagem (Td=x%*Tb)') 
        ylabel('Valor de TV') 
        hold off
        title(['Comparação do parâmetro TV para arquitetura ', arq_name])
        set(gca, 'fontsize', 20, 'fontweight', 'bold');
        f.WindowState = 'maximized';
        saveas(f,['Figuras\Parâmetros\TV_', arq_name, '.png'])

    
        if arq == 1
            tv_vec_2 = tv_vec;
            iae_vec_2 = iae_vec;
            ise_vec_2 = ise_vec;
        else   
            
            f = figure;
            plot(p_vector, iae_vec_2,'g')
            hold on
            plot(p_vector, iae_vec,'b')
            yline(iae_1, '-.r', 'MFB IAE')
            yline(iae_3, '-.r', 'MFE IAE')
            legend('MOD IAE', 'MOF IAE')
            xlabel('Porcentagem (Td=x%*Tb)') 
            ylabel('Valor de IAE') 
            xlim([p_vector(1)-5 p_vector(columns)+5])
            hold off
            title('Comparação do parâmetro IAE entre arquiteturas MOD e MOF')
            set(gca, 'fontsize', 20, 'fontweight', 'bold');
            f.WindowState = 'maximized';
            saveas(f,['Figuras\Parâmetros\IAE_Compara.png'])

            f = figure;
            plot(p_vector, ise_vec_2,'g')
            hold on
            plot(p_vector, ise_vec,'b')
            yline(ise_1, '-.r', 'MFB ISE')
            yline(ise_3, '-.r', 'MFE ISE')
            legend('MOD ISE', 'MOF ISE')
            xlabel('Porcentagem (Td=x%*Tb)') 
            ylabel('Valor de ISE')
            xlim([p_vector(1)-5 p_vector(columns)+5])
            hold off
            title('Comparação do parâmetro ISE entre arquiteturas MOD e MOF')
            set(gca, 'fontsize', 20, 'fontweight', 'bold');
            f.WindowState = 'maximized';
            saveas(f,['Figuras\Parâmetros\ISE_Compara.png'])

            f = figure;
            plot(p_vector, tv_vec_2,'g')
            hold on
            plot(p_vector, tv_vec,'b')
            yline(tv_1, '-.r', 'MFB TV')
            yline(tv_3, '-.r', 'MFE TV')
            legend('MOD TV', 'MOF TV')
            xlabel('Porcentagem (Td=x%*Tb)') 
            ylabel('Valor de TV') 
            xlim([p_vector(1)-5 p_vector(columns)+5])
            hold off
            title('Comparação do parâmetro TV entre arquiteturas MOD e MOF')
            set(gca, 'fontsize', 20, 'fontweight', 'bold');
            f.WindowState = 'maximized';
            saveas(f,['Figuras\Parâmetros\TV_Compara.png'])
            %}
        end
    end
  %}
    clear tv_vec ise_vec iae_vec
end
