#!/usr/bin/octave --silent

set(0,'defaultaxesfontsize',22)
set(0,'defaulttextfontsize',22)
set(0,'defaultlinelinewidth',6)
set(0,'defaultlinemarkersize',10)


xE0=load('xEmit-all-0.dat');

figure;
hold on;
plot(E90(:,1),E90(:,4)*100-500,'-vr','linewidth',4);
hold off;

%%figure(2, 'position',[100,100,900,700]);

axis([0 50 0 200]);
xlabel('\sigma_{pos} (\mum)');
ylabel('\Delta\epsilon_{x} (nm\cdotrad)');

legend('1:1(90%)','1:1','DFS(90%)','DFS','Budget',"location", "northeast");

title(['weight = 25']);

print(['./figure/EmittanceX.eps'],'-color');
