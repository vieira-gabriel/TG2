clear

load('compara')

values_to_plot=[85, 120];
colour_vec = ['b', 'g', 'r', 'c', 'y', 'k'];
[rowl,columns] = size(values_to_plot);
legenCell = cell(rowl,columns+2);

%%
tiledlayout(2,1)

nexttile

for c = 1:columns
    idx = find(values_vector == values_to_plot(c));
    if c == 1
        plot(saidas_2(idx)+24, colour_vec(c))
        legendCell{c} = ['Saída real ',num2str(values_to_plot(c)), '% arq2'];
        hold on
    else
        plot(saidas_2(idx)+24, colour_vec(c))
        legendCell{c} = ['Saída real ',num2str(values_to_plot(c)), '% arq2'];
    end
end
%plot(saida_1+24, 'm')
%legendCell{columns+1} = 'Saída arq 1';
plot(ref+24, 'k')
legendCell{columns+1} = 'ref';
legend(legendCell);
axis([0 inf -10 65]);

nexttile

legenCell = cell(rowl,columns*2+2);
for c = 1:columns
    idx = find(values_vector == values_to_plot(c));
    if c == 1
        plot(controles_2(idx)-disturb+observador_2(idx)-52+24, colour_vec(c))
        legendCell{c} = ['Controle real ',num2str(values_to_plot(c)), '% arq2'];
        hold on
    else
        plot(controles_2(idx)-disturb+observador_2(idx)-52+24, colour_vec(c))
        legendCell{c} = ['Controle real ',num2str(values_to_plot(c)), '% arq2'];
    end
end
for c = 1:columns
    idx = find(values_vector == values_to_plot(c));
        plot(observador_2(idx), colour_vec(c+columns))
        legendCell{c+columns} = ['Observador ',num2str(values_to_plot(c)), '% arq2'];
end
%plot(controle_1-disturb-52+24, 'm')
%legendCell{columns*2+1} = 'Controle arq 1';
plot(disturb, 'k')
legendCell{columns*2+1} = 'disturbio';
legend(legendCell);
axis([0 inf -25 35]);

%%
figure

tiledlayout(2,1)

nexttile

for c = 1:columns
    idx = find(values_vector_4 == values_to_plot(c));
    if c == 1
        plot(saidas_4(idx)+24, colour_vec(c))
        legendCell{c} = ['Saída real ',num2str(values_to_plot(c)), '% arq4'];
        hold on
    else
        plot(saidas_4(idx)+24, colour_vec(c))
        legendCell{c} = ['Saída real ',num2str(values_to_plot(c)), '% arq4'];
    end
end
%plot(saida_3+24, 'm')
%legendCell{columns+1} = 'Saída arq 3';
plot(ref + 24, 'k')
legendCell{columns+1} = 'ref + disturbio';
legend(legendCell);
axis([0 inf -10 65]);

nexttile

for c = 1:columns
    idx = find(values_vector_4 == values_to_plot(c));
    if c == 1
        plot(controles_4(idx)-disturb+observador_2(idx)-52+24, colour_vec(c))
        legendCell{c} = ['Controle real ',num2str(values_to_plot(c)), '% arq4'];
        hold on
    else
        plot(controles_4(idx)-disturb+observador_2(idx)-52+24, colour_vec(c))
        legendCell{c} = ['Controle real ',num2str(values_to_plot(c)), '% arq4'];
    end
end
for c = 1:columns
    idx = find(values_vector == values_to_plot(c));
        plot(observador_4(idx), colour_vec(c+columns))
        legendCell{c+columns} = ['Observador ',num2str(values_to_plot(c)), '% arq4'];
end
%plot(controle_3-disturb-52+24, 'm')
%legendCell{columns*2+1} = 'Controle arq 3';
plot(disturb, 'k')
legendCell{columns*2+1} = 'disturbio';
legend(legendCell);
axis([0 inf -25 35]);
hold off

clear values_to_plot colour_vec rowl columns legenCell