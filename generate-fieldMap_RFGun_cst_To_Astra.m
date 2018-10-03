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


rho_RFGun = 0.0425;  ## meter
Length = 0.2;   ## meter

N_x = 40;
N_y = 40;
N_length = 200;

length_cell = 0.1/3; ## meter

M.xa = linspace(-rho_RFGun,rho_RFGun,N_x);
M.ya = linspace(-rho_RFGun,rho_RFGun,N_y);
M.za = linspace(0,Length,N_length);

M.Ex = zeros(N_x,N_y,N_length);
M.Ey = zeros(N_x,N_y,N_length);
M.Ez = zeros(N_x,N_y,N_length);
M.Hx = zeros(N_x,N_y,N_length);
M.Hy = zeros(N_x,N_y,N_length);
M.Hz = zeros(N_x,N_y,N_length);

fid_Ex = fopen("3D_RFGUN.ex",'w');
fid_Ey = fopen("3D_RFGUN.ey",'w');
fid_Ez = fopen("3D_RFGUN.ez",'w');
fid_Bx = fopen("3D_RFGUN.bx",'w');
fid_By = fopen("3D_RFGUN.by",'w');
fid_Bz = fopen("3D_RFGUN.bz",'w');

str_format = "%f %f %f %f %f %f %f %f %f %f\n";

fprintf(fid_Ex,"%f\t",M.xa);
fprintf(fid_Ex,"\n");
fprintf(fid_Ey,"%f\t",M.ya);
fprintf(fid_Ey,"\n");
fprintf(fid_Ez,"%f\t",M.za);
fprintf(fid_Ez,"\n");

permeability = 4 * pi * 1.0e-7;

for k_length = 1:N_length
  for j_y = 1:N_y
    for i_x = 1:N_x

      x = M.xa(i_x);
      y = M.ya(j_y);
      za = M.za(k_length);

      [Ex,Ey,Ez,Hx,Hy,Hz] = electric_rho (x,y,za);
      
      fprintf(fid_Ex,"%f\t",Ex);
      fprintf(fid_Ey,"%f\t",Ey);
      fprintf(fid_Ez,"%f\t",Ez);
      fprintf(fid_Bx,"%f\t",Hx*permeability);
      fprintf(fid_By,"%f\t",Hy*permeability);
      fprintf(fid_Bz,"%f\t",Hz*permeability);
    endfor
    fprintf(fid_Ex,"\n");
    fprintf(fid_Ey,"\n");
    fprintf(fid_Ez,"\n");
    fprintf(fid_Bx,"\n");
    fprintf(fid_By,"\n");
    fprintf(fid_Bz,"\n");
  endfor
endfor



fclose(fid_Ex);
fclose(fid_Ey);
fclose(fid_Ez);
fclose(fid_Bx);
fclose(fid_By);
fclose(fid_Bz);
