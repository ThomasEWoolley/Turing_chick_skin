ccc

Z1=load('..\u1.txt','-ascii');
Z2=load('..\u2.txt','-ascii');
Z3=load('..\u3.txt','-ascii');
Z4=load('..\u4.txt','-ascii');
Z5=load('..\u5.txt','-ascii');

x=Z1(:,1);
y=Z1(:,2);
m=1e3;
[xx,yy]=meshgrid(linspace(min(x),max(x),m),linspace(min(y),max(y),m*25/15));

map = [255, 255, 255 %white
    231, 166, 50 %big spot
    30, 80, 215 %blue
    39, 198, 24]/255;%small spot

for i=3
u1=Z1(:,i);
u2=Z2(:,i);
F=scatteredInterpolant(x,y,u1);
F1=F(xx,yy)>1.5;
F=scatteredInterpolant(x,y,u2);
F2=F(xx,yy)>2.6;


u3=Z3(:,i);
F=scatteredInterpolant(x,y,u3);
F3=F(xx,yy)>2.2;


u4=Z4(:,i);
F=scatteredInterpolant(x,y,u4);
F4=F(xx,yy)>2.4;
% FF=F1+F2+F3+F4;

u5=Z5(:,i);
F=scatteredInterpolant(x,y,u5);
F5=F(xx,yy)>2;
FF=F1+2*F2+3*F3+3*F4+3*F5;


end

close all
% imtool close all
% clc
H=figure;
pcolor(xx,yy,FF)
shading interp;axis equal;axis tight;axis off
colormap(H,map)
% imtool(FF)
drawnow
export_fig('./Pictures/Coloured_sim.png','-r300')
%%
% Picture_analyser
% export_fig('./Pictures/Numbered_sim.png','-r300')