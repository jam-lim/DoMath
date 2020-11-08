axis manual
axis([0,50,0,50]);

a=0:0.5:49.5;
b=0:0.5:49.5;
ax=axes;
set(ax,'xlim',[0 50],'ylim',[0 50]);
hold (ax)
quiver(a,b,cx1,cy1,"b");

% for jj=2:50:100
%     x=point(1,jj); y=point(2,jj);
% 
% figure(1)
% clf
% axis([0,50,0,50]);
% 
% 
% 
% 
% quiver(a,b,cx1,cy1,"b");
% hold on;
% plot(25,25,'r-o');
% % x=point(1,jj:jj+50);y=point(2,jj:jj+50);
% % comet(ax,x,y); 
% plot(x,y,'*');
% hold off
% 
% [im{jj},map] = frame2im(getframe);
% end
% [temp,map]=rgb2ind(im{1},65536);
% for jj=1:jjend
%     gifim(:,:,1,jj)=rgb2ind(im{jj},map);
% end
% imwrite(gifim,map,'bm.gif');