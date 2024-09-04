function [x_hat,A_hat,B_hat] = lyapunov(t,u,A,B,g1,g2,L0)

[t,state] = ode45(@(t,state)odelyap(t,state,u,A,B,g1,g2),t,L0);

x_hat = state(:,3:4);
A_hat = [state(:,5) state(:,6) state(:,7) state(:,8)];
B_hat = state(:,9:10);
end

