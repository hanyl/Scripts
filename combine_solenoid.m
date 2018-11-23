A= load("solenoid.dat");

shift_z = 0; ## mm
step_size = 0.5; ## mm
N_shift_z = shift_z/step_size;

B = [];
for i = 1:size(A)(1) - N_shift_z
  B = [B; A(i,1)*1e-3, A(i,2) + A(i+N_shift_z,3)*0.3];
endfor

save -text B_field.dat B;
