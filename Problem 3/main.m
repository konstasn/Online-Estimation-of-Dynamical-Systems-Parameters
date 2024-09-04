%Clear memory and output

clc
clear

%Initialize A, B matrices

A = [-0.5 -3 ; 4 -2];
B = [1 ; 1.4];
g1 = 0.5;
g2 = 0.5;

%Initialize t, u, compute x

t = 0:0.01:300;
x0 = [0 0];
L0 = zeros(1,10);

u = @(t) 7.5*cos(3*t) + 10*cos(2*t);

[t,x] = ode45(@(t,x)odefun(t,x,u,A,B),t,x0);

%Lyapunov Method

[x_hat,A_hat,B_hat] = lyapunov(t,u,A,B,g1,g2,L0);

plots(t,x,x_hat,A,A_hat,B,B_hat,g1,g2)

function dx = odefun(t,x,u,A,B)

dx(1) = A(1,1)*x(1) + A(1,2)*x(2) + B(1)*u(t);
dx(2) = A(2,1)*x(1) + A(2,2)*x(2) + B(2)*u(t);

dx = dx';
end
