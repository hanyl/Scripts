c_light = 299792458.; %% m/s
mass_e = 0.511; %% MeV
omega = 2*pi*2.9985e9;

load("RF_field.dat");

deltaT = 1e-3/c_light; %% 1 mm/c to second
Energy0 = 0.0000001 + mass_e; %% MeV
z0 = 0;  %%% meter

gamma = Energy0/mass_e;
Vz0 = c_light * sqrt(1-1./gamma/gamma); %%b m/s

R =[];

%for phi = 90:180
for phi = 0:360
    z = z0;
    Vz = Vz0;
    Energy = Energy0;
    for index = 1:500
      if (z < 0 ) 
        break;
        Energy = 0;
      endif
      Time = index * deltaT;
      %E_rf = - F(round(z/0.001)+1,2)/1e6 * cos(omega*Time + phi/180.*pi);  %% MeV/m
      E_rf = - F(round(z/0.001)+1,2)/1e6 * sin(omega*Time + phi/180.*pi);  %% MeV/m
      deltaZ = Vz * deltaT;
      deltaE = deltaZ * E_rf;
      Energy += deltaE;
      if ( Energy <= mass_e )   %%% Maybe there is problem for treatment of the backward particle
        Energy = mass_e + abs(Energy-mass_e);
        gamma = Energy/mass_e;
        Vz = -c_light * sqrt(1-1./gamma/gamma);
        %z += deltaZ;   %%% Assume there is movement
      else
        gamma = Energy/mass_e;
        if ( Vz > 0 )
          Vz = c_light * sqrt(1-1./gamma/gamma);
        else
          Vz = -c_light * sqrt(1-1./gamma/gamma);
        endif 
        z += deltaZ;
      endif 
    endfor
    R = [R;phi Energy-mass_e];
endfor

save -text "result_calc_sin.dat" R;
