function plots(t,x,x_hat,A,A_hat,B,B_hat,g1,g2)

%Figure 1 Layout

figure(1)
tile1 = tiledlayout(2,2);
t1 = sprintf('States and estimations for γ_1=%d , γ_2=%d', g1, g2);
tile1.Title.String = t1;
tile1.Title.FontSize = 30;

%1st Plot
nexttile
plot(t,x(:,1),t,x_hat(:,1))
title('$x_1$ \& $\hat{x_1}$','FontSize',25,'interpreter','latex')
legend('$x_1$','$\hat{x_1}$','FontSize',20,'Location','southeast','interpreter','latex')

%2nd Plot
nexttile
plot(t,x(:,1)-x_hat(:,1))
title('Error($x_1 - \hat{x_1})$','FontSize',25,'interpreter','latex')

%3rd Plot
nexttile
plot(t,x(:,2),t,x_hat(:,2))
title('$x_2$ \& $\hat{x_2}$','FontSize',25,'interpreter','latex')
legend('$x_2$','$\hat{x_2}$','FontSize',20,'Location','southeast','interpreter','latex')

%4th Plot
nexttile
plot(t,x(:,2)-x_hat(:,2))
title('Error($x_2 - \hat{x_2})$','FontSize',25,'interpreter','latex')


%Figure 2 Layout

figure(2)
tile2 = tiledlayout(3,2);
t2 = sprintf('A & B estimations');
tile2.Title.String = t2;
tile2.Title.FontSize = 30;

%1st Plot
nexttile
plot(t,A_hat(:,1),t,A(1,1)*ones(size(t)))
title('$a_{1,1}$ \& $\hat{a_{1,1}}$','FontSize',25,'interpreter','latex')

%2nd Plot
nexttile
plot(t,A_hat(:,2),t,A(1,2)*ones(size(t)))
title('$a_{1,2}$ \& $\hat{a_{1,2}}$','FontSize',25,'interpreter','latex')

%3rd Plot
nexttile
plot(t,A_hat(:,3),t,A(2,1)*ones(size(t)))
title('$a_{2,1}$ \& $\hat{a_{2,1}}$','FontSize',25,'interpreter','latex')

%4th Plot
nexttile
plot(t,A_hat(:,4),t,A(2,2)*ones(size(t)))
title('$a_{2,2}$ \& $\hat{a_{2,2}}$','FontSize',25,'interpreter','latex')

%5th Plot
nexttile
plot(t,B_hat(:,1),t,B(1)*ones(size(t)))
title('$b_1$ \& $\hat{b_1}$','FontSize',25,'interpreter','latex')

%6th Plot
nexttile
plot(t,B_hat(:,2),t,B(2)*ones(size(t)))
title('$b_2$ \& $\hat{b_2}$','FontSize',25,'interpreter','latex')

end

