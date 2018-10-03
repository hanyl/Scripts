#!/opt/local/bin/octave -q

filename = argv{1}

B0 = load(filename);

if (size(B0)(1) ==1)
  B0 = load(filename).B;
endif

gamma = mean(B0(:,1))/0.511e-3;


x = B0(:,2);  ### micron meter
y = B0(:,3);
xp = B0(:,5);  ### micron radian
yp = B0(:,6);

B_cov = cov([ x xp y yp]);

emit_x = sqrt(det(B_cov(1:2,1:2))) * 1e-6; ### micron meter
emit_y = sqrt(det(B_cov(3:4,3:4))) * 1e-6;

disp("*************************");
emit_nx = emit_x * gamma
sigma_x = std(x)
beta_x = B_cov(1,1) / emit_x * 1e-6    ## meter
alpha_x = - B_cov(1,2) / emit_x * 1e-6  ## meter

disp("*************************");

emit_ny = emit_y * gamma
sigma_y = std(y)
beta_y = B_cov(3,3) / emit_y * 1e-6 
alpha_y = - B_cov(3,4) / emit_y * 1e-6

disp("*************************");
