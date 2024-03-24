clc
close all

BW=FF(2:end-1,2:end-1);
imshow(FF)
CC = bwconncomp(FF(2:end-1,2:end-1));
BW(CC.PixelIdxList{1}) = 0;
BW(CC.PixelIdxList{3}) = 0;
BW(CC.PixelIdxList{4}) = 0;
BW(CC.PixelIdxList{7}) = 0;
BW(CC.PixelIdxList{9}) = 0;
BW(CC.PixelIdxList{12}) = 0;
BW(CC.PixelIdxList{13}) = 0;
BW(CC.PixelIdxList{15}) = 0;
BW(CC.PixelIdxList{16}) = 0;
BW(CC.PixelIdxList{19}) = 0;

BW=logical(BW);
% s = regionprops(BW,'centroid');
% centroids = cat(1, s.Centroid);


R=regionprops(BW,'Centroid','MajorAxisLength','MinorAxisLength','EquivDiameter')
centroids = cat(1, R.Centroid);
imshow(BW)
hold on
% for i=1:length(centroids)
% text(centroids(i,1),centroids(i,2), num2str(i),'fontsize',20)
% end
text(centroids(4,1),centroids(4,2), 'Bud','fontsize',20)

text(centroids(1,1),centroids(1,2), '1','fontsize',20)
text(centroids(5,1),centroids(5,2), '1','fontsize',20)
text(centroids(9,1),centroids(9,2), '1','fontsize',20)

text(centroids(6,1),centroids(6,2), '2','fontsize',20)

text(centroids(2,1),centroids(2,2), '3','fontsize',20)
text(centroids(8,1),centroids(8,2), '3','fontsize',20)

text(centroids(3,1)-10,centroids(3,2), '4','fontsize',20)
text(centroids(7,1)-10,centroids(7,2), '4','fontsize',20)

M=max([R(:).MinorAxisLength]);
V1=round([[R(:).MajorAxisLength]',[R(:).MinorAxisLength]',[R(:).EquivDiameter]']/M*1000);
Centroid_distance1=sqrt((centroids(1,2)-centroids(4,2)).^2+(centroids(4,1)).^2)
Centoird_inverse=(25/15*1e3-(centroids(5,2)-centroids(4,2)))/Centroid_distance1
Centroid_distance2=sqrt((centroids(5,2)-centroids(4,2)).^2+(centroids(4,1)-centroids(5,1)).^2)/Centroid_distance1
Centroid_distance3=sqrt((centroids(9,2)-centroids(4,2)).^2+(centroids(4,1)).^2)/Centroid_distance1


Centroid_distance4=sqrt((centroids(2,2)-centroids(6,2)).^2+(centroids(6,1)-centroids(2,1)).^2)/M*1000
Centroid_distance5=sqrt((centroids(8,2)-centroids(6,2)).^2+(centroids(6,1)-centroids(8,1)).^2)/M*1000


(25/15*1e3-(centroids(5,2)-centroids(4,2)))/Centroid_distance1
% Centroid_distance2=sqrt((centroids(1,2)-centroids(7,2)).^2+(centroids(1,1)-centroids(7,1)).^2)/M*1000
% 
V1([4,5,6,2,8,3,7],:)
% 
% 
