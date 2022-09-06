clear

load('compara')

close all

best_arq2=[65, 70];
colour_vec = ['b', 'g', 'r', 'c', 'y', 'k'];
[rowl,columns] = size(best_arq2);
legenCell = cell(rowl,columns+2);

%%
tiledlayout(2,1)

nexttile

for c = 1:columns
    idx = find(values_vector == best_arq2(c));
    if c == 1
        plot(saidas_2(idx)+24, colour_vec(c))
        legendCell{c} = ['Saída real ',num2str(best_arq2(c)), '% arq2'];
        hold on
    else
        plot(saidas_2(idx)+24, colour_vec(c))
        legendCell{c} = ['Saída real ',num2str(best_arq2(c)), '% arq2'];
    end
end
plot(saida_1+24, 'm')
legendCell{columns+1} = 'Saída arq 1';
plot(ref+24, 'k')
legendCell{columns+2} = 'ref';
legend(legendCell);
axis([0 inf -10 65]);

nexttile

legenCell = cell(rowl,columns*2+2);

for c = 1:columns
    idx = find(values_vector == best_arq2(c));
    if c == 1
        plot(controles_2(idx)-disturb+observador_2(idx)-52+24, colour_vec(c))
        legendCell{c} = ['Controle real ',num2str(best_arq2(c)), '% arq2'];
        hold on
    else
        plot(controles_2(idx)-disturb+observador_2(idx)-52+24, colour_vec(c))
        legendCell{c} = ['Controle real ',num2str(best_arq2(c)), '% arq2'];
    end
end
for c = 1:columns
    idx = find(values_vector == best_arq2(c));
    plot(observador_2(idx), colour_vec(c+columns))
    legendCell{c+columns} = ['Observador ',num2str(best_arq2(c)), '% arq2'];
end
plot(controle_1-disturb-52+24, 'm')
legendCell{columns*2+1} = 'Controle arq 1';
plot(disturb, 'k')
legendCell{columns*2+1} = 'disturbio';
legend(legendCell);
axis([0 inf -25 35]);

%%
figure
%%
best_arq4=[70, 120];
[rowl,columns] = size(best_arq4);

tiledlayout(2,1)

nexttile

for c = 1:columns
    idx = find(values_vector_4 == best_arq4(c));
    if c == 1
        plot(saidas_4(idx)+24, colour_vec(c))
        legendCell{c} = ['Saída real ',num2str(best_arq4(c)), '% arq4'];
        hold on
    else
        plot(saidas_4(idx)+24, colour_vec(c))
        legendCell{c} = ['Saída real ',num2str(best_arq4(c)), '% arq4'];
    end
end
plot(saida_3+24, 'm')
legendCell{columns+1} = 'Saída arq 3';
plot(ref + 24, 'k')
legendCell{columns+1} = 'ref';
legend(legendCell);
axis([0 inf -10 65]);

legenCell = cell(rowl,columns*2+2);

nexttile

for c = 1:columns
    idx = find(values_vector_4 == best_arq4(c));
    if c == 1
        plot(controles_4(idx)-disturb+observador_2(idx)-52+24, colour_vec(c))
        legendCell{c} = ['Controle real ',num2str(best_arq4(c)), '% arq4'];
        hold on
    else
        plot(controles_4(idx)-disturb+observador_2(idx)-52+24, colour_vec(c))
        legendCell{c} = ['Controle real ',num2str(best_arq4(c)), '% arq4'];
    end
end
for c = 1:columns
    idx = find(values_vector_4 == best_arq4(c));
    plot(observador_4(idx), colour_vec(c+columns))
    legendCell{c+columns} = ['Observador ',num2str(best_arq4(c)), '% arq4'];
end
plot(controle_3-disturb-52+24, 'm')
legendCell{columns*2+1} = 'Controle arq 3';
plot(disturb, 'k')
legendCell{columns*2+2} = 'disturbio';
legend(legendCell);
axis([0 inf -25 35]);
hold off

%%
figure
%%
best_arq4=[50, 120];
[rowl,columns2] = size(best_arq2);
[rowl,columns4] = size(best_arq4);

legenCell = cell(rowl,columns2+columns4+2);

for c = 1:columns2
    idx = find(values_vector == best_arq2(c));
    if c == 1
        plot(saidas_2(idx)+24, colour_vec(c))
        legendCell{c} = ['Saída real ',num2str(best_arq2(c)), '% arq2'];
        hold on
    else
        plot(saidas_2(idx)+24, colour_vec(c))
        legendCell{c} = ['Saída real ',num2str(best_arq2(c)), '% arq2'];
    end
end
for c = 1:columns4
    idx = find(values_vector_4 == best_arq4(c));
    if c == 1
        plot(saidas_4(idx)+24, colour_vec(c+columns2))
        legendCell{c+columns2} = ['Saída real ',num2str(best_arq4(c)), '% arq4'];
        hold on
    else
        plot(saidas_4(idx)+24, colour_vec(c+columns2))
        legendCell{c+columns2} = ['Saída real ',num2str(best_arq4(c)), '% arq4'];
    end
end
plot(saida_1+24, 'm')
legendCell{columns2+columns4+1} = 'Saída arq 1';
plot(ref + 24, 'k')
legendCell{columns2+columns4+2} = 'ref';
legend(legendCell);
axis([0 inf -10 65]);
hold off

clear best_arq2 best_arq4 colour_vec rowl columns columns2 columns4 legenCell