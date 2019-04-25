global E_cst = load("E_tw.txt");
global H_cst = load("H_tw.txt");

function [Ex,Ey,Ez,Hx,Hy,Hz]  = electric_rho (x,y,z)
   global E_cst;
   global H_cst;

   x *= 1.e3;   %% meter to millimeter
   y *= 1.e3;
   z *= 1.e3;


   delta_r = 1;
   delta_z = 1;
   start_z = -100;
   start_x = -20;
   start_y = -20;

   nline_z = 41 * 41;
   nline_y = 41;
   index_col = round((z - start_z)/delta_z) * nline_z + round((y - start_y)/delta_r) * nline_y + round((x - start_x)/delta_r) + 1; 
   Ex = E_cst(index_col,4) + i * E_cst(index_col,7);
   Ey = E_cst(index_col,5) + i * E_cst(index_col,8);
   Ez = E_cst(index_col,6) + i * E_cst(index_col,9);
   Hx = H_cst(index_col,4) + i * H_cst(index_col,7);
   Hy = H_cst(index_col,5) + i * H_cst(index_col,8);
   Hz = H_cst(index_col,6) + i * H_cst(index_col,9);
endfunction


rho_RFGun = 0.02;  ## meter
Length = 0.15;   ## meter

N_x = 41;
N_y = 41;
N_length = 151;

length_cell = 0.1/3; ## meter

M.xa = linspace(-rho_RFGun,rho_RFGun,N_x);
M.ya = linspace(-rho_RFGun,rho_RFGun,N_y);
M.za = linspace(-0.1,Length-0.1,N_length);

fid_Ex_Re = fopen("3D_Linac_Re.ex",'w');
fid_Ey_Re = fopen("3D_Linac_Re.ey",'w');
fid_Ez_Re = fopen("3D_Linac_Re.ez",'w');
fid_Bx_Re = fopen("3D_Linac_Re.bx",'w');
fid_By_Re = fopen("3D_Linac_Re.by",'w');
fid_Bz_Re = fopen("3D_Linac_Re.bz",'w');

fid_Ex_Im = fopen("3D_Linac_Im.ex",'w');
fid_Ey_Im = fopen("3D_Linac_Im.ey",'w');
fid_Ez_Im = fopen("3D_Linac_Im.ez",'w');
fid_Bx_Im = fopen("3D_Linac_Im.bx",'w');
fid_By_Im = fopen("3D_Linac_Im.by",'w');
fid_Bz_Im = fopen("3D_Linac_Im.bz",'w');


str_format = "%f %f %f %f %f %f %f %f %f %f\n";

fprintf(fid_Ex_Re,"%f\t",M.xa);
fprintf(fid_Ex_Re,"\n");
fprintf(fid_Ey_Re,"%f\t",M.ya);
fprintf(fid_Ey_Re,"\n");
fprintf(fid_Ez_Re,"%f\t",M.za);
fprintf(fid_Ez_Re,"\n");
fprintf(fid_Ex_Im,"%f\t",M.xa);
fprintf(fid_Ex_Im,"\n");
fprintf(fid_Ey_Im,"%f\t",M.ya);
fprintf(fid_Ey_Im,"\n");
fprintf(fid_Ez_Im,"%f\t",M.za);
fprintf(fid_Ez_Im,"\n");

permeability = 4 * pi * 1.0e-7;

for k_length = 1:N_length
  for j_y = 1:N_y
    for i_x = 1:N_x

      x = M.xa(i_x);
      y = M.ya(j_y);
      za = M.za(k_length);

      [Ex,Ey,Ez,Hx,Hy,Hz] = electric_rho (x,y,za);
      
      fprintf(fid_Ex_Re,"%f\t",real(Ex));
      fprintf(fid_Ey_Re,"%f\t",real(Ey));
      fprintf(fid_Ez_Re,"%f\t",real(Ez));
      fprintf(fid_Bx_Re,"%f\t",real(Hx)*permeability);
      fprintf(fid_By_Re,"%f\t",real(Hy)*permeability);
      fprintf(fid_Bz_Re,"%f\t",real(Hz)*permeability);
      fprintf(fid_Ex_Im,"%f\t",imag(Ex));
      fprintf(fid_Ey_Im,"%f\t",imag(Ey));
      fprintf(fid_Ez_Im,"%f\t",imag(Ez));
      fprintf(fid_Bx_Im,"%f\t",imag(Hx)*permeability);
      fprintf(fid_By_Im,"%f\t",imag(Hy)*permeability);
      fprintf(fid_Bz_Im,"%f\t",imag(Hz)*permeability);
    endfor
    fprintf(fid_Ex_Re,"\n");
    fprintf(fid_Ey_Re,"\n");
    fprintf(fid_Ez_Re,"\n");
    fprintf(fid_Bx_Re,"\n");
    fprintf(fid_By_Re,"\n");
    fprintf(fid_Bz_Re,"\n");
    fprintf(fid_Ex_Im,"\n");
    fprintf(fid_Ey_Im,"\n");
    fprintf(fid_Ez_Im,"\n");
    fprintf(fid_Bx_Im,"\n");
    fprintf(fid_By_Im,"\n");
    fprintf(fid_Bz_Im,"\n");
  endfor
endfor



fclose(fid_Ex_Re);
fclose(fid_Ey_Re);
fclose(fid_Ez_Re);
fclose(fid_Bx_Re);
fclose(fid_By_Re);
fclose(fid_Bz_Re);

fclose(fid_Ex_Im);
fclose(fid_Ey_Im);
fclose(fid_Ez_Im);
fclose(fid_Bx_Im);
fclose(fid_By_Im);
fclose(fid_Bz_Im);
