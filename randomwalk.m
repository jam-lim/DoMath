r=[0 0]; % starting position
L=1000; % size of the box
egg=[round(L/2),round(L/2)]; %position of the egg
trial=100; % number of trials
success=zeros(1,trial);
dx=1;
dt=dx^2; %since (dx)^2 ~ dt
tic
for t= 1:1:trial
    r=[0 0];
    exitTime=0;
    while ~isequal(r,egg)
    B1=rand(1,2);
    B=B1> [0.5 0.5]; 
if B==1 
    rnew=r+[dx 0] ; 
elseif B(1)==1 
rnew=r+[0 dx]; 
elseif B(2)==1 
    rnew=r+[-dx 0];
else
    rnew=r+[0 -dx];
end


%gif stuff - kinda broken
% h = figure('visible','off');
% axis tight manual % this ensures that getframe() returns a consistent size
% filename = 'testAnimated.gif';

%uncomment to see the animation 
%if(abs(r(1)-rnew(1))<L & abs(r(2)-rnew(2))<L)
%    plot([r(1) rnew(1)], [r(2) rnew(2)]);
% end
% %plot(rnew(1),rnew(2),'o');
% hold on
% plot(egg(1),egg(2),'+');
% hold off
% xlim([0 L])
% ylim([0 L])
% drawnow ;

%gif stuff
% frame = getframe(h); 
%       im = frame2im(frame); 
%       [imind,cm] = rgb2ind(im,256);
% if exitTime==0
%      imwrite(imind,cm,filename,'gif','DelayTime',0, 'Loopcount',inf); 
% else
%     imwrite(imind,cm,filename,'gif','WriteMode','append'); 
% end

rnew(1)=mod(rnew(1),L);  %to simulate torus
rnew(2)=mod(rnew(2),L); 
r=rnew;
    exitTime = exitTime+dt;
    end
    success(1,t)=exitTime;
    disp(t);
end
toc
disp(var(success)+newline);
disp(mean(success));
histogram(success);
xlabel("exit time");
ylabel("frequency");
annotation('textbox',[.65 .5 .3 .3],'String',"trial="+trial+newline+"mean="+mean(success),'FitBoxToText','on');