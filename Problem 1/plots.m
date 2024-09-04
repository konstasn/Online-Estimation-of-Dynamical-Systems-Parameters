function plots(t,x,x_hat,a,a_hat,b,b_hat,am,g)

%Layout
tiles = tiledlayout(2,2,'TileSpacing','compact');
t1 = sprintf('a_m = %d, γ = %d', am, g);
tiles.Title.String = t1;
tiles.Title.FontSize = 20;

%1st Plot
nexttile
plot(t,x,t,x_hat)
title('$x$ \& $\hat{x}$','FontSize',18,'interpreter','latex')
legend('$x$','$\hat{x}$','FontSize',15,'Location','southeast','interpreter','latex')

%2nd Plot
nexttile
plot(t,x-x_hat)
title('Error($x - \hat{x})$','FontSize',18,'interpreter','latex')

%3rd Plot
nexttile
plot(t,a_hat,t,a*ones(size(t)));
title('$a$ \& $\hat{a}$','FontSize',18,'interpreter','latex')

%4th Plot
nexttile
plot(t,b_hat,t,b*ones(size(t)));
title('$b$ \& $\hat{b}$','FontSize',18,'interpreter','latex')

end

