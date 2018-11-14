global B_cst = load("S_field_3d.dat");

function [Bx,By,Bz]  = electric_rho (x,y,z)
   global B_cst;

   x *= 1.e3;   %% meter to millimeter
   y *= 1.e3;
   z *= 1.e3;


   delta_r = 1;
   delta_z = 1;
   start_z = 0.;
   start_x = -20;
   start_y = -20;

   z += start_z;
   
   nline_z = 41 * 41;
   nline_y = 41;
   index_col = round((z - start_z)/delta_z) * nline_z + round((y - start_y)/delta_r) * nline_y + round((x - start_x)/delta_r) + 1; 
   Bx = B_cst(index_col,4);
   By = B_cst(index_col,5);
   Bz = B_cst(index_col,6);
endfunction


rho_RFGun = 0.02;  ## meter
Length = 0.934;   ## meter

N_rho = 10;
N_theta = 40;
N_length = 934;


M.ra = linspace(0,rho_RFGun,N_rho);
M.ta = linspace(-pi,pi,N_theta);
M.za = linspace(0,Length,N_length);

M.Bx = zeros(N_rho,N_theta,N_length);
M.By = zeros(N_rho,N_theta,N_length);
M.Bz = zeros(N_rho,N_theta,N_length);

permeability = 4 * pi * 1.0e-7;

for i_rho = 1:N_rho
  for j_theta = 1:N_theta
    for k_length = 1:N_length
      rho = M.ra(i_rho);
      theta = M.ta(j_theta);
      za = M.za(k_length);

      x = rho * cos(theta);
      y = rho * sin(theta);
      
      [Bx,By,Bz] = electric_rho (x,y,za);
      
      M.Bx(i_rho,j_theta,k_length) = Bx;
      M.By(i_rho,j_theta,k_length) = By;
      M.Bz(i_rho,j_theta,k_length) = Bz;
    endfor
  endfor
endfor

save("field_solenoid_RFTrack.dat","M");
