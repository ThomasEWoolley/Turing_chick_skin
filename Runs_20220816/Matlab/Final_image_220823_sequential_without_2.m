ccc

Z1=load('..\U1_bc.txt','-ascii');
% Z2=load('..\U2_bc.txt','-ascii');
Z3=load('..\U3_bc_no_2.txt','-ascii');
Z4=load('..\U4_bc_no_2.txt','-ascii');
Z5=load('..\U5_bc_no_2.txt','-ascii');

x=Z1(:,1);
y=Z1(:,2);
m=1e3;
[xx,yy]=meshgrid(linspace(min(x),max(x),m),linspace(min(y),max(y),m*25/15));

map = [255, 255, 255 %white
    0 255 0 %big spot
    0, 0, 255 %blue
    255, 0, 0%3
    255, 0, 255%4
    255, 255, 0]/255;%5

for i=3
u1=Z1(:,i);
% u2=Z2(:,i);
F=scatteredInterpolant(x,y,u1);
F1=F(xx,yy)>1.5;
% F=scatteredInterpolant(x,y,u2);
% F2=F(xx,yy)>2.6;


u3=Z3(:,i);
F=scatteredInterpolant(x,y,u3);
F3=F(xx,yy)>2.5;


u4=Z4(:,i);
F=scatteredInterpolant(x,y,u4);
F4=F(xx,yy)>2.5;
% FF=F1+F2+F3+F4;

u5=Z5(:,i);
F=scatteredInterpolant(x,y,u5);
F5=F(xx,yy)>2.55;
FF=F1+3*F3+4*F4+5*F5;


end
close all
% imtool close all
% clc
H=figure;
pcolor(xx,yy,FF)
hold on
plot([min(x),max(x)],[min(y) min(y)],'k','linewidth',1)
plot([min(x),max(x)],[max(y) max(y)],'k','linewidth',1)
plot([min(x) min(x)],[min(y),max(y)],'k','linewidth',1)
plot([max(x) max(x)],[min(y),max(y)],'k','linewidth',1)

shading interp;axis equal;axis tight;axis off
colormap(H,map)
set(gca, 'YDir','reverse')
export_fig('../Pictures/Coloured_sequential_no_2.png','-r300')
%%
% Picture_analyser
% export_fig('./Pictures/Numbered_sim.png','-r300')