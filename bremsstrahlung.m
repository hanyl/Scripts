
E = 2;    %%% Energy:GeV

alpha_e = 7.2973525664e-3; %%% fine structure constant 1./137
r_e = 2.8179403227e-15;    %%% classical electron radius: m

Z = 74;    %%% Atomic number; 74 for W
A = 183.84;   %%% Mass W 

L_rad = log(184.15/Z^(1./3));
Lp_rad = log(1194/Z^(2./3));

N_A = 6.02214076e23;  %% Avogadro constant
rho = 19.25;  %% density  g/cm^3
n_at = N_A*rho/A*1e6;   %%% number of atoms per volum, cm->m

a = alpha_e * Z;

f = a^2 * ((1+a^2)^(-1) + 0.20206 - 0.0369*a^2 + 0.0083*a^4 - 0.002*a^6);

X0 = 1./(4*alpha_e*r_e^2*n_at*(Z^2*(L_rad-f)+Z*Lp_rad)); %% radiation length 


%E_c = 610/(Z+1.24);  %%% crtical energy: MeV
E_c = 710/(Z+0.92);

X0


R = [];
for k = 0.001:0.01:2
    y = k/E;
    ds_dk = 4*alpha_e*r_e^2/k*((4./3-4./3*y+y^2)*(Z^2*(L_rad-f)+Z*Lp_rad));
    R = [R;k,ds_dk];
endfor
