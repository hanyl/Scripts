%global A = load("fieldmap_rf.dat");
global A = load("fieldmap_rf_booster.dat");
mask = A(:,2) == 0;
global scale = 15. / max(A(mask,3)) * 1e6; % convert peak 15MV/m, unit V/m

function [Ez,Er]  = electric_rho (z,r)
   global A;
   global scale;

   z *= 1.e2;   %% meter to centimeter
   r *= 1.e2;

   delta_r = 0.1;
   delta_z = 0.1;
   nline_z = 20/delta_z + 1;
   index_col = round(r/delta_r) * nline_z + round(z/delta_z) + 1; 
   Ez = A(index_col,3) * scale;
   Er = A(index_col,4) * scale;
endfunction


rho_TW = 0.02;  ## meter
Length = 0.2;   ## meter

N_rho = 10;
N_theta = 40;
N_length = 100;

M.ra = linspace(0,rho_TW,N_rho);
M.ta = linspace(-pi,pi,N_theta);
M.za = linspace(0,Length,N_length);

M.Ex = zeros(N_rho,N_theta,N_length);
M.Ey = zeros(N_rho,N_theta,N_length);
M.Ez = zeros(N_rho,N_theta,N_length);
M.iEx = zeros(N_rho,N_theta,N_length);
M.iEy = zeros(N_rho,N_theta,N_length);
M.iEz = zeros(N_rho,N_theta,N_length);

wave_number = 2*pi/(299792458./2e9);

for i = 1:N_rho
  for j = 1:N_theta
    for k = 1:N_length
      rho = M.ra(i);
      theta = M.ta(j);
      za = M.za(k);
      
      [Ez, Er] = electric_rho (za,rho);

      M.Ex(i,j,k) = Er*cos(theta);
      M.Ey(i,j,k) = Er*sin(theta);
      M.Ez(i,j,k) = Ez;
      M.iEx(i,j,k) = Er*cos(theta)*tan(wave_number*za);
      M.iEy(i,j,k) = Er*sin(theta)*tan(wave_number*za);
      M.iEz(i,j,k) = Ez*tan(wave_number*za);
    endfor
  endfor
endfor

save("field_TW.dat","M");
