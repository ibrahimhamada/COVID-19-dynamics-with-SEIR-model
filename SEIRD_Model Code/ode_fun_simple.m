function dydt = ode_fun_simple(t, y,beta)

miu = 0.09;  % Death rate of COVID-19 (March, 2020)
latent_period = 6;
sigma = 1/latent_period;

Recovery_Duration = 17;
Gamma = 1/Recovery_Duration;

S = y(1);
E= y(2);
I = y(3);

dS = -beta*I.*S;
dE = beta*I.*S -  sigma.*E;
dI = sigma*E - Gamma*I;
dR = Gamma*(1-miu)*I;
dD = (miu)*Gamma*I;

dydt = [dS; dE; dI; dR; dD];
end
