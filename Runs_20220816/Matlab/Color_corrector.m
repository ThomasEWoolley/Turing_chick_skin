ccc


u=double((peaks>1));
u(u==0)=nan;

s1=surf(u);
shading interp
hold on
% hold on
% set(s1,'facecolor','r')
% spy(u,'sr')
% hold on
% %%
u=double(peaks>2);
u(u==0)=nan;

s2=surf(u*2);
shading interp
set(s1,'facecolor','r')
set(s2,'facecolor','g')
% spy(u,'sg')