ccc
filename='No_2.gif';
if exist(filename, 'file')==2
    delete(filename);
end

Z1=load('..\U1_bc_all.txt','-ascii');
Z3=load('..\U3_bc_no_2_all.txt','-ascii');
Z4=load('..\U4_bc_no_2_all.txt','-ascii');
Z5=load('..\U5_bc_no_2_all.txt','-ascii');

x=Z1(:,1);
y=Z1(:,2);
m=2e2;
[xx,yy]=meshgrid(linspace(min(x),max(x),m),linspace(min(y),max(y),m*25/15));

map = [255, 255, 255 %white
    0 255 0 %big spot
    0, 0, 255 %blue
    255, 0, 0%3
    255, 0, 255%4
    255, 255, 0]/255;%5

[m,n]=size(Z1);
for i=3:2:n
    u1=Z1(:,i);

    F=scatteredInterpolant(x,y,u1);
    F1=F(xx,yy)>1.5;
    F1=double(F1);
    F1(F1==0)=nan;
    H=plotter(xx,yy,F1,x,y,map,i);
    set(H,'facecolor','g')
    drawnow
    hold off
    frame = getframe(1);    im = frame2im(frame);    [imind,cm] = rgb2ind(im,256);
    if i == 3;
        imwrite(imind,cm,filename,'gif','Delaytime',0.1, 'Loopcount',inf);
    end
    capture(filename)
end

% [m,n]=size(Z2);
% for i=3:2:n
%     u2=Z2(:,i);
% 
%     F=scatteredInterpolant(x,y,u2);
%     F2=F(xx,yy)>2.6;
%     F2=double(F2);
%     F2(F2==0)=nan;
%     H1=plotter(xx,yy,F1,x,y,map,i);
%     hold on
%     H2=plotter(xx,yy,F2,x,y,map,i);
%     set(H1,'facecolor','g')
%     set(H2,'facecolor','b')
%     drawnow
%     hold off
%     capture(filename)
% end

[m,n]=size(Z3);
for i=10:2:n
    u3=Z3(:,i);

    F=scatteredInterpolant(x,y,u3);
    F3=F(xx,yy)>2.2;
    F3=double(F3);
    F3(F3==0)=nan;

    H1=plotter(xx,yy,F1,x,y,map,i);
    hold on
%     H2=plotter(xx,yy,F2,x,y,map,i);
    H3=plotter(xx,yy,F3,x,y,map,i);
    set(H1,'facecolor','g')
%     set(H2,'facecolor','b')
    set(H3,'facecolor','r')
    drawnow
    hold off
    capture(filename)
end


[m,n]=size(Z4);
for i=20:2:n
    u4=Z4(:,i);

    F=scatteredInterpolant(x,y,u4);
    F4=F(xx,yy)>2.4;
    F4=double(F4);
    F4(F4==0)=nan;

    H1=plotter(xx,yy,F1,x,y,map,i);
    hold on
%     H2=plotter(xx,yy,F2,x,y,map,i);
    H3=plotter(xx,yy,F3,x,y,map,i);
    H4=plotter(xx,yy,F4,x,y,map,i);
    set(H1,'facecolor','g')
%     set(H2,'facecolor','b')
    set(H3,'facecolor','r')
    set(H4,'facecolor',[1 0 1])
    drawnow
    hold off
    capture(filename)
end

[m,n]=size(Z5);
for i=3:2:n
    u5=Z5(:,i);

    F=scatteredInterpolant(x,y,u5);
    F5=F(xx,yy)>2.55;
    F5=double(F5);
    F5(F5==0)=nan;

    H1=plotter(xx,yy,F1,x,y,map,i);
    hold on
%     H2=plotter(xx,yy,F2,x,y,map,i);
    H3=plotter(xx,yy,F3,x,y,map,i);
    H4=plotter(xx,yy,F4,x,y,map,i);
    H5=plotter(xx,yy,F5,x,y,map,i);
    set(H1,'facecolor','g')
%     set(H2,'facecolor','b')
    set(H3,'facecolor','r')
    set(H4,'facecolor',[1 0 1])
    set(H5,'facecolor',[1 1 0])
    drawnow
    hold off
    capture(filename)
end

for i=1:10
    imwrite(imind,cm,filename,'gif','Delaytime',0.1,'WriteMode','append');
end
close


function H=plotter(xx,yy,FF,x,y,map,i)

H=surf(xx,yy,FF);
% H=gcf;
hold on
plot([min(x),max(x)],[min(y) min(y)],'k','linewidth',1)
plot([min(x),max(x)],[max(y) max(y)],'k','linewidth',1)
plot([min(x) min(x)],[min(y),max(y)],'k','linewidth',1)
plot([max(x) max(x)],[min(y),max(y)],'k','linewidth',1)

shading interp;axis equal;axis tight;axis off
% colormap(H,map)
view(2)
set(gca, 'YDir','reverse')
% title(num2str(i))
end

function capture(filename)
frame = getframe(1);    im = frame2im(frame);    [imind,cm] = rgb2ind(im,256);

imwrite(imind,cm,filename,'gif','Delaytime',0.1,'WriteMode','append');

end
