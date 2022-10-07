clear

load('compara')

close all

best_arq2=[55, 70];
colour_vec = ['b', 'g', 'r', 'c', 'y', 'k'];
[rowl,columns] = size(best_arq2);
legenCell = cell(rowl,columns+2);

%%
fig = figure;
for c = 1:columns
    idx = find(p_vector == best_arq2(c));
    if c == 1
        plot(saidas_2(idx)+24, colour_vec(c))
        legendCell{c} = ['Nível da água (%) para Td = ',num2str(best_arq2(c)), '% * Tb'];
        hold on
    else
        plot(saidas_2(idx)+24, colour_vec(c))
        legendCell{c} = ['Nível da água (%) para Td = ',num2str(best_arq2(c)), '% * Tb'];
    end
end
plot(saida_1+24, 'm')
legendCell{columns+1} = 'Nível da água (%) da MFB';
plot(ref+24, 'k')
legendCell{columns+2} = 'Referência';
legend(legendCell);
axis([0 inf 15 45]);
title('Resposta - Arquitetura MOD')
set(gca, 'fontsize', 20, 'fontweight', 'bold');
ylabel('Output signal') 
fig.WindowState = 'maximized';
saveas(fig,['Imagens\Compara\Saida_MOD.png'])


fig = figure;

legenCell = cell(rowl,columns+2);

for c = 1:columns
    idx = find(p_vector == best_arq2(c));
    if c == 1
        plot(controles_2(idx)-disturb+observador_2(idx)-52, colour_vec(c))
        legendCell{c} = ['Td = ',num2str(best_arq2(c)), '% * Tb'];
        hold on
    else
        plot(controles_2(idx)-disturb+observador_2(idx)-52, colour_vec(c))
        legendCell{c} = ['Td = ',num2str(best_arq2(c)), '% * Tb'];
    end
end
plot(controle_1-disturb-52, 'm')
legendCell{columns+1} = 'Sinal de controle da MFB';
plot(disturb, 'k')
legendCell{columns+2} = 'Distúrbio';
legend(legendCell);
axis([0 inf -5 10]);
title('Saída do controlador - Arquitetura MOD')
ylabel('Controle signal') 
set(gca, 'fontsize', 20, 'fontweight', 'bold');
fig.WindowState = 'maximized';
saveas(fig,['Imagens\Compara\Controle_MOD.png'])

fig = figure;

legenCell = cell(rowl,columns+1);

for c = 1:columns
    idx = find(p_vector == best_arq2(c));
    if c == 1
        plot(observador_2(idx), colour_vec(c))
        legendCell{c} = ['Td = ',num2str(best_arq2(c)), '% * Tb'];
        hold on
    end
    plot(observador_2(idx), colour_vec(c))
    legendCell{c} = ['Td = ',num2str(best_arq2(c)), '% * Tb'];
end
plot(disturb, 'k')
legendCell{columns+1} = 'Distúrbio';
legend(legendCell);
axis([0 inf -5 10]);
hold off
title('Sinal do observador de distúrbio - Arquitetura MOD')
set(gca, 'fontsize', 20, 'fontweight', 'bold');
ylabel('Disturb observer signal')
fig.WindowState = 'maximized';
saveas(fig,['Imagens\Compara\Disturbio_MOD.png'])

%%
best_arq4=[45, 55];
[rowl,columns] = size(best_arq4);
colour_vec = ['b', 'g', 'r', 'c', 'y', 'k'];
%%
fig = figure;

for c = 1:columns
    idx = find(p_vector == best_arq4(c));
    if c == 1
        plot(saidas_4(idx)+24, colour_vec(c))
        legendCell{c} = ['Nível da água (%) para Td = ',num2str(best_arq4(c)), '% * Tb'];
        hold on
    else
        plot(saidas_4(idx)+24, colour_vec(c))
        legendCell{c} = ['Nível da água (%) para Td = ',num2str(best_arq4(c)), '% * Tb'];
    end
end
plot(saida_3+24, 'm')
legendCell{columns+1} = 'Nível da água (%) para MFE';
plot(ref + 24, 'k')
legendCell{columns+1} = 'Referência';
legend(legendCell);
axis([0 inf 15 45]);
title('Resposta - Arquitetura MOF')
ylabel('Output signal') 
set(gca, 'fontsize', 20, 'fontweight', 'bold');
fig.WindowState = 'maximized';
saveas(fig,['Imagens\Compara\Saida_MOF.png'])

legenCell = cell(rowl,columns+2);


fig = figure;

for c = 1:columns
    idx = find(p_vector == best_arq4(c));
    if c == 1
        plot(controles_4(idx)-disturb+observador_4(idx)-52, colour_vec(c))
        legendCell{c} = ['Td = ',num2str(best_arq4(c)), '% * Tb'];
        hold on
    else
        plot(controles_4(idx)-disturb+observador_4(idx)-52, colour_vec(c))
        legendCell{c} = ['Td = ',num2str(best_arq4(c)), '% * Tb'];
    end
end
plot(controle_3-disturb-52, 'm')
legendCell{columns+1} = 'Controle arq 3';
plot(disturb, 'k')
legendCell{columns+2} = 'Distúrbio';
legend(legendCell);
axis([0 inf -5 10]);
hold off
title('Saída do controlador - Arquitetura MOF')
ylabel('Controle signal') 
set(gca, 'fontsize', 20, 'fontweight', 'bold');
fig.WindowState = 'maximized';
saveas(fig,['Imagens\Compara\Controle_MOF.png'])

fig = figure;

legenCell = cell(rowl,columns+1);

for c = 1:columns
    idx = find(p_vector == best_arq4(c));
    if c == 1
        plot(observador_4(idx), colour_vec(c))
        legendCell{c+columns} = ['Td = ',num2str(best_arq4(c)), '% * Tb'];
        hold on
    end
    plot(observador_4(idx), colour_vec(c))
    legendCell{c} = ['Td = ',num2str(best_arq4(c)), '% * Tb'];
end
plot(disturb, 'k')
legendCell{columns+1} = 'Distúrbio';
legend(legendCell);
axis([0 inf -5 10]);
hold off
title('Sinal do observador de distúrbio - Arquitetura MOF')
ylabel('Disturb observer signal')
set(gca, 'fontsize', 20, 'fontweight', 'bold');
fig.WindowState = 'maximized';
saveas(fig,['Imagens\Compara\Disturbio_MOF.png'])

%%
fig = figure;
best_arq2 = [55];
best_arq4 = [45];

[rowl,columns2] = size(best_arq2);
[rowl,columns4] = size(best_arq4);

legenCell = cell(rowl,columns2+columns4+2);

for c = 1:columns2
    idx = find(p_vector == best_arq2(c));
    if c == 1
        plot(saidas_2(idx)+24, colour_vec(c))
        legendCell{c} = ['Nível da água (%) para Td = ',num2str(best_arq2(c)), '% * Tb na MOD'];
        hold on
    else
        plot(saidas_2(idx)+24, colour_vec(c))
        legendCell{c} = ['Nível da água (%) para Td = ',num2str(best_arq2(c)), '% * Tb na MOD'];
    end
end
for c = 1:columns4
    idx = find(p_vector == best_arq4(c));
    if c == 1
        plot(saidas_4(idx)+24, colour_vec(c+columns2))
        legendCell{c+columns2} = ['Nível da água (%) para Td = ',num2str(best_arq4(c)), '% * Tb na MOF'];
        hold on
    else
        plot(saidas_4(idx)+24, colour_vec(c+columns2))
        legendCell{c+columns2} = ['Nível da água (%) para Td = ',num2str(best_arq4(c)), '% * Tb na MOF'];
    end
end
plot(saida_3+24, 'm')
legendCell{columns2+columns4+1} = 'Nível da água (%) para MFE';
plot(ref + 24, 'k')
legendCell{columns2+columns4+2} = 'Referência';
legend(legendCell);
axis([0 inf 15 45]);
hold off
title('Comparação das respostas da MFE, MOD e MOF')
set(gca, 'fontsize', 20, 'fontweight', 'bold');
ylabel('Output signal')
fig.WindowState = 'maximized';
saveas(fig,['Imagens\Compara\Melhores.png'])

clear best_arq2 best_arq4 colour_vec rowl columns columns2 columns4 legenCell
close all