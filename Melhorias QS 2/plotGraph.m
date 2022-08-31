clear

load('compara')

values_to_plot=[85, 120];
colour_vec = ['b', 'g', 'r', 'c', 'y'];

[rowl,columns] = size(values_to_plot);
legenCell = cell(rowl,columns+2);
tiledlayout(2,1)

nexttile

for c = 1:columns
    idx = find(values_vector == values_to_plot(c));
    if c == 1
        plot(saidas_2(idx), colour_vec(c))
        legendCell{c} = ['Saída real ',num2str(values_to_plot(c)), ' arq2'];
        hold on
    else
        plot(saidas_2(idx), colour_vec(c))
        legendCell{c} = ['Saída real ',num2str(values_to_plot(c)), ' arq2'];
    end
end
plot(saida_1, 'm')
legendCell{columns+1} = 'Saída arq 1';
plot(ref + input, 'k')
legendCell{columns+2} = 'ref + disturbio';
legend(legendCell);
axis([0 inf -25 35]);

nexttile

for c = 1:columns
    idx = find(values_vector_4 == values_to_plot(c));
    if c == 1
        plot(saidas_4(idx), colour_vec(c))
        legendCell{c} = ['Saída real ',num2str(values_to_plot(c)), ' arq4'];
        hold on
    else
        plot(saidas_4(idx), colour_vec(c))
        legendCell{c} = ['Saída real ',num2str(values_to_plot(c)), ' arq4'];
    end
end
plot(saida_3, 'm')
legendCell{columns+1} = 'Saída arq 3';
plot(ref + input, 'k')
legendCell{columns+2} = 'ref + disturbio';
legend(legendCell);
axis([0 inf -25 35]);
hold off
%%
figure
tiledlayout(2,1)

nexttile

for c = 1:columns
    idx = find(values_vector == values_to_plot(c));
    if c == 1
        plot(controles_2(idx), colour_vec(c))
        legendCell{c} = ['Controle real ',num2str(values_to_plot(c)), ' arq2'];
        hold on
    else
        plot(controles_2(idx), colour_vec(c))
        legendCell{c} = ['Controle real ',num2str(values_to_plot(c)), ' arq2'];
    end
end
plot(saida_1, 'm')
legendCell{columns+1} = 'Saída arq 1';
plot(ref + input, 'k')
legendCell{columns+2} = 'ref + disturbio';
legend(legendCell);
axis([0 inf -25 35]);

nexttile

for c = 1:columns
    idx = find(values_vector_4 == values_to_plot(c));
    if c == 1
        plot(controles_4(idx), colour_vec(c))
        legendCell{c} = ['Controle real ',num2str(values_to_plot(c)), ' arq4'];
        hold on
    else
        plot(controles_4(idx), colour_vec(c))
        legendCell{c} = ['Controle real ',num2str(values_to_plot(c)), ' arq4'];
    end
end
plot(saida_3, 'm')
legendCell{columns+1} = 'Saída arq 3';
plot(ref + input, 'k')
legendCell{columns+2} = 'ref + disturbio';
legend(legendCell);
axis([0 inf -25 35]);
hold off
%%
figure
tiledlayout(2,1)

nexttile

for c = 1:columns
    idx = find(values_vector == values_to_plot(c));
    if c == 1
        plot(observador_2(idx), colour_vec(c))
        legendCell{c} = ['Observador ',num2str(values_to_plot(c)), ' arq2'];
        hold on
    else
        plot(observador_2(idx), colour_vec(c))
        legendCell{c} = ['Observador ',num2str(values_to_plot(c)), ' arq2'];
    end
end
plot(ref + input, 'k')
legendCell{columns+2} = 'ref + disturbio';
legend(legendCell);
axis([0 inf -25 35]);

nexttile

for c = 1:columns
    idx = find(values_vector_4 == values_to_plot(c));
    if c == 1
        plot(observador_4(idx), colour_vec(c))
        legendCell{c} = ['Observador ',num2str(values_to_plot(c)), ' arq4'];
        hold on
    else
        plot(controles_4(idx), colour_vec(c))
        legendCell{c} = ['Observador ',num2str(values_to_plot(c)), ' arq4'];
    end
end
plot(observador_3, 'm')
legendCell{columns+1} = 'Observador arq 3';
plot(ref + input, 'k')
legendCell{columns+2} = 'ref + disturbio';
legend(legendCell);
axis([0 inf -25 35]);
hold off

clear values_to_plot colour_vec rowl columns legenCell