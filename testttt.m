x=point(1,1); y=point(2,1);
plot(x,y,'o'); axis([0,50,0,50]);
h = figure('visible','off');
filename = 'testAnimated.gif';
im={}; jj=1;
[im{jj},map] = frame2im(getframe);
jjend=239632;
a=0:0.5:49.5;
b=0:0.5:49.5;


for jj=2:50:jjend

    clf
    x=point(1,jj); y=point(2,jj);
    plot(x,y,"*"); axis([0,50,0,50]); 
    hold on
    plot(25,25,'r-o');
    
    hold off
    frame = getframe(h); 
       im = frame2im(frame); 
       [imind,cm] = rgb2ind(im,256);
       if(jj==2)
           imwrite(imind,cm,filename,'gif','DelayTime',0, 'Loopcount',inf);
       else
       imwrite(imind,cm,filename,'gif','WriteMode','append'); 
       end
end

% [temp,map] = rgb2ind(im{1},65536);
% for i=1:49
%     gifim(:,:,1,frame) = rgb2ind(im{frame},map);
% end
% imwrite(gifim,map,'new.gif');