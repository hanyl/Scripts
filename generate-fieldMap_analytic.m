
function [Bz,Br]  = magnet_rho (Z,R)

  fB_max = 6.;
  fMu = 55.;

  Bz =fB_max/(1+fMu*Z)* \
      (1. - 0.5* power(R*fMu/(1+fMu*Z),2) \
       + 3./8.* power(R*fMu/(1+fMu*Z),4) \
       - 5./16.* power(R*fMu/(1+fMu*Z),6));


  Br = fB_max/(1+fMu*Z)* \
     ( 0.5       *  R*fMu/(1+fMu*Z) \
       -(3./8.) *power(R*fMu/(1+fMu*Z),3) \
       +(5./16.)*power(R*fMu/(1+fMu*Z),5));


endfunction


rho_AMD = 0.02;  ## meter
Length = 0.2;   ## meter

delta_rho = 0.02;
delta_phi = 0.01;
delta_Length = 0.01;
N_rho = 40;
N_theta = 40;
N_length = 100;

M.ra = linspace(0,rho_AMD,N_rho);
M.ta = linspace(-pi,pi,N_theta);
M.za = linspace(0,Length,N_length);

M.Bx = zeros(N_rho,N_theta,N_length);
M.By = zeros(N_rho,N_theta,N_length);
M.Bz = zeros(N_rho,N_theta,N_length);

for i = 1:N_rho
  for j = 1:N_theta
    for k = 1:N_length
      rho = M.ra(i);
      theta = M.ta(j);
      za = M.za(k);
      
      [Bz, Br] = magnet_rho (za,rho);

      M.Bx(i,j,k) = Br*cos(theta);
      M.By(i,j,k) = Br*sin(theta);
      M.Bz(i,j,k) = Bz;
    endfor
  endfor
endfor

save("field_cylinder_analytic.dat","M");
