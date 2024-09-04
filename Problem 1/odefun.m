function dx = odefun(x,t,u,a,b,am,g)

dx(1) = -a*x(1) + b*u(t);
dx(2) = -am*x(2) + x(1);
dx(3) = -am*x(3) + u(t);
dx(4) = g*(x(1) - (x(2)*x(4) + x(3)*x(5)))*x(2);
dx(5) = g*(x(1) - (x(2)*x(4) + x(3)*x(5)))*x(3);

dx = dx';
end