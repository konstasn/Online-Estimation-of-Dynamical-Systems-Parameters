function [x_hat,a_hat,b_hat] = sd(t,u,a,b,am,g)

[t,state] = ode45(@(t,state)odefun(state,t,u,a,b,am,g),t,[0 0 0 0 0]);

x_hat = state(:,4) .* state(:,2) + state(:,5) .* state(:,3);
a_hat = - (state(:,4) - am);
b_hat = state(:,5);
end