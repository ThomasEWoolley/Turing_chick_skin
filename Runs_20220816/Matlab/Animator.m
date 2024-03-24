ccc

Z=load('Ming_pattern.txt','-ascii');
%%
filename='Spots_test.gif';
if exist(filename, 'file')==2
    delete(filename);
end

x=Z(:,1);
y=Z(:,2);
[xx,yy]=meshgrid(linspace(0,max(x)),linspace(0,max(y)));

map = [255, 255, 255 %white
    231, 166, 50 %big spot
    30, 80, 215 %blue
    39, 198, 24]/255;%small spot

close all
for i=1:400%(length(Z(1,3:end))-5)/3
    u1=Z(:,i*3);
    u2=Z(:,i*3+1);
    u3=Z(:,i*3+2);
    
    F=scatteredInterpolant(x,y,u1);
    F1=F(xx,yy)>2.5;
    F=scatteredInterpolant(x,y,u2);
    F2=F(xx,yy)>2.5;
    F=scatteredInterpolant(x,y,u3);
    F3=F(xx,yy)>2.5;
    
    FF=F1+2*F2+3*F3;
    
    pcolor(xx,yy,FF)
%     colormap('gray')
    colormap(map)
    caxis([0 3])
%     colorbar
    % hold on
    % pcolor(xx+max(x),yy,FF)
    % pcolor(xx+max(x)*2,yy,FF)
    
    % pcolor(xx,yy+max(yy),FF)
    % pcolor(xx+max(x),yy+max(yy),FF)
    % pcolor(xx+max(x)*2,yy+max(yy),FF)
    %
    % pcolor(xx,yy+2*max(yy),FF)
    % pcolor(xx+max(x),yy+2*max(yy),FF)
    % pcolor(xx+max(x)*2,yy+2*max(yy),FF)
    title(['t=',num2str((i-1)*10)])
    axis equal
    axis tight
    shading interp
    axis off
    drawnow
    frame = getframe(1);    im = frame2im(frame);    [imind,cm] = rgb2ind(im,256);
    if i == 1;
        imwrite(imind,cm,filename,'gif','Delaytime',0.1, 'Loopcount',inf);
        for j=1:10
            imwrite(imind,cm,filename,'gif','Delaytime',0.1,'WriteMode','append');
        end
    else
        imwrite(imind,cm,filename,'gif','Delaytime',0.1,'WriteMode','append');
    end
    
end
for i=1:10
    imwrite(imind,cm,filename,'gif','Delaytime',0.1,'WriteMode','append');
end
close

% export_fig('Tiled.png')
