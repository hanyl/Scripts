global E_cst = load("3DEfield.txt");
global H_cst = load("3DHfield.txt");

function [Ex,Ey,Ez,Hx,Hy,Hz]  = electric_rho (x,y,z)
   global E_cst;
   global H_cst;

   x *= 1.e3;   %% meter to centimeter
   y *= 1.e3;
   z *= 1.e3;


   delta_r = 1;
   delta_z = 1;
   start_z = 0.;
   start_x = -42.5;
   start_y = -42.5;

   z += start_z;
   
   nline_z = 86 * 86;
   nline_y = 86;
   index_col = round((z - start_z)/delta_z) * nline_z + round((y - start_y)/delta_r) * nline_y + round((x - start_x)/delta_r) + 1; 
   Ex = E_cst(index_col,4) + i * E_cst(index_col,7);
   Ey = E_cst(index_col,5) + i * E_cst(index_col,8);
   Ez = E_cst(index_col,6) + i * E_cst(index_col,9);
   Hx = H_cst(index_col,4) + i * H_cst(index_col,7);
   Hy = H_cst(index_col,5) + i * H_cst(index_col,8);
   Hz = H_cst(index_col,6) + i * H_cst(index_col,9);
endfunction


rho_RFGun = 0.04;  ## meter
Length = 0.2;   ## meter

N_rho = 10;
N_theta = 40;
N_length = 200;

length_cell = 0.1/3; ## meter

M.ra = linspace(0,rho_RFGun,N_rho);
M.ta = linspace(-pi,pi,N_theta);
M.za = linspace(0,Length,N_length);

M.Ex = zeros(N_rho,N_theta,N_length);
M.Ey = zeros(N_rho,N_theta,N_length);
M.Ez = zeros(N_rho,N_theta,N_length);
M.Hx = zeros(N_rho,N_theta,N_length);
M.Hy = zeros(N_rho,N_theta,N_length);
M.Hz = zeros(N_rho,N_theta,N_length);

wave_number = 2*pi/(299792458./2e9); % 1/m

kl = wave_number * length_cell;

permeability = 4 * pi * 1.0e-7;

for i_rho = 1:N_rho
  for j_theta = 1:N_theta
    for k_length = 1:N_length
      rho = M.ra(i_rho);
      theta = M.ta(j_theta);
      za = M.za(k_length);

      x = rho * cos(theta);
      y = rho * sin(theta);
      
      [Ex,Ey,Ez,Hx,Hy,Hz] = electric_rho (x,y,za);
      
      M.Ex(i_rho,j_theta,k_length) = Ex;
      M.Ey(i_rho,j_theta,k_length) = Ey;
      M.Ez(i_rho,j_theta,k_length) = Ez;
      M.Bx(i_rho,j_theta,k_length) = Hx*permeability;
      M.By(i_rho,j_theta,k_length) = Hy*permeability;
      M.Bz(i_rho,j_theta,k_length) = Hz*permeability;
    endfor
  endfor
endfor

save("field_RFGun_cst_RFTrack.dat","M");
