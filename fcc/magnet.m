
B = 0.5;  %% Tesla
P = 1;  %%% GeV
L = 0.4;  %%% m
D = 0.9 - L; %%% m

function [theta,delta_h,H] = calc_drift(B,P,L,D)
    
    theta = asin(B*L/(P/0.3))
    delta_h = P/0.3/B*(1-cos(theta))
    
    H = delta_h + D * tan(theta)
endfunction


R = [];
for P = 0.5:0.1:4.5
    [theta,delta_h,H] = calc_drift(B,P,L,D) 
    R = [R;B,P,L,D,theta,delta_h,H]
endfor
save result.dat R;
