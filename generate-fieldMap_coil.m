
function [Bz,Br]  = magnet_rho (z,r)

Bz = (4.2250000000000004*10^-4*pi)/((z+0.02)^2+0.0025)^(3/2)-(r^4*(-(0.0012675*pi)/((z+0.02)^2+0.0025)^(5/2)-(r^2*((0.0190125*pi)/((z+0.02)^2+0.0025)^(7/2)-(0.266175*pi*(z+0.02)^2)/((z+0.02)^2+0.0025)^(9/2)+(0.3992625*pi*(z+0.02)^4)/((z+0.02)^2+0.0025)^(11/2)-(0.001575*pi)/((z+0.01)^2+0.0025)^(7/2)+(0.02205*pi*(z+0.01)^2)/((z+0.01)^2+0.0025)^(9/2)-(0.033075*pi*(z+0.01)^4)/((z+0.01)^2+0.0025)^(11/2)-(0.001575*pi)/(z^2+0.0025)^(7/2)+(0.02205*pi*z^2)/(z^2+0.0025)^(9/2)-(0.033075*pi*z^4)/(z^2+0.0025)^(11/2)-(0.033075*pi*(z-0.01)^4)/((z-0.01)^2+0.0025)^(11/2)+(0.02205*pi*(z-0.01)^2)/((z-0.01)^2+0.0025)^(9/2)-(0.014175*pi*(z-0.02)^4)/((z-0.02)^2+0.0025)^(11/2)+(0.00945*pi*(z-0.02)^2)/((z-0.02)^2+0.0025)^(9/2)-(.009450000000000002*pi*(z-0.03)^4)/((z-0.03)^2+0.0025)^(11/2)+(.006300000000000001*pi*(z-0.03)^2)/((z-0.03)^2+0.0025)^(9/2)+(0.0165375*pi*(z-0.04)^4)/((z-0.04)^2+0.0025)^(11/2)-(0.011025*pi*(z-0.04)^2)/((z-0.04)^2+0.0025)^(9/2)+(0.06615*pi*(z-0.05)^4)/((z-0.05)^2+0.01)^(11/2)-(0.0441*pi*(z-0.05)^2)/((z-0.05)^2+0.01)^(9/2)+(0.1488375*pi*(z-0.1)^4)/((z-0.1)^2+0.0225)^(11/2)-(.09922499999999998*pi*(z-0.1)^2)/((z-0.1)^2+0.0225)^(9/2)+(0.1488375*pi*(z-0.15)^4)/((z-0.15)^2+0.0225)^(11/2)-(.09922499999999998*pi*(z-0.15)^2)/((z-0.15)^2+0.0225)^(9/2)+(0.1063125*pi*(z-0.2)^4)/((z-0.2)^2+0.0225)^(11/2)-(.07087500000000002*pi*(z-0.2)^2)/((z-0.2)^2+0.0225)^(9/2)+(.08504999999999997*pi*(z-0.25)^4)/((z-0.25)^2+0.0225)^(11/2)-(.05669999999999999*pi*(z-0.25)^2)/((z-0.25)^2+0.0225)^(9/2)-(0.001575*pi)/((z-0.01)^2+0.0025)^(7/2)-(6.75*10^-4*pi)/((z-0.02)^2+0.0025)^(7/2)-(4.5000000000000007*10^-4*pi)/((z-0.03)^2+0.0025)^(7/2)+(7.875000000000002*10^-4*pi)/((z-0.04)^2+0.0025)^(7/2)+(0.00315*pi)/((z-0.05)^2+0.01)^(7/2)+(.007087499999999998*pi)/((z-0.1)^2+0.0225)^(7/2)+(.007087499999999998*pi)/((z-0.15)^2+0.0225)^(7/2)+(.005062500000000001*pi)/((z-0.2)^2+0.0225)^(7/2)+(.004049999999999999*pi)/((z-0.25)^2+0.0225)^(7/2)))/(16)+(.006337499999999999*pi*(z+0.02)^2)/((z+0.02)^2+0.0025)^(7/2)+(r^4*(-(0.6654375*pi)/((z+0.02)^2+0.0025)^(9/2)+(17.9668125*pi*(z+0.02)^2)/((z+0.02)^2+0.0025)^(11/2)-(65.87831249999999*pi*(z+0.02)^4)/((z+0.02)^2+0.0025)^(13/2)+(57.09453749999999*pi*(z+0.02)^6)/((z+0.02)^2+0.0025)^(15/2)+(0.055125*pi)/((z+0.01)^2+0.0025)^(9/2)-(1.488375*pi*(z+0.01)^2)/((z+0.01)^2+0.0025)^(11/2)+(5.457375*pi*(z+0.01)^4)/((z+0.01)^2+0.0025)^(13/2)-(4.729725*pi*(z+0.01)^6)/((z+0.01)^2+0.0025)^(15/2)+(0.055125*pi)/(z^2+0.0025)^(9/2)-(1.488375*pi*z^2)/(z^2+0.0025)^(11/2)+(5.457375*pi*z^4)/(z^2+0.0025)^(13/2)-(4.729725*pi*z^6)/(z^2+0.0025)^(15/2)-(4.729725*pi*(z-0.01)^6)/((z-0.01)^2+0.0025)^(15/2)+(5.457375*pi*(z-0.01)^4)/((z-0.01)^2+0.0025)^(13/2)-(1.488375*pi*(z-0.01)^2)/((z-0.01)^2+0.0025)^(11/2)-(2.027025*pi*(z-0.02)^6)/((z-0.02)^2+0.0025)^(15/2)+(2.338875*pi*(z-0.02)^4)/((z-0.02)^2+0.0025)^(13/2)-(0.637875*pi*(z-0.02)^2)/((z-0.02)^2+0.0025)^(11/2)-(1.35135*pi*(z-0.03)^6)/((z-0.03)^2+0.0025)^(15/2)+(1.55925*pi*(z-0.03)^4)/((z-0.03)^2+0.0025)^(13/2)-(.4252500000000001*pi*(z-0.03)^2)/((z-0.03)^2+0.0025)^(11/2)+(2.3648625*pi*(z-0.04)^6)/((z-0.04)^2+0.0025)^(15/2)-(2.7286875*pi*(z-0.04)^4)/((z-0.04)^2+0.0025)^(13/2)+(0.7441875*pi*(z-0.04)^2)/((z-0.04)^2+0.0025)^(11/2)+(9.45945*pi*(z-0.05)^6)/((z-0.05)^2+0.01)^(15/2)-(10.91475*pi*(z-0.05)^4)/((z-0.05)^2+0.01)^(13/2)+(2.97675*pi*(z-0.05)^2)/((z-0.05)^2+0.01)^(11/2)+(21.28376249999999*pi*(z-0.1)^6)/((z-0.1)^2+0.0225)^(15/2)-(24.5581875*pi*(z-0.1)^4)/((z-0.1)^2+0.0225)^(13/2)+(6.697687499999999*pi*(z-0.1)^2)/((z-0.1)^2+0.0225)^(11/2)+(21.28376249999999*pi*(z-0.15)^6)/((z-0.15)^2+0.0225)^(15/2)-(24.5581875*pi*(z-0.15)^4)/((z-0.15)^2+0.0225)^(13/2)+(6.697687499999999*pi*(z-0.15)^2)/((z-0.15)^2+0.0225)^(11/2)+(15.2026875*pi*(z-0.2)^6)/((z-0.2)^2+0.0225)^(15/2)-(17.5415625*pi*(z-0.2)^4)/((z-0.2)^2+0.0225)^(13/2)+(4.784062500000001*pi*(z-0.2)^2)/((z-0.2)^2+0.0225)^(11/2)+(12.16215*pi*(z-0.25)^6)/((z-0.25)^2+0.0225)^(15/2)-(14.03325*pi*(z-0.25)^4)/((z-0.25)^2+0.0225)^(13/2)+(3.827249999999999*pi*(z-0.25)^2)/((z-0.25)^2+0.0225)^(11/2)+(0.055125*pi)/((z-0.01)^2+0.0025)^(9/2)+(0.023625*pi)/((z-0.02)^2+0.0025)^(9/2)+(0.01575*pi)/((z-0.03)^2+0.0025)^(9/2)-(0.0275625*pi)/((z-0.04)^2+0.0025)^(9/2)-(0.11025*pi)/((z-0.05)^2+0.01)^(9/2)-(0.2480625*pi)/((z-0.1)^2+0.0225)^(9/2)-(0.2480625*pi)/((z-0.15)^2+0.0225)^(9/2)-(.1771875000000001*pi)/((z-0.2)^2+0.0225)^(9/2)-(0.14175*pi)/((z-0.25)^2+0.0225)^(9/2)))/(576)+(1.0500000000000001*10^-4*pi)/((z+0.01)^2+0.0025)^(5/2)-(5.250000000000001*10^-4*pi*(z+0.01)^2)/((z+0.01)^2+0.0025)^(7/2)+(1.0500000000000001*10^-4*pi)/(z^2+0.0025)^(5/2)-(5.250000000000001*10^-4*pi*z^2)/(z^2+0.0025)^(7/2)-(5.250000000000001*10^-4*pi*(z-0.01)^2)/((z-0.01)^2+0.0025)^(7/2)-(2.2500000000000003*10^-4*pi*(z-0.02)^2)/((z-0.02)^2+0.0025)^(7/2)-(1.5*10^-4*pi*(z-0.03)^2)/((z-0.03)^2+0.0025)^(7/2)+(2.6250000000000007*10^-4*pi*(z-0.04)^2)/((z-0.04)^2+0.0025)^(7/2)+(0.00105*pi*(z-0.05)^2)/((z-0.05)^2+0.01)^(7/2)+(0.0023625*pi*(z-0.1)^2)/((z-0.1)^2+0.0225)^(7/2)+(0.0023625*pi*(z-0.15)^2)/((z-0.15)^2+0.0225)^(7/2)+(0.0016875*pi*(z-0.2)^2)/((z-0.2)^2+0.0225)^(7/2)+(0.00135*pi*(z-0.25)^2)/((z-0.25)^2+0.0225)^(7/2)+(1.0500000000000001*10^-4*pi)/((z-0.01)^2+0.0025)^(5/2)+(4.5000000000000007*10^-5*pi)/((z-0.02)^2+0.0025)^(5/2)+(3.0000000000000004*10^-5*pi)/((z-0.03)^2+0.0025)^(5/2)-(5.25*10^-5*pi)/((z-0.04)^2+0.0025)^(5/2)-(2.1000000000000002*10^-4*pi)/((z-0.05)^2+0.01)^(5/2)-(4.724999999999999*10^-4*pi)/((z-0.1)^2+0.0225)^(5/2)-(4.724999999999999*10^-4*pi)/((z-0.15)^2+0.0225)^(5/2)-(3.375*10^-4*pi)/((z-0.2)^2+0.0225)^(5/2)-(2.699999999999999*10^-4*pi)/((z-0.25)^2+0.0225)^(5/2)))/(4)-(3.5000000000000003*10^-5*pi)/((z+0.01)^2+0.0025)^(3/2)-(3.5000000000000003*10^-5*pi)/(z^2+0.0025)^(3/2)-(3.5000000000000003*10^-5*pi)/((z-0.01)^2+0.0025)^(3/2)-(1.5000000000000002*10^-5*pi)/((z-0.02)^2+0.0025)^(3/2)-(1.*10^-5*pi)/((z-0.03)^2+0.0025)^(3/2)+(1.7500000000000002*10^-5*pi)/((z-0.04)^2+0.0025)^(3/2)+(7.000000000000001*10^-5*pi)/((z-0.05)^2+0.01)^(3/2)+(1.5749999999999997*10^-4*pi)/((z-0.1)^2+0.0225)^(3/2)+(1.5749999999999997*10^-4*pi)/((z-0.15)^2+0.0225)^(3/2)+(1.125*10^-4*pi)/((z-0.2)^2+0.0225)^(3/2)+(9.*10^-5*pi)/((z-0.25)^2+0.0225)^(3/2);

Br = -(r*(-(0.0012675*pi*(z+0.02))/((z+0.02)^2+0.0025)^(5/2)-(r^2*((0.0190125*pi*(z+0.02))/((z+0.02)^2+0.0025)^(7/2)-(0.0443625*pi*(z+0.02)^3)/((z+0.02)^2+0.0025)^(9/2)-(0.001575*pi*(z+0.01))/((z+0.01)^2+0.0025)^(7/2)+(0.003675*pi*(z+0.01)^3)/((z+0.01)^2+0.0025)^(9/2)-(0.001575*pi*z)/(z^2+0.0025)^(7/2)+(0.003675*pi*z^3)/(z^2+0.0025)^(9/2)-(0.001575*pi*(z-0.01))/((z-0.01)^2+0.0025)^(7/2)-(6.75*10^-4*pi*(z-0.02))/((z-0.02)^2+0.0025)^(7/2)-(4.5000000000000007*10^-4*pi*(z-0.03))/((z-0.03)^2+0.0025)^(7/2)+(7.875000000000002*10^-4*pi*(z-0.04))/((z-0.04)^2+0.0025)^(7/2)+(0.00315*pi*(z-0.05))/((z-0.05)^2+0.01)^(7/2)+(.007087499999999998*pi*(z-0.1))/((z-0.1)^2+0.0225)^(7/2)+(.007087499999999998*pi*(z-0.15))/((z-0.15)^2+0.0225)^(7/2)+(.005062500000000001*pi*(z-0.2))/((z-0.2)^2+0.0225)^(7/2)+(.004049999999999999*pi*(z-0.25))/((z-0.25)^2+0.0225)^(7/2)+(0.003675*pi*(z-0.01)^3)/((z-0.01)^2+0.0025)^(9/2)+(0.001575*pi*(z-0.02)^3)/((z-0.02)^2+0.0025)^(9/2)+(0.00105*pi*(z-0.03)^3)/((z-0.03)^2+0.0025)^(9/2)-(0.0018375*pi*(z-0.04)^3)/((z-0.04)^2+0.0025)^(9/2)-(.007350000000000001*pi*(z-0.05)^3)/((z-0.05)^2+0.01)^(9/2)-(0.0165375*pi*(z-0.1)^3)/((z-0.1)^2+0.0225)^(9/2)-(0.0165375*pi*(z-0.15)^3)/((z-0.15)^2+0.0225)^(9/2)-(0.0118125*pi*(z-0.2)^3)/((z-0.2)^2+0.0225)^(9/2)-(.009449999999999997*pi*(z-0.25)^3)/((z-0.25)^2+0.0225)^(9/2)))/(8)+(r^4*(-(0.6654375*pi*(z+0.02))/((z+0.02)^2+0.0025)^(9/2)+(3.992625*pi*(z+0.02)^3)/((z+0.02)^2+0.0025)^(11/2)-(4.391887499999999*pi*(z+0.02)^5)/((z+0.02)^2+0.0025)^(13/2)+(0.055125*pi*(z+0.01))/((z+0.01)^2+0.0025)^(9/2)-(0.33075*pi*(z+0.01)^3)/((z+0.01)^2+0.0025)^(11/2)+(0.363825*pi*(z+0.01)^5)/((z+0.01)^2+0.0025)^(13/2)+(0.055125*pi*z)/(z^2+0.0025)^(9/2)-(0.33075*pi*z^3)/(z^2+0.0025)^(11/2)+(0.363825*pi*z^5)/(z^2+0.0025)^(13/2)+(0.055125*pi*(z-0.01))/((z-0.01)^2+0.0025)^(9/2)+(0.023625*pi*(z-0.02))/((z-0.02)^2+0.0025)^(9/2)+(0.01575*pi*(z-0.03))/((z-0.03)^2+0.0025)^(9/2)-(0.0275625*pi*(z-0.04))/((z-0.04)^2+0.0025)^(9/2)-(0.11025*pi*(z-0.05))/((z-0.05)^2+0.01)^(9/2)-(0.2480625*pi*(z-0.1))/((z-0.1)^2+0.0225)^(9/2)-(0.2480625*pi*(z-0.15))/((z-0.15)^2+0.0225)^(9/2)-(.1771875000000001*pi*(z-0.2))/((z-0.2)^2+0.0225)^(9/2)-(0.14175*pi*(z-0.25))/((z-0.25)^2+0.0225)^(9/2)+(0.363825*pi*(z-0.01)^5)/((z-0.01)^2+0.0025)^(13/2)-(0.33075*pi*(z-0.01)^3)/((z-0.01)^2+0.0025)^(11/2)+(0.155925*pi*(z-0.02)^5)/((z-0.02)^2+0.0025)^(13/2)-(0.14175*pi*(z-0.02)^3)/((z-0.02)^2+0.0025)^(11/2)+(0.10395*pi*(z-0.03)^5)/((z-0.03)^2+0.0025)^(13/2)-(.09450000000000001*pi*(z-0.03)^3)/((z-0.03)^2+0.0025)^(11/2)-(0.1819125*pi*(z-0.04)^5)/((z-0.04)^2+0.0025)^(13/2)+(0.165375*pi*(z-0.04)^3)/((z-0.04)^2+0.0025)^(11/2)-(0.72765*pi*(z-0.05)^5)/((z-0.05)^2+0.01)^(13/2)+(0.6615*pi*(z-0.05)^3)/((z-0.05)^2+0.01)^(11/2)-(1.6372125*pi*(z-0.1)^5)/((z-0.1)^2+0.0225)^(13/2)+(1.488375*pi*(z-0.1)^3)/((z-0.1)^2+0.0225)^(11/2)-(1.6372125*pi*(z-0.15)^5)/((z-0.15)^2+0.0225)^(13/2)+(1.488375*pi*(z-0.15)^3)/((z-0.15)^2+0.0225)^(11/2)-(1.1694375*pi*(z-0.2)^5)/((z-0.2)^2+0.0225)^(13/2)+(1.063125*pi*(z-0.2)^3)/((z-0.2)^2+0.0225)^(11/2)-(.9355499999999997*pi*(z-0.25)^5)/((z-0.25)^2+0.0225)^(13/2)+(.8504999999999998*pi*(z-0.25)^3)/((z-0.25)^2+0.0225)^(11/2)))/(192)+(1.0500000000000001*10^-4*pi*(z+0.01))/((z+0.01)^2+0.0025)^(5/2)+(1.0500000000000001*10^-4*pi*z)/(z^2+0.0025)^(5/2)+(1.0500000000000001*10^-4*pi*(z-0.01))/((z-0.01)^2+0.0025)^(5/2)+(4.5000000000000007*10^-5*pi*(z-0.02))/((z-0.02)^2+0.0025)^(5/2)+(3.0000000000000004*10^-5*pi*(z-0.03))/((z-0.03)^2+0.0025)^(5/2)-(5.25*10^-5*pi*(z-0.04))/((z-0.04)^2+0.0025)^(5/2)-(2.1000000000000002*10^-4*pi*(z-0.05))/((z-0.05)^2+0.01)^(5/2)-(4.724999999999999*10^-4*pi*(z-0.1))/((z-0.1)^2+0.0225)^(5/2)-(4.724999999999999*10^-4*pi*(z-0.15))/((z-0.15)^2+0.0225)^(5/2)-(3.375*10^-4*pi*(z-0.2))/((z-0.2)^2+0.0225)^(5/2)-(2.699999999999999*10^-4*pi*(z-0.25))/((z-0.25)^2+0.0225)^(5/2)))/2;

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

%save("field_cylinder.dat","M");
save("field_cylinder_parmela_coil.dat","M");
