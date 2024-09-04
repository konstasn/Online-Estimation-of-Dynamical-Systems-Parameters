%Clear console and memory

clc
clear

%Values of a,b

a = 1.5;
b = 2.0;
am = 1;
g = 100;

%Initialize time vector, input, output

t = 0:0.1:30;

%u = @(t) 3;
u = @(t) 3*cos(2*t);

x0 = 0;

[t,x] = ode45(@(t,x) -a*x + b*u(t), t, x0);

%Steepest descend

[x_hat,a_hat,b_hat] = sd(t,u,a,b,am,g);

%Plots

plots(t,x,x_hat,a,a_hat,b,b_hat,am,g)
