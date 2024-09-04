%Clear console and memory

clc
clear

%Values of a,b

a = 1.5;
b = 2.0;
am = 0;
g = 0;

%Initialize time vector, input, output

t = 0:0.1:10;

%u = @(t) 3;
u = @(t) 3*cos(2*t);

x0 = 0;

[t,x] = ode45(@(t,x) -a*x + b*u(t), t, x0);


%Find the best am & g

min_e = 10000;

i=1;
j=1;
E = ones(100,100);

for am = 1:1:100
    for g = 1:10:1000
        [x_hat,a_hat,b_hat] = sd(t,u,a,b,am,g);
        
        e = mean(abs(x-x_hat));
        E(i,j) = e;
        
        if e < min_e
            min_e = e;
            best_am = am;
            best_g = g;
        end
        j = j + 1;
    end
    j = 1;
    i = i + 1
end

am = best_am;
g = best_g;

[x_hat,a_hat,b_hat] = sd(t,u,a,b,am,g);

%Plots

plots(t,x,x_hat,a,a_hat,b,b_hat,am,g)
