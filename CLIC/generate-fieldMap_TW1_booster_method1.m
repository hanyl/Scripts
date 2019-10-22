global A = load("fieldmap_rf_booster.dat");
mask = A(:,2) == 0;
global scale = 15. / max(A(mask,3)) * 1e6; % convert peak 15MV/m, unit V/m
global Length = 1.6;   ## meter

function [Ez,Er]  = electric_rho (z,r)
   global A;
   global scale;
   global Length

   z *= 1.e2;   %% meter to centimeter
   r *= 1.e2;

   delta_r = 0.1;
   delta_z = 0.1;
   nline_z = Length * 1.e2 /delta_z + 1;
   index_col = round(r/delta_r) * nline_z + round(z/delta_z) + 1; 
   Ez = A(index_col,3) * scale;
   Er = A(index_col,4) * scale;
endfunction


rho_TW = 0.02;  ## meter

N_rho = 20;
N_theta = 40;
N_length = 1600;

M.ra = linspace(0,rho_TW,N_rho);
M.ta = linspace(-pi,pi,N_theta);
M.za = linspace(0,Length,N_length);

M.Ex = zeros(N_rho,N_theta,N_length);
M.Ey = zeros(N_rho,N_theta,N_length);
M.Ez = zeros(N_rho,N_theta,N_length);

wave_number = 2*pi/(299792458./2e9);

for index_i = 1:N_rho
  for index_j = 1:N_theta
    for index_k = 1:N_length
      rho = M.ra(index_i);
      theta = M.ta(index_j);
      za = M.za(index_k);
      
      [Ez, Er] = electric_rho (za,rho);

      M.Ex(index_i,index_j,index_k) = Er*cos(theta) + i * Er*cos(theta)*tan(wave_number*za);
      M.Ey(index_i,index_j,index_k) = Er*sin(theta) + i * Er*sin(theta)*tan(wave_number*za);
      M.Ez(index_i,index_j,index_k) = Ez + i *Ez*tan(wave_number*za);
    endfor
  endfor
endfor

save("field_TW_booster_method1.dat","M");
