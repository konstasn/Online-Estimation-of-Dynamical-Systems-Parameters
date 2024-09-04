%Clear console and memory

clc
clear

%Initialize System Parameters

a = 1.5;
b = 2.0;
n0 = 1;
f = 100;
tm = 1000;

%Initialize time, input & output

t = 0:0.1:50;

u = @(t) 3*cos(2*t);

[t,x] = ode45(@(t,x) -a*x + b*u(t),t,0);

n = @(t) n0*sin(2*pi*f*t);

%Lyapunov Method

[t,state_p] = ode45(@(t,state)odefun_p(state,u,n,t,a,b),t,[0 0 0 0]);

x_p = state_p(:,2);

[t,state_m] = ode45(@(t,state)odefun_m(state,u,n,t,a,b,tm),t,[0 0 0 0]);

x_m = state_m(:,2);


%Plots for parallel
figure(1)

%Layout
tiles = tiledlayout(2,2,'TileSpacing','compact');
t1 = sprintf('Parallel for n_0=%.2f , f=%d', n0, f);
tiles.Title.String = t1;
tiles.Title.FontSize = 30;

%1st Plot
nexttile
plot(t,x,t,x_p)
title('$x$ \& $\hat{x}$','FontSize',25,'interpreter','latex')
legend('$x$','$\hat{x}$','FontSize',20,'Location','southeast','interpreter','latex')

%2nd Plot
nexttile
plot(t,x-x_p)
title('Error($x - \hat{x})$','FontSize',25,'interpreter','latex')

%3rd Plot
nexttile
plot(t,state_p(:,3),t,a*ones(size(t)));
title('$a$ \& $\hat{a}$','FontSize',25,'interpreter','latex')

%4th Plot
nexttile
plot(t,state_p(:,4),t,b*ones(size(t)));
title('$b$ \& $\hat{b}$','FontSize',25,'interpreter','latex')


%Plots for mixed
figure(2)

%Layout
tiles = tiledlayout(2,2,'TileSpacing','compact');
t1 = sprintf('Mixed for n_0=%.2f , f=%d (θ_m=%.2f)', n0, f, tm);
tiles.Title.String = t1;
tiles.Title.FontSize = 30;

%1st Plot
nexttile
plot(t,x,t,x_m)
title('$x$ \& $\hat{x}$','FontSize',25,'interpreter','latex')
legend('$x$','$\hat{x}$','FontSize',20,'Location','southeast','interpreter','latex')

%2nd Plot
nexttile
plot(t,x-x_m)
title('Error($x - \hat{x})$','FontSize',25,'interpreter','latex')

%3rd Plot
nexttile
plot(t,state_m(:,3),t,a*ones(size(t)));
title('$a$ \& $\hat{a}$','FontSize',25,'interpreter','latex')

%4th Plot
nexttile
plot(t,state_m(:,4),t,b*ones(size(t)));
title('$b$ \& $\hat{b}$','FontSize',25,'interpreter','latex')

function dx = odefun_p(x,u,n,t,a,b)

dx(1) = -a * x(1) + b * u(t);
dx(2) = -x(3) * x(2) + x(4) * u(t);
dx(3) = -(x(1) + n(t) - x(2)) * x(2); 
dx(4) = (x(1) + n(t) - x(2)) * u(t) ;

dx = dx';

end

function dx = odefun_m(x,u,n,t,a,b,tm)

dx(1) = -a * x(1) + b * u(t);
dx(2) = -x(3) * (x(1) + n(t)) + x(4) * u(t) + tm * (x(1) + n(t) - x(2));
dx(3) = -(x(1) + n(t) - x(2)) * (x(1) + n(t)); 
dx(4) = (x(1) + n(t) - x(2)) * u(t) ;

dx = dx';

end