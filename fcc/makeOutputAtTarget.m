A1=load("tmp_beam_tw11.dat").A2;

cutA = (A1(:,5) - 22240.832514)/150*360 > 130 & (A1(:,5) - 22240.832514)/150*360 < 170 & A1(:,6) > 220 & A1(:,6)<270; 
LossA1 = load("loss_mask_all.dat").LL2;

sum(cutA)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

T = load("target_output_geant4_4.46GeV_10mm_0.5mm.dat");
T = [0,0,0,0,0,5;T];

SurviviedA = !LossA1;

sum(SurviviedA)

num = 0;
for (index = 1:size(T)(1))
   if(SurviviedA(index) && cutA(++num))
       SurviviedA(index) = 1;
   else
       SurviviedA(index) = 0;
   endif
endfor

sum(SurviviedA)


TA1 = T(SurviviedA,:);

save -text target_Numerical.dat TA1;
