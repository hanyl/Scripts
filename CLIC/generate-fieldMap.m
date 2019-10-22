function [Bx,By,Bz] = magnetic_field(x,y,z)
   B0 = 6.0;  ### Tesla
   mu = 55;   ### m^-1

   rho = sqrt(x*x+y*y);
   Bz = B0 / (1 + mu*z);
   Br = rho * B0 * mu / (1+mu*z)/(1+mu*z); 

   if (x == 0) 
     Bx = 0;
   else 
     Bx = Br / sqrt(1+y*y/x/x);
   endif
   

   By = sqrt( Br * Br - Bx*Bx);

endfunction


rho_AMD = 0.02;  ## meter
Length = 0.2;   ## meter

delta_rho = 0.02;
delta_phi = 0.01;
delta_Length = 0.01;
N_rho = 40;
N_theta = 40;
N_length = 100;

PI = 3.1415926;

M.ra = linspace(0,rho_AMD,N_rho);
M.ta = linspace(-pi,pi,N_theta);
M.za = linspace(0,Length,N_length);

M.Bx = zeros(N_rho,N_theta,N_length);
M.By = zeros(N_rho,N_theta,N_length);
M.Bz = zeros(N_rho,N_theta,N_length);

mu = 55; ## 1/meter
B0 = 6.0;  ## Tesla


for i = 1:N_rho
  for j = 1:N_theta
    for k = 1:N_length
      rho = M.ra(i);
      theta = M.ta(j);
      za = M.za(k);
      
      %Bz = B0 / (1 + mu*za);
      %Br = rho * B0 * mu / (1+mu*za)/(1+mu*za);

      %%%%% From Parmela
      AA = 1+mu*za;
      Bz = B0/AA - power(rho,4)/4. * (
          2*power(mu,2)*B0/power(AA,3)
          - 3./2 * power(mu,4) * power(rho,2) * B0/power(AA,5)
          + 5./4 * power(mu,6) * power(rho,4) * B0/power(AA,7)
          );
      Br = - rho/2. * (
          -mu * B0/power(AA,2)
          + 3./4 * power(mu,3) * power(rho,2) * B0/power(AA,4)
          - 5./8 * power(mu,5) * power(rho,4) * B0/power(AA,6)
          );


      %M.Br(i,j,k) = Br;
      %M.Bt(i,j,k) = 0.0;
      %M.Bz(i,j,k) = Bz;
      M.Bx(i,j,k) = Br*cos(theta);
      M.By(i,j,k) = Br*sin(theta);
      M.Bz(i,j,k) = Bz;
    endfor
  endfor
endfor

%save("field_cylinder.dat","M");
save("field_cylinder_parmela.dat","M");

exit

for rho = 0 : rho_AMD * delta_rho : rho_AMD
  for phi = 0 : 2 * PI * delta_phi : 2 * PI
    for z = 0 : Length * delta_Length : Length
      x = rho * cos(phi);
      y = rho * sin(phi);
      [Bx,By,Bz] = magnetic_field(x,y,z)
    endfor
  endfor
endfor


delta_rho = 0.02;
delta_phi = 0.01;
delta_Length = 0.01;

M.r_xa = (-rho_AMD : rho_AMD * delta_rho : rho_AMD)';
M.ya = M.xa ;
M.za = (0 : Length * delta_Length : Length)';

for i = 1 : 1/delta_rho*2 + 1
    x = M.xa(i);
  for j = 1 : 1/delta_rho*2 + 1
    y = M.ya(j);
    for k = 1 : 1/delta_Length + 1
       z = M.za(k);
       [Bx,By,Bz] = magnetic_field(x,y,z);
       M.Bx(i,j,k) = Bx;
       M.By(i,j,k) = By;
       M.Bz(i,j,k) = Bz;
    endfor
  endfor
endfor

save("field_xy.dat","M");
