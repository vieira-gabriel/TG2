clear

load('compara')

values_to_plot=[85, 100, 120];
colour_vec = ['b', 'g', 'r', 'c', 'y', 'k'];

[rowl,columns] = size(values_to_plot);
legenCell = cell(rowl,columns+1);

for c = 1:columns
    idx = find(values_vector == values_to_plot(c));
    if c == 1
        plot(saidas(idx), colour_vec(c))
        legendCell{c} = ['Saída real ',num2str(values_to_plot(c)), ' arq2'];
        hold on
    else
        plot(saidas(idx), colour_vec(c))
        legendCell{c} = ['Saída real ',num2str(values_to_plot(c)), ' arq2'];
    end

    idx = find(values_vector_4 == values_to_plot(c));
    plot(saidas_4(idx), colour_vec(c+columns))
    legendCell{c+columns} = ['Saída real ',num2str(values_to_plot(c)), ' arq4'];
    
end
plot(ref + input, 'm')
legendCell{columns*2+1} = 'ref + disturbio';
legend(legendCell);
axis([0 inf -25 35]);
hold off

figure

for c = 1:columns
    idx = find(values_vector == values_to_plot(c));
    if c == 1
        plot(controles(idx), colour_vec(c))
        legendCell{c} = ['Controle real ',num2str(values_to_plot(c)), ' arq2'];
        hold on
    else
        plot(controles(idx), colour_vec(c))
        legendCell{c} = ['Controle real ',num2str(values_to_plot(c)), ' arq2'];
    end

    idx = find(values_vector_4 == values_to_plot(c));
    plot(controles_4(idx), colour_vec(c+columns))
    legendCell{c+columns} = ['Controle real ',num2str(values_to_plot(c)), ' arq4'];
end
plot(ref + input, 'm')
legendCell{columns+1} = 'ref + disturbio';
legend(legendCell);
axis([0 inf -25 35]);
hold off

clear values_to_plot colour_vec rowl columns legenCell