clear all; clc;

%% Parameters
latent_period = 6;
sigma = 1/latent_period;

Recovery_Duration = 17;
Gamma=1/Recovery_Duration;

R_0 = 6; % A single infected person will infect about 6 others in a totally susceptible population
N = 331002647;  % Population of  US (2020)
beta = R_0/(N*Recovery_Duration);  %Transmission per contact.

%% Differential equations
tspan = 0:1:365; % We will observe what happens over the next year
y0 = [N-(103 + 6+ 651 + 7), 651, 103, 7, 6]; % Coronavirus count of US (Mar 3, 2020)
[t,y]=ode45(@(t,y) ode_fun_simple(t,y,beta), tspan, y0);

% ode45 is a built in Numerical Differential Equations solver in MATLAB.
% There are packages for this solver in other programming languages.
%at t = t0 (3/2/2020 I0 = 11  D0= 0  E0= 4  R0 = 0   S0 = N - I0 - R0 -D0

%% plot
plot(t,y,'LineWidth', 1.5, 'MarkerSize', 18)
legend('Susceptible','Exposed','Infectious','Recovered','Death', 'Location', 'Best')
xlabel('Days after March 3, 2020')
ylabel('Population')
title('Predicted Spread of COVID-19 in US')
grid on;
grid minor;
set(gca, 'FontSize', 26)
%saveas(gcf, 'corona_simple1.png')
