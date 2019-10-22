global A = load("E_tw_cst.txt");
mask = A(:,1) == 0 & A(:,2) == 0;
global scale = 15. / max(A(mask,6)) * 1e6; % convert peak 15MV/m, unit V/m

function [Ex,Ey,Ez]  = electric_rho (x,y,z)
   global A;
   global scale;

   x *= 1.e2;   %% meter to centimeter
   y *= 1.e2;
   z *= 1.e2;


   delta_r = 0.1;
   delta_z = 0.1;
   start_z = -10.;
   start_x = -2.;
   start_y = -2.;

   z += start_z;
   
   nline_z = 41 * 41;
   nline_y = 41;
   index_col = round((z - start_z)/delta_z) * nline_z + round((y - start_y)/delta_r) * nline_y + round((x - start_x)/delta_r) + 1; 
   Ex = A(index_col,4) + i * A(index_col,7);
   Ey = A(index_col,5) + i * A(index_col,8);
   Ez = A(index_col,6) + i * A(index_col,9);
endfunction


rho_TW = 0.02;  ## meter
Length = 0.15;   ## meter

N_rho = 10;
N_theta = 40;
N_length = 1600;

length_cell = 0.05; ## meter

M.ra = linspace(0,rho_TW,N_rho);
M.ta = linspace(-pi,pi,N_theta);
M.za = linspace(0,Length,N_length);

M.Ex = zeros(N_rho,N_theta,N_length);
M.Ey = zeros(N_rho,N_theta,N_length);
M.Ez = zeros(N_rho,N_theta,N_length);

wave_number = 2*pi/(299792458./2e9); % 1/m

kl = wave_number * length_cell;

for i_rho = 1:N_rho
  for j_theta = 1:N_theta
    for k_length = 1:N_length
      rho = M.ra(i_rho);
      theta = M.ta(j_theta);
      za = M.za(k_length);

      x = rho * cos(theta);
      y = rho * sin(theta);
      
      [Ex,Ey,Ez] = electric_rho (x,y,za);
      
      M.Ex(i_rho,j_theta,k_length) = Ex;
      M.Ey(i_rho,j_theta,k_length) = Ey;
      M.Ez(i_rho,j_theta,k_length) = Ez;
    endfor
  endfor
endfor

save("field_TW1_cst.dat","M");
