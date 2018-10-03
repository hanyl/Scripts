alpha_s = 1.0/137;

energy = 0.07; %% GeV

mass_e = 0.511e-3; %% GeV

beta_rel = 1;

gamma_rel = energy/mass_e;

k1_quad = 18; %%  T/m/m 
l_quad = 0.2; % meger

R = 0.02; %% m

delta_theta = k1_quad * l_quad * R;

n_gamma_quad = 5 * alpha_s / 2 /sqrt(3) * beta_rel * gamma_rel * delta_theta

r_e = 2.8179403227e-15; % meter, 1/4/pi/epsilon/m_e/c/c;

L = 0.2; %% meter

theta = 45 * pi/180;

rho = L/theta;

%Delta_E = 2.0/3 * r_e * power(gamma_rel*beta_rel,3) * energy * L / power(rho,2);
Delta_E = 2.0/3 * r_e * power(gamma_rel*beta_rel,3) * energy * power(theta,2) / L
