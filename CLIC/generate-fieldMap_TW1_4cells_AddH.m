global A = load("fieldmap_rf.dat");

function [sEz,sEr,sHr]  = electric_rho (z,r)
   global A;

   if(z>0.2)
      z -= 0.2;
   endif


   z *= 1.e2;   %% meter to centimeter
   r *= 1.e2;

   delta_r = 0.1;
   delta_z = 0.1;
   nline_z = 20/delta_z + 1;
   index_col = round(r/delta_r) * nline_z + round(z/delta_z) + 1; 
   sEz = A(index_col,3) * 1.0e6;
   sEr = A(index_col,4) * 1.0e6;
   sHr = A(index_col,6);
endfunction


rho_TW = 0.02;  ## meterLength = 0.2;   ## meter
Length = 0.15;   ## meter
N_rho = 20;
N_theta = 40;
N_length = 150;

length_cell = 0.05; ## meter

M.ra = linspace(0,rho_TW,N_rho);
M.ta = linspace(-pi,pi,N_theta);
M.za = linspace(0,Length,N_length);

M.Ex = zeros(N_rho,N_theta,N_length);
M.Ey = zeros(N_rho,N_theta,N_length);
M.Ez = zeros(N_rho,N_theta,N_length);
M.Hx = zeros(N_rho,N_theta,N_length);
M.Hy = zeros(N_rho,N_theta,N_length);

wave_number = 2*pi/(299792458./2e9); % 1/m

kl = wave_number * length_cell;
permeability = 4 * pi * 1.0e-7;

for i_rho = 1:N_rho
  for j_theta = 1:N_theta
    for k_length = 1:N_length
      rho = M.ra(i_rho);
      theta = M.ta(j_theta);
      za = M.za(k_length);
      
      [sEz, sEr,sHt] = electric_rho (za,rho);
      [sEz_p, sEr_p,sHt_p] = electric_rho (za+length_cell,rho);
      
      E_field_z = (sEz_p - sEz * exp(i*kl))/(exp(-i*kl)-exp(i*kl)); 
      E_field_r = (sEr_p - sEr * exp(i*kl))/(exp(-i*kl)-exp(i*kl)); 
      H_field_theta = (sHt_p - sHt * exp(i*kl))/(exp(-i*kl)-exp(i*kl)); 


      M.Ex(i_rho,j_theta,k_length) = E_field_r*cos(theta);
      M.Ey(i_rho,j_theta,k_length) = E_field_r*sin(theta);
      M.Ez(i_rho,j_theta,k_length) = E_field_z;

     

      %% Rotate 90 degree
      M.Bx(i_rho,j_theta,k_length) = -H_field_theta*sin(theta) * permeability;
      M.By(i_rho,j_theta,k_length) = H_field_theta*cos(theta) * permeability;
    endfor
  endfor
endfor

save("field_TW_4cells_method2_AddH.dat","M");
