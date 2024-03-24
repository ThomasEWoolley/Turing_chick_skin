ccc

figure('position',[0 0.1 2/3 2/3])

Z1=load('..\u1.txt','-ascii');
Z2=load('..\u2.txt','-ascii');
Z3=load('..\u3.txt','-ascii');
Z4=load('..\u4.txt','-ascii');
Z5=load('..\u5.txt','-ascii');

x=Z1(:,1);
y=Z1(:,2);
m=1e3;
[xx,yy]=meshgrid(linspace(min(x),max(x),m),linspace(min(y),max(y),m*25/15));
map1 = [255, 255, 255 %white
    231, 166, 50]/255;%Big spot

map2 = [255, 255, 255 %white
    231, 166, 50 %big spot
    30, 80, 215]/255;%blue

map3 = [255, 255, 255 %white
    231, 166, 50 %big spot
    30, 80, 215 %blue
    39, 198, 24]/255;%small spot



s1=subplot(2,5,1);

hold on
plot([min(x),max(x)],[min(y) min(y)],'k','linewidth',1)
plot([min(x),max(x)],[max(y) max(y)],'k','linewidth',1)
plot([min(x) min(x)],[min(y),max(y)],'k','linewidth',1)
plot([max(x) max(x)],[min(y),max(y)],'k','linewidth',1)
shading interp;axis equal;axis tight;axis off;box on

s6=subplot(2,5,6);
u1=Z1(:,3);
Fs1=scatteredInterpolant(x,y,u1);
F1=Fs1(xx,yy)>1.5;
FF=F1;
pcolor(xx,yy,double(FF))
hold on
plot([min(x),max(x)],[min(y) min(y)],'k','linewidth',1)
plot([min(x),max(x)],[max(y) max(y)],'k','linewidth',1)
plot([min(x) min(x)],[min(y),max(y)],'k','linewidth',1)
plot([max(x) max(x)],[min(y),max(y)],'k','linewidth',1)
shading interp;axis equal;axis tight;axis off
colormap(s6,map1)



s2=subplot(2,5,2);
F1=Fs1(xx,yy)<1.5;
pcolor(xx,yy,double(F1))
shading interp;axis equal;axis tight;axis off;box on
colormap(s2,'gray')
hold on
plot([min(x),max(x)],[min(y) min(y)],'k','linewidth',1)
plot([min(x),max(x)],[max(y) max(y)],'k','linewidth',1)
plot([min(x) min(x)],[min(y),max(y)],'k','linewidth',1)
plot([max(x) max(x)],[min(y),max(y)],'k','linewidth',1)

s7=subplot(2,5,7);
u2=Z2(:,3);
Fs2=scatteredInterpolant(x,y,u2);
F2=Fs2(xx,yy)>2.6;
FF=FF+2*F2;
pcolor(xx,yy,double(FF))
hold on
plot([min(x),max(x)],[min(y) min(y)],'k','linewidth',1)
plot([min(x),max(x)],[max(y) max(y)],'k','linewidth',1)
plot([min(x) min(x)],[min(y),max(y)],'k','linewidth',1)
plot([max(x) max(x)],[min(y),max(y)],'k','linewidth',1)
shading interp;axis equal;axis tight;axis off
colormap(s7,map2)


s3=subplot(2,5,3);
F2=Fs2(xx,yy)<0.59;
pcolor(xx,yy,double(F2))
shading interp;axis equal;axis tight;axis off;box on
colormap(s3,'gray')
hold on
plot([min(x),max(x)],[min(y) min(y)],'k','linewidth',1)
plot([min(x),max(x)],[max(y) max(y)],'k','linewidth',1)
plot([min(x) min(x)],[min(y),max(y)],'k','linewidth',1)
plot([max(x) max(x)],[min(y),max(y)],'k','linewidth',1)

s8=subplot(2,5,8);
u3=Z3(:,3);
Fs3=scatteredInterpolant(x,y,u3);
F3=Fs3(xx,yy)>2.2;
FF=FF+3*F3;
pcolor(xx,yy,double(FF))
hold on
plot([min(x),max(x)],[min(y) min(y)],'k','linewidth',1)
plot([min(x),max(x)],[max(y) max(y)],'k','linewidth',1)
plot([min(x) min(x)],[min(y),max(y)],'k','linewidth',1)
plot([max(x) max(x)],[min(y),max(y)],'k','linewidth',1)
shading interp;axis equal;axis tight;axis off
colormap(s8,map3)

s4=subplot(2,5,4);
F3=Fs3(xx,yy)<1.05;
pcolor(xx,yy,double(F3))
shading interp;axis equal;axis tight;axis off;box on
colormap(s4,'gray')
hold on
plot([min(x),max(x)],[min(y) min(y)],'k','linewidth',1)
plot([min(x),max(x)],[max(y) max(y)],'k','linewidth',1)
plot([min(x) min(x)],[min(y),max(y)],'k','linewidth',1)
plot([max(x) max(x)],[min(y),max(y)],'k','linewidth',1)

s9=subplot(2,5,9);
u4=Z4(:,3);
Fs4=scatteredInterpolant(x,y,u4);
F4=Fs4(xx,yy)>2.4;
FF=FF+3*F4;
pcolor(xx,yy,double(FF))
hold on
plot([min(x),max(x)],[min(y) min(y)],'k','linewidth',1)
plot([min(x),max(x)],[max(y) max(y)],'k','linewidth',1)
plot([min(x) min(x)],[min(y),max(y)],'k','linewidth',1)
plot([max(x) max(x)],[min(y),max(y)],'k','linewidth',1)
shading interp;axis equal;axis tight;axis off
colormap(s9,map3)

s4=subplot(2,5,5);
F4=(Fs1(xx,yy)<1.1).*(Fs1(xx,yy)>0.67).*(Fs3(xx,yy)>1.2).*(Fs3(xx,yy)<1.5);
pcolor(xx,yy,double(F4))
shading interp;axis equal;axis tight;axis off;box on
colormap(s4,'gray')
hold on
plot([min(x),max(x)],[min(y) min(y)],'k','linewidth',1)
plot([min(x),max(x)],[max(y) max(y)],'k','linewidth',1)
plot([min(x) min(x)],[min(y),max(y)],'k','linewidth',1)
plot([max(x) max(x)],[min(y),max(y)],'k','linewidth',1)

s10=subplot(2,5,10);
u5=Z5(:,3);
Fs5=scatteredInterpolant(x,y,u5);
F5=Fs5(xx,yy)>2;
FF=FF+3*F5;
pcolor(xx,yy,double(FF))
hold on
plot([min(x),max(x)],[min(y) min(y)],'k','linewidth',1)
plot([min(x),max(x)],[max(y) max(y)],'k','linewidth',1)
plot([min(x) min(x)],[min(y),max(y)],'k','linewidth',1)
plot([max(x) max(x)],[min(y),max(y)],'k','linewidth',1)
shading interp;axis equal;axis tight;axis off
colormap(s10,map3)

export_fig('./Pictures/Gaps_and_spots.png','-r300')