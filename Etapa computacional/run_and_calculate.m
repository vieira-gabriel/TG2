addpath('.');
addpath('./functions/');
plotg = true;
plotSave = true;
test1 = true;
test2 = false;
test3 = false;
if test1
%% Load variables 1

s = tf('s');

T = 62;
K = 2.6;

Td = T*(2/100);

Gs =  K/(T*s+1);

C = 3 * (30*s+1)/(30*s);

Qs = 1/(Td*s+1);

G_inv = Gs^(-1);

G_inv_Q = Gs^(-1) * Qs;

sigma_n = 0.5;

%% Run simulation

Tsim = 600;
out = sim('obs_com_filtro', Tsim);

%% Calculate TV, ISE, IAE
idx = (out.input.time > 100 & out.input.time < 400);

DesRef = out.input.data(idx);

DesData = out.control.data(idx);
TV_arq1 = calcTV(DesData,Tsim);
DesData = out.output.data(idx);
ISE_arq1 = calcISE(DesData,DesRef,Tsim);
IAE_arq1 = calcIAE(DesData,DesRef,Tsim);

tv_vec = [TV_arq1];
ise_vec = [ISE_arq1];
iae_vec = [IAE_arq1];

first_order_param = [TV_arq1 ISE_arq1 IAE_arq1];

DesData = out.control2.data(idx);
TV_arq2 = calcTV(DesData,Tsim);
DesData = out.output2.data(idx);
ISE_arq2 = calcISE(DesData,DesRef,Tsim);
IAE_arq2 = calcIAE(DesData,DesRef,Tsim);

tv_vec = [tv_vec TV_arq2];
ise_vec = [ise_vec ISE_arq2];
iae_vec = [iae_vec IAE_arq2];

arq2_param = [TV_arq2 ISE_arq2 IAE_arq2];

DesData = out.control3.data(idx);
TV_arq3 = calcTV(DesData,Tsim);
DesData = out.output3.data(idx);
ISE_arq3 = calcISE(DesData,DesRef,Tsim);
IAE_arq3 = calcIAE(DesData,DesRef,Tsim);

tv_vec = [tv_vec TV_arq3];
ise_vec = [ise_vec ISE_arq3];
iae_vec = [iae_vec IAE_arq3];

arq3_param = [TV_arq3 ISE_arq3 IAE_arq3];

DesData = out.control4.data(idx);
TV_arq4 = calcTV(DesData,Tsim);
DesData = out.output4.data(idx);
ISE_arq4 = calcISE(DesData,DesRef,Tsim);
IAE_arq4 = calcIAE(DesData,DesRef,Tsim);

tv_vec = [tv_vec TV_arq4];
ise_vec = [ise_vec ISE_arq4];
iae_vec = [iae_vec IAE_arq4];

arq4_param = [TV_arq4 ISE_arq4 IAE_arq4];

DesData = out.control5.data(idx);
TV_arq5 = calcTV(DesData,Tsim);
DesData = out.output5.data(idx);
ISE_arq5 = calcISE(DesData,DesRef,Tsim);
IAE_arq5 = calcIAE(DesData,DesRef,Tsim);

tv_vec = [tv_vec TV_arq5];
ise_vec = [ise_vec ISE_arq5];
iae_vec = [iae_vec IAE_arq5];

arq5_param = [TV_arq5 ISE_arq5 IAE_arq5];

DesData = out.control6.data(idx);
TV_arq6 = calcTV(DesData,Tsim);
DesData = out.output6.data(idx);
ISE_arq6 = calcISE(DesData,DesRef,Tsim);
IAE_arq6 = calcIAE(DesData,DesRef,Tsim);

tv_vec = [tv_vec TV_arq6];
ise_vec = [ise_vec ISE_arq6];
iae_vec = [iae_vec IAE_arq6];

arq6_param = [TV_arq6 ISE_arq6 IAE_arq6];

DesData = out.control7.data(idx);
TV_arq7 = calcTV(DesData,Tsim);
DesData = out.output7.data(idx);
ISE_arq7 = calcISE(DesData,DesRef,Tsim);
IAE_arq7 = calcIAE(DesData,DesRef,Tsim);

tv_vec = [tv_vec TV_arq7];
ise_vec = [ise_vec ISE_arq7];
iae_vec = [iae_vec IAE_arq7];

arq7_param = [TV_arq7 ISE_arq7 IAE_arq7];

DesData = out.control8.data(idx);
TV_arq8 = calcTV(DesData,Tsim);
DesData = out.output8.data(idx);
ISE_arq8 = calcISE(DesData,DesRef,Tsim);
IAE_arq8 = calcIAE(DesData,DesRef,Tsim);

tv_vec = [tv_vec TV_arq8];
ise_vec = [ise_vec ISE_arq8];
iae_vec = [iae_vec IAE_arq8];

arq8_param = [TV_arq8 ISE_arq8 IAE_arq8];

DesData = out.control8_new.data(idx);
TV_arq8_new = calcTV(DesData,Tsim);
DesData = out.output8_new.data(idx);
ISE_arq8_new = calcISE(DesData,DesRef,Tsim);
IAE_arq8_new = calcIAE(DesData,DesRef,Tsim);

tv_vec = [tv_vec TV_arq8_new];
ise_vec = [ise_vec ISE_arq8_new];
iae_vec = [iae_vec IAE_arq8_new];

arq8_new_param = [TV_arq8_new ISE_arq8_new IAE_arq8_new];

DesData = out.control9.data(idx);
TV_arq9 = calcTV(DesData,Tsim);
DesData = out.output9.data(idx);
ISE_arq9 = calcISE(DesData,DesRef,Tsim);
IAE_arq9 = calcIAE(DesData,DesRef,Tsim);

tv_vec = [tv_vec TV_arq9];
ise_vec = [ise_vec ISE_arq9];
iae_vec = [iae_vec IAE_arq9];

arq9_param = [TV_arq9 ISE_arq9 IAE_arq9];

DesData = out.control10.data(idx);
TV_arq10 = calcTV(DesData,Tsim);
DesData = out.output10.data(idx);
ISE_arq10 = calcISE(DesData,DesRef,Tsim);
IAE_arq10 = calcIAE(DesData,DesRef,Tsim);

tv_vec = [tv_vec TV_arq10];
ise_vec = [ise_vec ISE_arq10];
iae_vec = [iae_vec IAE_arq10];

arq10_param = [TV_arq10 ISE_arq10 IAE_arq10];

DesData = out.control11.data(idx);
TV_arq11 = calcTV(DesData,Tsim);
DesData = out.output11.data(idx);
ISE_arq11 = calcISE(DesData,DesRef,Tsim);
IAE_arq11 = calcIAE(DesData,DesRef,Tsim);

tv_vec = [tv_vec TV_arq11];
ise_vec = [ise_vec ISE_arq11];
iae_vec = [iae_vec IAE_arq11];

arq11_param = [TV_arq11 ISE_arq11 IAE_arq11];

DesData = out.control12.data(idx);
TV_arq12 = calcTV(DesData,Tsim);
DesData = out.output12.data(idx);
ISE_arq12 = calcISE(DesData,DesRef,Tsim);
IAE_arq12 = calcIAE(DesData,DesRef,Tsim);

tv_vec = [tv_vec TV_arq12];
ise_vec = [ise_vec ISE_arq12];
iae_vec = [iae_vec IAE_arq12];

arq12_param = [TV_arq12 ISE_arq12 IAE_arq12];

disp(['Arq1:  IAE = ', num2str(IAE_arq1), ' ISE = ', num2str(ISE_arq1), ' TV = ', num2str(TV_arq1)])
disp(['Arq2:  IAE = ', num2str(IAE_arq2), ' ISE = ', num2str(ISE_arq2), ' TV = ', num2str(TV_arq2)])
disp(['Arq3:  IAE = ', num2str(IAE_arq3), ' ISE = ', num2str(ISE_arq3), ' TV = ', num2str(TV_arq3)])
disp(['Arq4:  IAE = ', num2str(IAE_arq4), ' ISE = ', num2str(ISE_arq4), ' TV = ', num2str(TV_arq4)])
disp(['Arq5:  IAE = ', num2str(IAE_arq5), ' ISE = ', num2str(ISE_arq5), ' TV = ', num2str(TV_arq5)])
disp(['Arq6:  IAE = ', num2str(IAE_arq6), ' ISE = ', num2str(ISE_arq6), ' TV = ', num2str(TV_arq6)])
disp(['Arq7:  IAE = ', num2str(IAE_arq7), ' ISE = ', num2str(ISE_arq7), ' TV = ', num2str(TV_arq7)])
disp(['Arq8:  IAE = ', num2str(IAE_arq8), ' ISE = ', num2str(ISE_arq8), ' TV = ', num2str(TV_arq8)])
disp(['Arq8n: IAE = ', num2str(IAE_arq8_new), ' ISE = ', num2str(ISE_arq8_new), ' TV = ', num2str(TV_arq8_new)])
disp(['Arq9:  IAE = ', num2str(IAE_arq9), ' ISE = ', num2str(ISE_arq9), ' TV = ', num2str(TV_arq9)])
disp(['Arq10: IAE = ', num2str(IAE_arq10), ' ISE = ', num2str(ISE_arq10), ' TV = ', num2str(TV_arq10)])
disp(['Arq11: IAE = ', num2str(IAE_arq11), ' ISE = ', num2str(ISE_arq11), ' TV = ', num2str(TV_arq11)])
disp(['Arq12: IAE = ', num2str(IAE_arq12), ' ISE = ', num2str(ISE_arq12), ' TV = ', num2str(TV_arq12)])

[sorted_tv,idx_tv] = sort(tv_vec);
[sorted_iae,idx_iae] = sort(iae_vec);
[sorted_ise,idx_ise] = sort(ise_vec);

disp('Ordem dos melhores IAE:')
disp(idx_iae)
disp('Ordem dos melhores ISE:')
disp(idx_ise)
disp('Ordem dos melhores TV:')
disp(idx_tv)

%% Plot graph
if plotg
%% Out 8, 9 and 10

f = figure;
plot(out.input, 'LineWidth', 2);
hold
plot(out.dist, 'LineWidth', 2);
plot(out.output, 'LineWidth', 2);
plot(out.output8, 'LineWidth', 2);
plot(out.output10, 'LineWidth', 2);
legend('r', 'd', 'Arq 1', 'Arq 8', 'Arq 10');
ylabel('System Output');
xlabel('Time (s)');
ylim([-0.01 1.5])
set(gca, 'fontsize', 20, 'fontweight', 'bold');
title(['sigma_n = ' num2str(sigma_n)])
f.WindowState = 'maximized';
if plotSave
    saveas(f,['Figuras\Analise 8, 9 e 10\8e10-0.5_out.png'])
end
%%
f = figure;
plot(out.input, 'LineWidth', 2);
hold
plot(out.dist, 'LineWidth', 2);
plot(out.output, 'LineWidth', 2);
plot(out.output9, 'LineWidth', 2);
legend('r', 'd', 'Arq 1', 'Arq 9');
ylabel('System Output');
xlabel('Time (s)');
ylim([-inf inf])
set(gca, 'fontsize', 20, 'fontweight', 'bold');
title(['sigma_n = ' num2str(sigma_n)])
f.WindowState = 'maximized';
if plotSave
    saveas(f,['Figuras\Analise 8, 9 e 10\9-0.5_out.png'])
end

%% Cont 8, 9 and 10

f = figure;
plot(out.input, 'LineWidth', 2);
hold
plot(out.dist, 'LineWidth', 2);
plot(out.control, 'LineWidth', 2);
plot(out.control8, 'LineWidth', 2);
plot(out.control10, 'LineWidth', 2);
legend('r', 'd', 'Arq 1', 'Arq 8', 'Arq 10');
ylabel('Control Signal');
xlabel('Time (s)');
ylim([-10 10])
set(gca, 'fontsize', 20, 'fontweight', 'bold');
title(['sigma_n = ' num2str(sigma_n)])
f.WindowState = 'maximized';
if plotSave
    saveas(f,['Figuras\Analise 8, 9 e 10\8e10-0.5_cont.png'])
end

f = figure;
plot(out.input, 'LineWidth', 2);
hold
plot(out.dist, 'LineWidth', 2);
plot(out.control, 'LineWidth', 2);
plot(out.control9, 'LineWidth', 2);
legend('r', 'd', 'Arq 1', 'Arq 9');
ylabel('Control Signal');
xlabel('Time (s)');
ylim([-inf inf])
set(gca, 'fontsize', 20, 'fontweight', 'bold');
title(['sigma_n = ' num2str(sigma_n)])
f.WindowState = 'maximized';
if plotSave
    saveas(f,['Figuras\Analise 8, 9 e 10\9-0.5_cont.png'])
end


%% sigma *2

sigma_n = 0.5 * 2;

Tsim = 600;
out = sim('obs_com_filtro', Tsim);


f = figure;
plot(out.input, 'LineWidth', 2);
hold
plot(out.dist, 'LineWidth', 2);
plot(out.output, 'LineWidth', 2);
plot(out.output8, 'LineWidth', 2);
plot(out.output10, 'LineWidth', 2);
legend('r', 'd', 'Arq 1', 'Arq 8', 'Arq 10');
ylabel('System Output');
xlabel('Time (s)');
ylim([-0.01 1.5])
set(gca, 'fontsize', 20, 'fontweight', 'bold');
title(['sigma_n = ' num2str(sigma_n)])
f.WindowState = 'maximized';
if plotSave
    saveas(f,['Figuras\Analise 8, 9 e 10\8e10-1_out.png'])
end

f = figure;
plot(out.input, 'LineWidth', 2);
hold
plot(out.dist, 'LineWidth', 2);
plot(out.output, 'LineWidth', 2);
plot(out.output9, 'LineWidth', 2);
legend('r', 'd', 'Arq 1', 'Arq 9');
ylabel('System Output');
xlabel('Time (s)');
ylim([-inf inf])
set(gca, 'fontsize', 20, 'fontweight', 'bold');
title(['sigma_n = ' num2str(sigma_n)])
f.WindowState = 'maximized';
if plotSave
    saveas(f,['Figuras\Analise 8, 9 e 10\9-1_out.png'])
end

f = figure;
plot(out.input, 'LineWidth', 2);
hold
plot(out.dist, 'LineWidth', 2);
plot(out.control, 'LineWidth', 2);
plot(out.control8, 'LineWidth', 2);
plot(out.control10, 'LineWidth', 2);
legend('r', 'd', 'Arq 1', 'Arq 8', 'Arq 10');
ylabel('Control Signal');
xlabel('Time (s)');
ylim([-10 10])
set(gca, 'fontsize', 20, 'fontweight', 'bold');
title(['sigma_n = ' num2str(sigma_n)])
f.WindowState = 'maximized';
if plotSave
    saveas(f,['Figuras\Analise 8, 9 e 10\8e10-1_cont.png'])
end

f = figure;
plot(out.input, 'LineWidth', 2);
hold
plot(out.dist, 'LineWidth', 2);
plot(out.control, 'LineWidth', 2);
plot(out.control9, 'LineWidth', 2);
legend('r', 'd', 'Arq 1', 'Arq 9');
ylabel('Control Signal');
xlabel('Time (s)');
ylim([-inf inf])
set(gca, 'fontsize', 20, 'fontweight', 'bold');
title(['sigma_n = ' num2str(sigma_n)])
f.WindowState = 'maximized';
if plotSave
    saveas(f,['Figuras\Analise 8, 9 e 10\9-1_cont.png'])
end
%%

f = figure;
plot(out.input, 'LineWidth', 2);
hold
plot(out.dist, 'LineWidth', 2);
plot(out.output, 'LineWidth', 2);
plot(out.output2, 'LineWidth', 2);
plot(out.output3, 'LineWidth', 2);
plot(out.output4, 'LineWidth', 2);
plot(out.output5, 'LineWidth', 2);
plot(out.output6,'color', '#01B8AA', 'LineWidth', 2);
plot(out.output7,'color', '#FFC1CB', 'LineWidth', 2);
plot(out.output8, 'm', 'LineWidth', 2);
plot(out.output10, 'k', 'LineWidth', 2);
%plot(out.output11, 'color', '#01B8AA', 'LineWidth', 2);
%plot(out.output12, 'color', '#01B8AA', 'LineWidth', 2);
legend('r', 'd', 'Arq 1', 'Arq 2', 'Arq 3', 'Arq 4', 'Arq 5', 'Arq 6', 'Arq 7', 'Arq 8', 'Arq 10', 'Arq 11', 'Arq 12');
ylabel('System Output');
xlabel('Time (s)');
ylim([-0.01 1.5])
set(gca, 'fontsize', 20, 'fontweight', 'bold', 'color', 'none');
title('')
f.WindowState = 'maximized';
if plotSave
    saveas(f,['Figuras\ensaio 1\out\e1-out-all.png'])
end
%%
f = figure;
plot(out.input, 'LineWidth', 2);
hold
plot(out.dist, 'LineWidth', 2);
plot(out.output, 'LineWidth', 2);
plot(out.output8_new, 'LineWidth', 2);
plot(out.output11, 'LineWidth', 2);
plot(out.output12, 'LineWidth', 2);
legend('r', 'd', 'Arq 1', 'Arq 8 - new', 'Arq 11', 'Arq 12');
ylabel('System Output');
xlabel('Time (s)');
ylim([-0.01 1.5])
set(gca, 'fontsize', 20, 'fontweight', 'bold', 'color', 'none');
title('')
f.WindowState = 'maximized';
if plotSave
    saveas(f,['Figuras\ensaio 1\out\e1-out-8n_11_12.png'])
end

f = figure;
plot(out.input, 'LineWidth', 2);
hold
plot(out.dist, 'LineWidth', 2);
plot(out.output, 'LineWidth', 2);
plot(out.output8, 'LineWidth', 2);
plot(out.output8_new, 'LineWidth', 2);
legend('r', 'd', 'Arq 1', 'Arq 8', 'Arq 8 - new');
ylabel('System Output');
xlabel('Time (s)');
ylim([-0.01 1.5])
set(gca, 'fontsize', 20, 'fontweight', 'bold', 'color', 'none');
title('')
f.WindowState = 'maximized';
if plotSave
    saveas(f,['Figuras\ensaio 1\out\e1-out-8n_11_12.png'])
end

%%
f = figure;
plot(out.input, 'LineWidth', 2);
hold
plot(out.dist, 'LineWidth', 2);
plot(out.output, 'LineWidth', 2);
plot(out.output2, 'LineWidth', 2);
legend('r', 'd', 'Arq 1', 'Arq 2');
ylabel('System Output');
xlabel('Time (s)');
ylim([-0.01 1.5])
set(gca, 'fontsize', 20, 'fontweight', 'bold');
title('')
f.WindowState = 'maximized';
if plotSave
    saveas(f,['Figuras\ensaio 1\out\e1-out-2.png'])
end

f = figure;
plot(out.input, 'LineWidth', 2);
hold
plot(out.dist, 'LineWidth', 2);
plot(out.output, 'LineWidth', 2);
plot(out.output3, 'LineWidth', 2);
legend('r', 'd', 'Arq 1', 'Arq 3');
ylabel('System Output');
xlabel('Time (s)');
ylim([-0.01 1.5])
set(gca, 'fontsize', 20, 'fontweight', 'bold');
title('')
f.WindowState = 'maximized';
if plotSave
    saveas(f,['Figuras\ensaio 1\out\e1-out-3.png'])
end

f = figure;
plot(out.input, 'LineWidth', 2);
hold
plot(out.dist, 'LineWidth', 2);
plot(out.output, 'LineWidth', 2);
plot(out.output4, 'LineWidth', 2);
legend('r', 'd', 'Arq 1', 'Arq 4');
ylabel('System Output');
xlabel('Time (s)');
ylim([-0.01 1.5])
set(gca, 'fontsize', 20, 'fontweight', 'bold');
title('')
f.WindowState = 'maximized';
if plotSave
    saveas(f,['Figuras\ensaio 1\out\e1-out-4.png'])
end

f = figure;
plot(out.input, 'LineWidth', 2);
hold
plot(out.dist, 'LineWidth', 2);
plot(out.output, 'LineWidth', 2);
plot(out.output5, 'LineWidth', 2);
legend('r', 'd', 'Arq 1', 'Arq 5');
ylabel('System Output');
xlabel('Time (s)');
ylim([-0.01 1.5])
set(gca, 'fontsize', 20, 'fontweight', 'bold');
title('')
f.WindowState = 'maximized';
if plotSave
    saveas(f,['Figuras\ensaio 1\out\e1-out-5.png'])
end

%%
f = figure;
%tiledlayout(1,2)
%nexttile
plot(out.input, 'LineWidth', 2);
hold
plot(out.dist, 'LineWidth', 2);
plot(out.noise, 'LineWidth', 2);
plot(out.noise2, 'LineWidth', 2);
plot(out.noise3, 'LineWidth', 2);
plot(out.noise4, 'LineWidth', 2);
plot(out.noise5, 'LineWidth', 2);
plot(out.noise6, 'color', '#01B8AA', 'LineWidth', 2);
plot(out.noise7,'color', '#FFC1CB', 'LineWidth', 2);
plot(out.noise8, 'm', 'LineWidth', 2);
plot(out.noise10, 'k', 'LineWidth', 2);
legend('r', 'd', 'Arq 1', 'Arq 2', 'Arq 3', 'Arq 4', 'Arq 5', 'Arq 6', 'Arq 7', 'Arq 8', 'Arq 10');
ylabel('System Output w/ noise');
xlabel('Time (s)');
ylim([-inf inf])
set(gca, 'fontsize', 20, 'fontweight', 'bold');
title('')
f.WindowState = 'maximized';
if plotSave
    saveas(f,['Figuras\ensaio 1\noise\e1-noise-all.png'])
end


f = figure;
tiledlayout(1,2)
nexttile
plot(out.input, 'LineWidth', 2);
hold
plot(out.dist, 'LineWidth', 2);
plot(out.noise, 'LineWidth', 2);
plot(out.noise2, 'LineWidth', 2);
plot(out.noise3, 'LineWidth', 2);
plot(out.noise4, 'LineWidth', 2);
plot(out.noise5, 'LineWidth', 2);
plot(out.noise6, 'color', '#01B8AA', 'LineWidth', 2);
plot(out.noise7,'color', '#FFC1CB', 'LineWidth', 2);
plot(out.noise8, 'm', 'LineWidth', 2);
plot(out.noise10, 'k', 'LineWidth', 2);
legend('r', 'd', 'Arq 1', 'Arq 2', 'Arq 3', 'Arq 4', 'Arq 5', 'Arq 6', 'Arq 7', 'Arq 8', 'Arq 10');
ylabel('System Output w/ noise');
xlabel('Time (s)');
xlim([140 220])
ylim([0.94 1.08])
set(gca, 'fontsize', 20, 'fontweight', 'bold');
title('')
nexttile
plot(out.input, 'LineWidth', 2);
hold
plot(out.dist, 'LineWidth', 2);
plot(out.noise, 'LineWidth', 2);
plot(out.noise4, 'color', '#4DBEEE', 'LineWidth', 2);
plot(out.noise5, 'color', '#A2142F','LineWidth', 2);
plot(out.noise10, 'k', 'LineWidth', 2);
legend('r', 'd', 'Arq 1', 'Arq 4', 'Arq 5', 'Arq 10');
ylabel('System Output w/ noise');
xlabel('Time (s)');
xlim([140 220])
ylim([0.94 1.08])
set(gca, 'fontsize', 20, 'fontweight', 'bold');
title('')
f.WindowState = 'maximized';
if plotSave
    saveas(f,['Figuras\ensaio 1\noise\e1-noise-combined-zoom2.png'])
end
%%
f = figure;
plot(out.input, 'LineWidth', 2);
hold
plot(out.dist, 'LineWidth', 2);
plot(out.noise4, 'LineWidth', 2);
plot(out.noise5, 'LineWidth', 2);
plot(out.noise10, 'LineWidth', 2);
legend('r', 'd', 'Arq 4', 'Arq 5', 'Arq 10');
ylabel('System Output w/ noise');
xlabel('Time (s)');
ylim([-0.01 1.5])
set(gca, 'fontsize', 20, 'fontweight', 'bold');
title('')
f.WindowState = 'maximized';
if plotSave
    saveas(f,['Figuras\ensaio 1\noise\e1-noise-best.png'])
end

%% Out noise 8, 9 and 10
f = figure;
plot(out.input, 'LineWidth', 2);
hold
plot(out.dist, 'LineWidth', 2);
plot(out.noise, 'LineWidth', 2);
plot(out.noise8, 'LineWidth', 2);
plot(out.noise10, 'LineWidth', 2);
legend('r', 'd', 'Arq 1', 'Arq 8', 'Arq 10');
ylabel('System Output w/ noise');
xlabel('Time (s)');
ylim([-0.01 1.5])
set(gca, 'fontsize', 20, 'fontweight', 'bold');
title(['sigma_n = ', num2str(sigma_n*2)])
f.WindowState = 'maximized';
if plotSave
    saveas(f,['Figuras\ensaio 1\noise\e1-noise-8_10-zoom.png'])
end
%%
f = figure;
plot(out.input, 'LineWidth', 2);
hold
plot(out.dist, 'LineWidth', 2);
plot(out.noise, 'LineWidth', 2);
plot(out.noise9, 'LineWidth', 2);
legend('r', 'd', 'Arq 1', 'Arq 9');
ylabel('System Output w/ noise');
xlabel('Time (s)');
ylim([-inf inf])
set(gca, 'fontsize', 20, 'fontweight', 'bold');
title(['sigma_n = ', num2str(sigma_n*2)])
f.WindowState = 'maximized';
if plotSave
    saveas(f,['Figuras\ensaio 1\noise\e1-noise-9-zoom.png'])
end

%% Control

f = figure;
plot(out.input, 'LineWidth', 2);
hold
plot(out.dist, 'LineWidth', 2);
plot(out.control, 'LineWidth', 2);
plot(out.control2, 'LineWidth', 2);
plot(out.control3, 'LineWidth', 2);
plot(out.control4, 'LineWidth', 2);
plot(out.control5, 'LineWidth', 2);
legend('r', 'd', 'Arq 1', 'Arq 2', 'Arq 3', 'Arq 4', 'Arq 5', 'Arq 6', 'Arq 7', 'Arq 8', 'Arq 10');
ylabel('Control Signal');
xlabel('Time (s)');
ylim([-1 4])
set(gca, 'fontsize', 20, 'fontweight', 'bold');
title('')
f.WindowState = 'maximized';
if plotSave
    saveas(f,['Figuras\ensaio 1\controle\e1-cont-12345.png'])
end

f = figure;
plot(out.input, 'LineWidth', 2);
hold
plot(out.dist, 'LineWidth', 2);
plot(out.control, 'LineWidth', 2);
plot(out.control3, 'LineWidth', 2);
plot(out.control5, 'LineWidth', 2);
legend('r', 'd', 'Arq 1', 'Arq 3', 'Arq 5');
ylabel('Control Signal');
xlabel('Time (s)');
ylim([-1 4])
set(gca, 'fontsize', 20, 'fontweight', 'bold');
title('')
f.WindowState = 'maximized';
if plotSave
    saveas(f,['Figuras\ensaio 1\controle\e1-cont-135.png'])
end

f = figure;
plot(out.input, 'LineWidth', 2);
hold
plot(out.dist, 'LineWidth', 2);
plot(out.control, 'LineWidth', 2);
plot(out.control2, 'LineWidth', 2);
plot(out.control3, 'LineWidth', 2);
plot(out.control4, 'LineWidth', 2);
plot(out.control5, 'LineWidth', 2);
plot(out.control6, 'color', '#01B8AA', 'LineWidth', 2);
plot(out.control7,'color', '#FFC1CB', 'LineWidth', 2);
plot(out.control8, 'm', 'LineWidth', 2);
plot(out.control10, 'k', 'LineWidth', 2);
legend('r', 'd', 'Arq 1', 'Arq 2', 'Arq 3', 'Arq 4', 'Arq 5', 'Arq 6', 'Arq 7', 'Arq 8', 'Arq 10');
ylabel('Control Signal');
xlabel('Time (s)');
ylim([-32 40])
set(gca, 'fontsize', 20, 'fontweight', 'bold');
title('')
f.WindowState = 'maximized';
if plotSave
    saveas(f,['Figuras\ensaio 1\controle\e1-cont-all.png'])
end
%%
f = figure;
plot(out.input, 'LineWidth', 2);
hold
plot(out.dist, 'LineWidth', 2);
plot(out.control, 'LineWidth', 2);
plot(out.control8_new, 'LineWidth', 2);
plot(out.control11, 'LineWidth', 2);
plot(out.control12, 'LineWidth', 2);
legend('r', 'd', 'Arq 1', 'Arq 8', 'Arq 11', 'Arq 12');
ylabel('Control Signal');
xlabel('Time (s)');
ylim([-32 40])
set(gca, 'fontsize', 20, 'fontweight', 'bold');
title('')
f.WindowState = 'maximized';

%%
f = figure;
plot(out.input, 'LineWidth', 2);
hold
plot(out.dist, 'LineWidth', 2);
plot(out.control, 'LineWidth', 2);
plot(out.control2, 'LineWidth', 2);
legend('r', 'd', 'Arq 1', 'Arq 2');
ylabel('Control Signal');
xlabel('Time (s)');
ylim([-1 3.5])
set(gca, 'fontsize', 20, 'fontweight', 'bold');
title('')
f.WindowState = 'maximized';
if plotSave
    saveas(f,['Figuras\ensaio 1\controle\e1-cont-f2.png'])
end

f = figure;
plot(out.input, 'LineWidth', 2);
hold
plot(out.dist, 'LineWidth', 2);
plot(out.control, 'LineWidth', 2);
plot(out.control3, 'LineWidth', 2);
legend('r', 'd', 'Arq 1', 'Arq 3');
ylabel('Control Signal');
xlabel('Time (s)');
ylim([-0.6 3.5])
set(gca, 'fontsize', 20, 'fontweight', 'bold');
title('')
f.WindowState = 'maximized';
if plotSave
    saveas(f,['Figuras\ensaio 1\controle\e1-cont-f3.png'])
end

f = figure;
plot(out.input, 'LineWidth', 2);
hold
plot(out.dist, 'LineWidth', 2);
plot(out.control, 'LineWidth', 2);
plot(out.control4, 'LineWidth', 2);
legend('r', 'd', 'Arq 1', 'Arq 4');
ylabel('Control Signal');
xlabel('Time (s)');
ylim([-1 3.5])
set(gca, 'fontsize', 20, 'fontweight', 'bold');
title('')
f.WindowState = 'maximized';
if plotSave
    saveas(f,['Figuras\ensaio 1\controle\e1-cont-f4.png'])
end

f = figure;
plot(out.input, 'LineWidth', 2);
hold
plot(out.dist, 'LineWidth', 2);
plot(out.control, 'LineWidth', 2);
plot(out.control5, 'LineWidth', 2);
legend('r', 'd', 'Arq 1', 'Arq 5');
ylabel('Control Signal');
xlabel('Time (s)');
ylim([-0.6 3.5])
set(gca, 'fontsize', 20, 'fontweight', 'bold');
title('')
f.WindowState = 'maximized';
if plotSave
    saveas(f,['Figuras\ensaio 1\controle\e1-cont-f5.png'])
end

%% sigma *4
sigma_n = 0.5 * 4;

Tsim = 600;
out = sim('obs_com_filtro', Tsim);


f = figure;
plot(out.input, 'LineWidth', 2);
hold
plot(out.dist, 'LineWidth', 2);
plot(out.output, 'LineWidth', 2);
plot(out.output8, 'LineWidth', 2);
plot(out.output10, 'LineWidth', 2);
legend('r', 'd', 'Arq 1', 'Arq 8', 'Arq 10');
ylabel('System Output');
xlabel('Time (s)');
ylim([-0.01 1.5])
set(gca, 'fontsize', 20, 'fontweight', 'bold');
title(['sigma_n = ' num2str(sigma_n)])
f.WindowState = 'maximized';
if plotSave
    saveas(f,['Figuras\Analise 8, 9 e 10\8e10-2_out.png'])
end

f = figure;
plot(out.input, 'LineWidth', 2);
hold
plot(out.dist, 'LineWidth', 2);
plot(out.output, 'LineWidth', 2);
plot(out.output9, 'LineWidth', 2);
legend('r', 'd', 'Arq 1', 'Arq 9');
ylabel('System Output');
xlabel('Time (s)');
ylim([-inf inf])
set(gca, 'fontsize', 20, 'fontweight', 'bold');
title(['sigma_n = ' num2str(sigma_n)])
f.WindowState = 'maximized';
if plotSave
    saveas(f,['Figuras\Analise 8, 9 e 10\9-2_out.png'])
end

f = figure;
plot(out.input, 'LineWidth', 2);
hold
plot(out.dist, 'LineWidth', 2);
plot(out.control, 'LineWidth', 2);
plot(out.control8, 'LineWidth', 2);
plot(out.control10, 'LineWidth', 2);
legend('r', 'd', 'Arq 1', 'Arq 8', 'Arq 10');
ylabel('Control Signal');
xlabel('Time (s)');
ylim([-10 10])
set(gca, 'fontsize', 20, 'fontweight', 'bold');
title(['sigma_n = ' num2str(sigma_n)])
f.WindowState = 'maximized';
if plotSave
    saveas(f,['Figuras\Analise 8, 9 e 10\8e10-2_cont.png'])
end

f = figure;
plot(out.input, 'LineWidth', 2);
hold
plot(out.dist, 'LineWidth', 2);
plot(out.control, 'LineWidth', 2);
plot(out.control9, 'LineWidth', 2);
legend('r', 'd', 'Arq 1', 'Arq 9');
ylabel('Control Signal');
xlabel('Time (s)');
ylim([-inf inf])
set(gca, 'fontsize', 20, 'fontweight', 'bold');
title(['sigma_n = ' num2str(sigma_n)])
f.WindowState = 'maximized';
if plotSave
    saveas(f,['Figuras\Analise 8, 9 e 10\9-2_cont.png'])
end

end
%% NEW SYSTEM
clear
%clc
pause(20);
close all
end
if test2
%% Load variables delay architeture
s = tf('s');

T = 0.5;
K = 1;
var_ruido = 0.0008;
Ts = 0.1;

Td = T*(10/100);
std_dev = 7.53;

delay = tf(1,1,'InputDelay',0.5);

Gs = delay * K/(s*(T*s+1));
Gs_pos = delay;
Gs_neg = K/(s*(T*s+1));

Kp = 0.866;
Ki = 0.073;
Kd = 0.435;

C = pid(Kp,Ki,Kd);

Qs = 1/(Td*s+1)^2;

%G_inv = Gs^(-1);

%G_inv_Q = Gs^(-1) * Qs;
G_neg_inv_Q = Gs_neg^(-1) * Qs;

%% Run simulation

Tsim = 600;
out = sim('modelo_atraso', Tsim);

%% Calculate TV, ISE, IAE
idx = (out.input.time > 100 & out.input.time < 400);
idxct = (out.control.time > 100 & out.control.time < 400);

DesRef = out.input.data(idx);

DesData = out.control.Data(idxct);
TV_arq1 = calcTV(DesData,Tsim);
DesData = out.output.data(idx);
ISE_arq1 = calcISE(DesData,DesRef,Tsim);
IAE_arq1 = calcIAE(DesData,DesRef,Tsim);

tv_vec = [TV_arq1];
ise_vec = [ISE_arq1];
iae_vec = [IAE_arq1];

first_order_param = [TV_arq1 ISE_arq1 IAE_arq1];

DesData = out.control2.data(idxct);
TV_arq2 = calcTV(DesData,Tsim);
DesData = out.output2.data(idx);
ISE_arq2 = calcISE(DesData,DesRef,Tsim);
IAE_arq2 = calcIAE(DesData,DesRef,Tsim);

tv_vec = [tv_vec TV_arq2];
ise_vec = [ise_vec ISE_arq2];
iae_vec = [iae_vec IAE_arq2];

arq2_param = [TV_arq2 ISE_arq2 IAE_arq2];

DesData = out.control3.data(idxct);
TV_arq3 = calcTV(DesData,Tsim);
DesData = out.output3.data(idx);
ISE_arq3 = calcISE(DesData,DesRef,Tsim);
IAE_arq3 = calcIAE(DesData,DesRef,Tsim);

tv_vec = [tv_vec TV_arq3];
ise_vec = [ise_vec ISE_arq3];
iae_vec = [iae_vec IAE_arq3];

arq3_param = [TV_arq3 ISE_arq3 IAE_arq3];

DesData = out.control5.data(idx);
TV_arq5 = calcTV(DesData,Tsim);
DesData = out.output5.data(idx);
ISE_arq5 = calcISE(DesData,DesRef,Tsim);
IAE_arq5 = calcIAE(DesData,DesRef,Tsim);

tv_vec = [tv_vec TV_arq5];
ise_vec = [ise_vec ISE_arq5];
iae_vec = [iae_vec IAE_arq5];

arq5_param = [TV_arq5 ISE_arq5 IAE_arq5];

disp(['Arq1: IAE = ', num2str(IAE_arq1), ' ISE = ', num2str(ISE_arq1), ' TV = ', num2str(TV_arq1)])
disp(['Arq2: IAE = ', num2str(IAE_arq2), ' ISE = ', num2str(ISE_arq2), ' TV = ', num2str(TV_arq2)])
disp(['Arq3: IAE = ', num2str(IAE_arq3), ' ISE = ', num2str(ISE_arq3), ' TV = ', num2str(TV_arq3)])
disp(['Arq5: IAE = ', num2str(IAE_arq5), ' ISE = ', num2str(ISE_arq5), ' TV = ', num2str(TV_arq5)])

[sorted_tv,idx_tv] = sort(tv_vec);
[sorted_iae,idx_iae] = sort(iae_vec);
[sorted_ise,idx_ise] = sort(ise_vec);

disp('Ordem dos melhores IAE:')
disp(idx_iae)
disp('Ordem dos melhores ISE:')
disp(idx_ise)
disp('Ordem dos melhores TV:')
disp(idx_tv)

%% Plot graph
if plotg
f = figure;
plot(out.input, 'LineWidth', 2);
hold
plot(out.dist, 'LineWidth', 2);
plot(out.output, 'LineWidth', 2);
plot(out.output2, 'LineWidth', 2);
plot(out.output3, 'LineWidth', 2);
plot(out.output5, 'LineWidth', 2);
legend('r', 'd', 'Arq 1', 'Arq 2', 'Arq FE', 'Arq 5');
ylabel('System Output');
xlabel('Time (s)');
ylim([-0.01 1.5])
set(gca, 'fontsize', 20, 'fontweight', 'bold', 'color', 'none');
title(['sigma_n = ' num2str(std_dev)])
f.WindowState = 'maximized';
if plotSave
    saveas(f,['Figuras\ensaio 2\controle\e2-out-all.png'])
end

%%

f = figure;
plot(out.input, 'LineWidth', 2);
hold
plot(out.dist, 'LineWidth', 2);
plot(out.noise, 'LineWidth', 2);
plot(out.noise2, 'LineWidth', 2);
plot(out.noise3, 'LineWidth', 2);
plot(out.noise5, 'LineWidth', 2);
legend('r', 'd', 'Arq 1', 'Arq 2', 'Arq FE', 'Arq 5');
ylabel('System Output w/ noise');
xlabel('Time (s)');
ylim([-0.01 1.5])
set(gca, 'fontsize', 20, 'fontweight', 'bold');
title(['sigma_n = ' num2str(std_dev)])
f.WindowState = 'maximized';
if plotSave
    saveas(f,['Figuras\ensaio 2\controle\e2-noise-all.png'])
end

%%

f = figure;
plot(out.input, 'LineWidth', 2);
hold
plot(out.dist, 'LineWidth', 2);
plot(out.control, 'LineWidth', 2);
plot(out.control2, 'LineWidth', 2);
plot(out.control3, 'LineWidth', 2);
plot(out.control5, 'LineWidth', 2);
legend('r', 'd', 'Arq 1', 'Arq 2', 'Arq FE', 'Arq 5');
ylabel('Control Signal');
xlabel('Time (s)');
ylim([-6 6])
set(gca, 'fontsize', 20, 'fontweight', 'bold');
title('')
f.WindowState = 'maximized';
if plotSave
    saveas(f,['Figuras\ensaio 2\controle\e2-cont-all.png'])
end
%%
f = figure;
plot(out.input, 'LineWidth', 2);
hold
plot(out.dist, 'LineWidth', 2);
plot(out.control, 'LineWidth', 2);
plot(out.control2, 'LineWidth', 2);
legend('r', 'd', 'Arq 1', 'Arq 2');
ylabel('Control Signal');
xlabel('Time (s)');
ylim([-6 6])
set(gca, 'fontsize', 20, 'fontweight', 'bold');
title('')
f.WindowState = 'maximized';
if plotSave
    saveas(f,['Figuras\ensaio 2\controle\e2-cont-f2.png'])
end

f = figure;
plot(out.input, 'LineWidth', 2);
hold
plot(out.dist, 'LineWidth', 2);
plot(out.control, 'LineWidth', 2);
plot(out.control3, 'LineWidth', 2);
legend('r', 'd', 'Arq 1', 'Arq FE');
ylabel('Control Signal');
xlabel('Time (s)');
ylim([-1.5 2.5])
set(gca, 'fontsize', 20, 'fontweight', 'bold');
title('')
f.WindowState = 'maximized';
if plotSave
    saveas(f,['Figuras\ensaio 2\controle\e2-cont-f3.png'])
end

f = figure;
plot(out.input, 'LineWidth', 2);
hold
plot(out.dist, 'LineWidth', 2);
plot(out.control, 'LineWidth', 2);
plot(out.control5, 'LineWidth', 2);
legend('r', 'd', 'Arq 1', 'Arq 5');
ylabel('Control Signal');
xlabel('Time (s)');
ylim([-7 7])
set(gca, 'fontsize', 20, 'fontweight', 'bold');
title(['sigma_n = ' num2str(std_dev)])
f.WindowState = 'maximized';
if plotSave
    saveas(f,['Figuras\ensaio 2\controle\e2-cont-f5.png'])
end

%% sigma / 2

std_dev = 7.53 / 2;

out = sim('modelo_atraso', Tsim);

f = figure;
plot(out.input, 'LineWidth', 2);
hold
plot(out.dist, 'LineWidth', 2);
plot(out.output, 'LineWidth', 2);
plot(out.output2, 'LineWidth', 2);
plot(out.output3, 'LineWidth', 2);
plot(out.output5, 'LineWidth', 2);
legend('r', 'd', 'Arq 1', 'Arq 2', 'Arq FE', 'Arq 5');
ylabel('System Output');
xlabel('Time (s)');
ylim([-0.01 1.5])
set(gca, 'fontsize', 20, 'fontweight', 'bold');
title(['sigma_n = ' num2str(std_dev)])
f.WindowState = 'maximized';
if plotSave
    saveas(f,['Figuras\ensaio 2\controle\e2-out-all2.png'])
end

f = figure;
plot(out.input, 'LineWidth', 2);
hold
plot(out.dist, 'LineWidth', 2);
plot(out.noise, 'LineWidth', 2);
plot(out.noise2, 'LineWidth', 2);
plot(out.noise3, 'LineWidth', 2);
plot(out.noise5, 'LineWidth', 2);
legend('r', 'd', 'Arq 1', 'Arq 2', 'Arq FE', 'Arq 5');
ylabel('System Output w/ noise');
xlabel('Time (s)');
ylim([-0.01 1.5])
set(gca, 'fontsize', 20, 'fontweight', 'bold');
title(['sigma_n = ' num2str(std_dev)])
f.WindowState = 'maximized';
if plotSave
    saveas(f,['Figuras\ensaio 2\controle\e2-noise-all2.png'])
end

f = figure;
plot(out.input, 'LineWidth', 2);
hold
plot(out.dist, 'LineWidth', 2);
plot(out.control, 'LineWidth', 2);
plot(out.control5, 'LineWidth', 2);
legend('r', 'd', 'Arq 1', 'Arq 5');
ylabel('Control Signal');
xlabel('Time (s)');
ylim([-7 7])
set(gca, 'fontsize', 20, 'fontweight', 'bold');
title(['sigma_n = ' num2str(std_dev)])
f.WindowState = 'maximized';
if plotSave
    saveas(f,['Figuras\ensaio 2\controle\e2-cont-f5-2.png'])
end

end
%% NEW SYSTEM 2
%clear
%clc
pause(20);
close all
end
if test3

%% Load variables for real architeture
%clear
s = tf('s');

var_ruido = 0.0008;
Ts = 0.1;

%Controlador Gs:
Pa= 0.0565;
Pb= 0.0192;

Ta = 1/Pa;
Tb = 1/Pb;

K = 0.002677;

Gs =  K/((s+Pa)*(s+Pb));

%PID: C
Kp = 0.3105;
Ki = 0.0044;
Kd = 4.1019;

C = pid(Kp, Ki, Kd);
%C = Kp+ Ki/s + Kd*s;

%Observador: Q(s)
Td = Tb*(2/100);

Qs = 1/((Td*s+1)^2);

G_inv_Q = Gs^(-1) * Qs;

%% Run simulation

Tsim = 600;
out = sim('modelo_real.slx', Tsim);

%% Calculate TV, ISE, IAE
idx = (out.input.time > 100 & out.input.time < 400);
idxct = (out.control.time > 100 & out.control.time < 400);

DesRef = out.input.data(idx);

DesData = out.control.data(idxct);
TV_arq1 = calcTV(DesData,Tsim);
DesData = out.output.data(idx);
ISE_arq1 = calcISE(DesData,DesRef,Tsim);
IAE_arq1 = calcIAE(DesData,DesRef,Tsim);


tv_vec = [TV_arq1];
ise_vec = [ISE_arq1];
iae_vec = [IAE_arq1];

first_order_param = [TV_arq1 ISE_arq1 IAE_arq1];

DesData = out.control2.data(idxct);
TV_arq2 = calcTV(DesData,Tsim);
DesData = out.output2.data(idx);
ISE_arq2 = calcISE(DesData,DesRef,Tsim);
IAE_arq2 = calcIAE(DesData,DesRef,Tsim);

tv_vec = [tv_vec TV_arq2];
ise_vec = [ise_vec ISE_arq2];
iae_vec = [iae_vec IAE_arq2];

arq2_param = [TV_arq2 ISE_arq2 IAE_arq2];

DesData = out.control3.data(idxct);
TV_arq3 = calcTV(DesData,Tsim);
DesData = out.output3.data(idx);
ISE_arq3 = calcISE(DesData,DesRef,Tsim);
IAE_arq3 = calcIAE(DesData,DesRef,Tsim);

tv_vec = [tv_vec TV_arq3];
ise_vec = [ise_vec ISE_arq3];
iae_vec = [iae_vec IAE_arq3];

arq3_param = [TV_arq3 ISE_arq3 IAE_arq3];

DesData = out.control5.data(idxct);
TV_arq5 = calcTV(DesData,Tsim);
DesData = out.output5.data(idx);
ISE_arq5 = calcISE(DesData,DesRef,Tsim);
IAE_arq5 = calcIAE(DesData,DesRef,Tsim);

tv_vec = [tv_vec TV_arq5];
ise_vec = [ise_vec ISE_arq5];
iae_vec = [iae_vec IAE_arq5];

arq5_param = [TV_arq5 ISE_arq5 IAE_arq5];

disp(['Arq1: IAE = ', num2str(IAE_arq1), ' ISE = ', num2str(ISE_arq1), ' TV = ', num2str(TV_arq1)])
disp(['Arq2: IAE = ', num2str(IAE_arq2), ' ISE = ', num2str(ISE_arq2), ' TV = ', num2str(TV_arq2)])
disp(['Arq3: IAE = ', num2str(IAE_arq3), ' ISE = ', num2str(ISE_arq3), ' TV = ', num2str(TV_arq3)])
%disp(['Arq4: IAE = ', num2str(IAE_arq4), ' ISE = ', num2str(ISE_arq4), ' TV = ', num2str(TV_arq4)])
disp(['Arq5: IAE = ', num2str(IAE_arq5), ' ISE = ', num2str(ISE_arq5), ' TV = ', num2str(TV_arq5)])
%disp(['Arq6: IAE = ', num2str(IAE_arq6), ' ISE = ', num2str(ISE_arq6), ' TV = ', num2str(TV_arq6)])
%disp(['Arq7: IAE = ', num2str(IAE_arq7), ' ISE = ', num2str(ISE_arq7), ' TV = ', num2str(TV_arq7)])
%disp(['Arq8: IAE = ', num2str(IAE_arq8), ' ISE = ', num2str(ISE_arq8), ' TV = ', num2str(TV_arq8)])
%disp(['Arq9: IAE = ', num2str(IAE_arq9), ' ISE = ', num2str(ISE_arq9), ' TV = ', num2str(TV_arq9)])
%disp(['Arq10: IAE = ', num2str(IAE_arq10), ' ISE = ', num2str(ISE_arq10), ' TV = ', num2str(TV_arq10)])

[sorted_tv,idx_tv] = sort(tv_vec);
[sorted_iae,idx_iae] = sort(iae_vec);
[sorted_ise,idx_ise] = sort(ise_vec);

disp('Ordem dos melhores IAE:')
disp(idx_iae)
disp('Ordem dos melhores ISE:')
disp(idx_ise)
disp('Ordem dos melhores TV:')
disp(idx_tv)

%% Plot graph
if plotg
f = figure;
plot(out.input, 'LineWidth', 2);
hold
plot(out.dist, 'LineWidth', 2);
plot(out.output, 'LineWidth', 2);
plot(out.output2, 'LineWidth', 2);
plot(out.output3, 'LineWidth', 2);
plot(out.output5, 'LineWidth', 2);
legend('r', 'd', 'Arq 1', 'Arq 2', 'Arq FE', 'Arq 5');
ylabel('System Output');
xlabel('Time (s)');
ylim([-0.01 1.65])
set(gca, 'fontsize', 20, 'fontweight', 'bold');
f.WindowState = 'maximized';
if plotSave
    saveas(f,['Figuras\ensaio 3\out\e3-out-all.png'])
end

%%

f = figure;
plot(out.input, 'LineWidth', 2);
hold
plot(out.dist, 'LineWidth', 2);
plot(out.noise, 'LineWidth', 2);
plot(out.noise2, 'LineWidth', 2);
plot(out.noise3, 'LineWidth', 2);
plot(out.noise5, 'LineWidth', 2);
legend('r', 'd', 'Arq 1', 'Arq 2', 'Arq FE', 'Arq 5');
ylabel('System Output w/ noise');
xlabel('Time (s)');
ylim([-0.01 1.8])
set(gca, 'fontsize', 20, 'fontweight', 'bold');
f.WindowState = 'maximized';
if plotSave
    saveas(f,['Figuras\ensaio 3\noise\e3-noise-all.png'])
end

%%

f = figure;
plot(out.input, 'LineWidth', 2);
hold
plot(out.dist, 'LineWidth', 2);
plot(out.control, 'LineWidth', 2);
plot(out.control2, 'LineWidth', 2);
plot(out.control3, 'LineWidth', 2);
plot(out.control5, 'LineWidth', 2);
legend('r', 'd', 'Arq 1', 'Arq 2', 'Arq FE', 'Arq 5');
ylabel('Control Signal');
xlabel('Time (s)');
ylim([-30 31])
set(gca, 'fontsize', 20, 'fontweight', 'bold');
title('')
f.WindowState = 'maximized';
f.WindowState = 'maximized';
if plotSave
    saveas(f,['Figuras\ensaio 3\controle\e3-cont-all.png'])
end

f = figure;
plot(out.input, 'LineWidth', 2);
hold
plot(out.dist, 'LineWidth', 2);
plot(out.control, 'LineWidth', 2);
plot(out.control3, 'LineWidth', 2);
plot(out.control5, 'LineWidth', 2);
legend('r', 'd', 'Arq 1', 'Arq FE', 'Arq 5');
ylabel('Control Signal');
xlabel('Time (s)');
ylim([-4 4])
set(gca, 'fontsize', 20, 'fontweight', 'bold');
title('')
f.WindowState = 'maximized';
if plotSave
    saveas(f,['Figuras\ensaio 3\controle\e3-cont-best.png'])
end

f = figure;
plot(out.input, 'LineWidth', 2);
hold
plot(out.dist, 'LineWidth', 2);
plot(out.control3, 'LineWidth', 2);
plot(out.control5, 'LineWidth', 2);
legend('r', 'd', 'Arq 3 FE', 'Arq 5');
ylabel('Control Signal');
xlabel('Time (s)');
ylim([-4 4])
set(gca, 'fontsize', 20, 'fontweight', 'bold');
title('')
f.WindowState = 'maximized';
if plotSave
    saveas(f,['Figuras\ensaio 3\controle\e3-cont-best-no-1.png'])
end

end
end