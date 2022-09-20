figure
plot(out.control, 'LineWidth', 2);
hold
plot(out.control2, 'LineWidth', 2);
plot(out.control3, 'LineWidth', 2);
plot(out.control5, 'LineWidth', 2);
legend('Unfiltered', 'Disturb Observer', 'Adaptative Filter', 'Dist. Obs. & Adapt. Filter', 'Northeast');
ylabel('Controller Output');
xlabel('Time (s)');
ylim([-10 10])
set(gca, 'fontsize', 16, 'fontweight', 'bold');
title('')

figure
plot(out.output, 'LineWidth', 2)
hold
plot(out.output2, 'LineWidth', 2);
plot(out.output3, 'LineWidth', 2);
plot(out.output5, 'LineWidth', 2);
legend('Unfiltered', 'Disturb Observer', 'Adaptative Filter', 'Dist. Obs. & Adapt. Filter', 'Northeast');
ylabel('System Output');
xlabel('Time (s)');
set(gca, 'fontsize', 16, 'fontweight', 'bold');
title('')

figure
plot(out.alpha_realimentacao2, 'LineWidth', 2);
plot(out.alpha_realimentacao3, 'LineWidth', 2);
yline(a_Tf, 'LineWidth', 2);
legend('Adaptive Filter', 'Unfiltered');
xlabel('Time (s)');
ylabel('Alpha Value');
set(gca, 'fontsize', 16, 'fontweight', 'bold');
title('')
