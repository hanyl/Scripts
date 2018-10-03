energy = 0.14; %% GeV

mass_e = 0.511e-3; %% GeV

gamma_rel = energy/mass_e;

theta = 45 * pi /180; %% radian

L = 1.2; %% meter

%rho = L/theta; 
rho = L/2.0/sin(theta/2);

sigma_0 = rho/power(gamma_rel,3);

N = 6.25e9; %% Number of electrons per bunch

sigma_z = 1.0e-3; %% meter

c_light = 299792458; %% m/s

%%%   e*e*c/epsilon0 = 5.4247827e-09 GeV*m^2/s
%% 0.0279 is Gamma(5/6)/4/pi^(3/2)/6^(1/3)
if ( sigma_z > power(N,3./4) * sigma_0)
  disp("ISR");
  P = N * (1.0/6/pi) * 5.4247827e-09 * power(gamma_rel,4)/power(rho,2); %% GeV/s
elseif ( sigma_z > sigma_0)
  disp("CSR energy dependent");
  P = N*N * 0.0279 * 5.4247827e-09 * 1.0/power(rho,2.0/3)/power(sigma_z,4.0/3); 
else
  disp("Fully CSR");
  P = N*N * (1.0/6/pi) * 5.4247827e-09 * power(gamma_rel,4)/power(rho,2);
endif

DeltaE = P * rho*theta/c_light; %% GeV 

deltaE = DeltaE/N * 1e3; %% MeV

disp(["The critial bunch length is " num2str(sigma_0*1e6) " um"]);
disp(["The energy loss per electron is " num2str(deltaE) " MeV"]);

stdE = 0.7 *deltaE;
