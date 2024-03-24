ccc

Z1=load('..\U1_bc.txt','-ascii');
Z2=load('..\U2_bc.txt','-ascii');
Z3=load('..\U3_bc.txt','-ascii');
Z4=load('..\U4_bc.txt','-ascii');
Z5=load('..\U5_bc.txt','-ascii');

x=Z1(:,1);
y=Z1(:,2);
m=1e3;
[xx,yy]=meshgrid(linspace(min(x),max(x),m),linspace(min(y),max(y),m*25/15));

map5 = [255, 255, 255 %white
    255 165 0 %big spot
    0, 0, 255 %blue
    255, 0, 0%3
    255, 0, 255%4
    255, 255, 0]/255;%5


map1 = [255, 255, 255 %white
    255 165 0 %big spot
    ]/255;%5
map2 = [255, 255, 255 %white
    255 165 0 %big spot
    0, 0, 255 %blue
   ]/255;%5
map3 = [255, 255, 255 %white
    255 165 0 %big spot
    0, 0, 255 %blue
    255, 0, 0%3
    ]/255;%5
map4 = [255, 255, 255 %white
    255 165 0 %big spot
    0, 0, 255 %blue
    255, 0, 0%3
    255, 0, 255%4
    ]/255;%5
%%

u1=Z1(:,3);
FSI1=scatteredInterpolant(x,y,u1);
F1=FSI1(xx,yy)>1.5;
H=figure('position',[0 0.1 1 2/3]);

s1=subplot(2,5,1)
pcolor(xx,yy,double(F1))
hold on
plot([min(x),max(x)],[min(y) min(y)],'k','linewidth',1)
plot([min(x),max(x)],[max(y) max(y)],'k','linewidth',1)
plot([min(x) min(x)],[min(y),max(y)],'k','linewidth',1)
plot([max(x) max(x)],[min(y),max(y)],'k','linewidth',1)

shading interp;axis equal;axis tight;axis off
colormap(s1,map1)
set(gca, 'YDir','reverse')
drawnow

s6=subplot(2,5,6)
% pcolor(xx,yy,double(F1))
hold on
plot([min(x),max(x)],[min(y) min(y)],'k','linewidth',1)
plot([min(x),max(x)],[max(y) max(y)],'k','linewidth',1)
plot([min(x) min(x)],[min(y),max(y)],'k','linewidth',1)
plot([max(x) max(x)],[min(y),max(y)],'k','linewidth',1)
shading interp;axis equal;axis tight;axis off
set(gca, 'YDir','reverse')
drawnow

%%
u2=Z2(:,3);
FSI2=scatteredInterpolant(x,y,u2);
F2=FSI2(xx,yy)>2.6;
s2=subplot(2,5,2)
pcolor(xx,yy,double(F1+2*F2))
hold on
plot([min(x),max(x)],[min(y) min(y)],'k','linewidth',1)
plot([min(x),max(x)],[max(y) max(y)],'k','linewidth',1)
plot([min(x) min(x)],[min(y),max(y)],'k','linewidth',1)
plot([max(x) max(x)],[min(y),max(y)],'k','linewidth',1)

shading interp;axis equal;axis tight;axis off
colormap(s2,map2)
set(gca, 'YDir','reverse')
drawnow

B1=FSI1(xx,yy)<1.5;
s7=subplot(2,5,7)
pcolor(xx,yy,double(B1))
hold on
plot([min(x),max(x)],[min(y) min(y)],'k','linewidth',1)
plot([min(x),max(x)],[max(y) max(y)],'k','linewidth',1)
plot([min(x) min(x)],[min(y),max(y)],'k','linewidth',1)
plot([max(x) max(x)],[min(y),max(y)],'k','linewidth',1)
shading interp;axis equal;axis tight;axis off
set(gca, 'YDir','reverse')
colormap(s7,'gray')
drawnow

%%
u3=Z3(:,3);
FSI3=scatteredInterpolant(x,y,u3);
F3=FSI3(xx,yy)>2.2;
s3=subplot(2,5,3)
pcolor(xx,yy,double(F1+2*F2+3*F3))
hold on
plot([min(x),max(x)],[min(y) min(y)],'k','linewidth',1)
plot([min(x),max(x)],[max(y) max(y)],'k','linewidth',1)
plot([min(x) min(x)],[min(y),max(y)],'k','linewidth',1)
plot([max(x) max(x)],[min(y),max(y)],'k','linewidth',1)

shading interp;axis equal;axis tight;axis off
colormap(s3,map3)
set(gca, 'YDir','reverse')
drawnow

B1=FSI1(xx,yy)<1.1;
B2=FSI2(xx,yy)<0.59;
s8=subplot(2,5,8)
pcolor(xx,yy,double(B2))
hold on
plot([min(x),max(x)],[min(y) min(y)],'k','linewidth',1)
plot([min(x),max(x)],[max(y) max(y)],'k','linewidth',1)
plot([min(x) min(x)],[min(y),max(y)],'k','linewidth',1)
plot([max(x) max(x)],[min(y),max(y)],'k','linewidth',1)
shading interp;axis equal;axis tight;axis off
set(gca, 'YDir','reverse')
colormap(s8,'gray')
drawnow

%%
u4=Z4(:,3);
FSI4=scatteredInterpolant(x,y,u4);
F4=FSI4(xx,yy)>2.4;
s4=subplot(2,5,4)
pcolor(xx,yy,double(F1+2*F2+3*F3+4*F4))
hold on
plot([min(x),max(x)],[min(y) min(y)],'k','linewidth',1)
plot([min(x),max(x)],[max(y) max(y)],'k','linewidth',1)
plot([min(x) min(x)],[min(y),max(y)],'k','linewidth',1)
plot([max(x) max(x)],[min(y),max(y)],'k','linewidth',1)

shading interp;axis equal;axis tight;axis off
colormap(s4,map4)
set(gca, 'YDir','reverse')
drawnow

% B1=FSI1(xx,yy)<1.5;
% B2=FSI2(xx,yy)<0.59;
B3=FSI3(xx,yy)<0.8;
s9=subplot(2,5,9)
pcolor(xx,yy,double(B3))
hold on
plot([min(x),max(x)],[min(y) min(y)],'k','linewidth',1)
plot([min(x),max(x)],[max(y) max(y)],'k','linewidth',1)
plot([min(x) min(x)],[min(y),max(y)],'k','linewidth',1)
plot([max(x) max(x)],[min(y),max(y)],'k','linewidth',1)
shading interp;axis equal;axis tight;axis off
set(gca, 'YDir','reverse')
colormap(s9,'gray')
drawnow


%%
u5=Z5(:,3);
FSI5=scatteredInterpolant(x,y,u5);
F5=FSI5(xx,yy)>2.55;
s5=subplot(2,5,5)
pcolor(xx,yy,double(F1+2*F2+3*F3+4*F4+5*F5))
hold on
plot([min(x),max(x)],[min(y) min(y)],'k','linewidth',1)
plot([min(x),max(x)],[max(y) max(y)],'k','linewidth',1)
plot([min(x) min(x)],[min(y),max(y)],'k','linewidth',1)
plot([max(x) max(x)],[min(y),max(y)],'k','linewidth',1)

shading interp;axis equal;axis tight;axis off
colormap(s5,map5)
set(gca, 'YDir','reverse')
drawnow

B1=FSI1(xx,yy)>0.8;
B2=FSI2(xx,yy)>0.9;
B3=FSI3(xx,yy)>0.9;
% B4=FSI4(xx,yy)<0.8;
% (u1(x,y)>0.8)*(u3(x,y)>0.9)*(u2(x,y)>0.9)
s10=subplot(2,5,10)
pcolor(xx,yy,double(B1.*B2.*B3))
hold on
plot([min(x),max(x)],[min(y) min(y)],'k','linewidth',1)
plot([min(x),max(x)],[max(y) max(y)],'k','linewidth',1)
plot([min(x) min(x)],[min(y),max(y)],'k','linewidth',1)
plot([max(x) max(x)],[min(y),max(y)],'k','linewidth',1)
shading interp;axis equal;axis tight;axis off
set(gca, 'YDir','reverse')
colormap(s10,'gray')
drawnow



export_fig('../Pictures/Coloured_sequential_images.png','-r300')
