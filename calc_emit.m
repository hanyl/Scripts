A1 = load("L_band_5T_0.5T/output_beam_TW_11.dat").A1;

function emit_calc (A1,nsigma)

    A1(:,2) = A1(:,2)./sqrt(1+A1(:,2).*A1(:,2)*1e-6+A1(:,4).*A1(:,4)*1e-6);
    A1(:,4) = A1(:,4)./sqrt(1+A1(:,2).*A1(:,2)*1e-6+A1(:,4).*A1(:,4)*1e-6);
    
    mask_t = A1(:,5)>18705 & A1(:,5)<18705+20;
    %mask_t = mask_t & abs(A1(:,2)) < 10 & abs(A1(:,4)) < 10;
    
    mean_x = mean(A1(mask_t,1));
    std_x = std(A1(mask_t,1));
    mean_y = mean(A1(mask_t,3));
    std_y = std(A1(mask_t,3));
    
    mean_xp = mean(A1(mask_t,2));
    std_xp = std(A1(mask_t,2));
    mean_yp = mean(A1(mask_t,4));
    std_yp = std(A1(mask_t,4));
    
    %nsigma = 3;
    
    %mask_x = mask_t & abs(A1(:,1) - mean_x)<nsigma*std_x;
    %mask_y = mask_t & abs(A1(:,3) - mean_y)<nsigma*std_y;
    %mask_xp = mask_t & abs(A1(:,2) - mean_xp)<nsigma*std_xp;
    %mask_yp = mask_t & abs(A1(:,4) - mean_yp)<nsigma*std_yp;
    %
    %mask_h = mask_x & mask_xp;
    %mask_v = mask_y & mask_yp;
    
    mask_h = mask_t & ((A1(:,1) - mean_x).*(A1(:,1) - mean_x)/std_x/std_x ...
                      + (A1(:,2) - mean_x).*(A1(:,2) - mean_x)/std_xp/std_xp<nsigma*nsigma);
    mask_v = mask_t & ((A1(:,3) - mean_y).*(A1(:,3) - mean_y)/std_y/std_y ...
                      + (A1(:,4) - mean_yp).*(A1(:,4) - mean_yp)/std_yp/std_yp<nsigma*nsigma);
    
    per_x = sum(mask_h)/size(A1)(1);
    per_y = sum(mask_v)/size(A1)(1);
    
    disp(["We use " num2str(nsigma) " sigma"]);
    disp(["The particles used for x is " num2str(per_x)]); 
    disp(["The particles used for y is " num2str(per_y)]); 
    x=A1(mask_h,1);  % mm
    xp = A1(mask_h,2);  %% mrad
    y=A1(mask_v,3);  % mm
    yp = A1(mask_v,4);  %% mrad
    
    emit_x = sqrt(det(cov([x xp])))    %% urad
    emit_y = sqrt(det(cov([y yp])))    %% urad
    
    scatter(A1(mask_t,1),A1(mask_t,2),'b')
    hold on;
    scatter(A1(mask_h,1),A1(mask_h,2),'r')
    xlabel("x (mm)");
    ylabel("x' (mrad)");
    print("emit_scatter_xxp.eps","-color");
    
    hold off;
    figure();
    scatter(A1(mask_t,3),A1(mask_t,4),'b')
    hold on;
    scatter(A1(mask_v,3),A1(mask_v,4),'r')
    xlabel("x (mm)");
    ylabel("x' (mrad)");
    print("emit_scatter_yyp.eps","-color");

endfunction

A1 = load("L_band_5T_0.5T/output_beam_TW_11.dat").A1;
emit_calc(A1,2)
disp('***************');
A1 = load("L_band_5T_0.7T/output_beam_TW_11.dat").A1;
emit_calc(A1,2)
disp('***************');
A1 = load("L_band_7T_0.7T/output_beam_TW_11.dat").A1;
emit_calc(A1,2)
disp('***************');
