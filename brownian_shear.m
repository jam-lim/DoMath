tic
disp("shear,boxsize,exittime,variance,cutoff");

numberOfSteps = 10000;
trial = 1000; % number of trials
dt = 0.09; % maybe change dt to 0.01
d = 2; %dimension
diffusion = 1/(2*d);
shearCutoff = 0; %put negative cutoff for no cutoff
delta = 1;
A=0; % A is the shear coefficient
for k=[0] % chooose the shear coefficient here
    A = k;   
for j=[40] %put the boxsize u want
%starting position
initial =  [0,0,0];

L = j;
egg = [round(L/2),round(L/2)]; %position of the egg

success = zeros(1,trial);
hitEgg = -1;



rw = zeros(2, numberOfSteps); 
point = zeros(2,numberOfSteps);
original = zeros(2,numberOfSteps);





%to show the mean converge
conv = zeros(1,trial);
sum = 0;

%tic


loop = 0;

across = zeros(4,trial);
asuccess = 1;
for i=1:trial
 while(hitEgg==-1)
    
rw(1,:) = sqrt(2*d*diffusion*dt)*randn(1,10000);
rw(2,:) = 360*rand(1,10000);
point(2,:) = initial(2) + cumsum(sind(rw(2,:)).*rw(1,:));
original(2,:) = point(2,:);
point(2,:)= point(2,:)-floor(point(2,:)/L)*L;

original(1,:) = executeShear(initial,rw,point,L,A,numberOfSteps,dt,shearCutoff);
point(1,:) = original(1,:)-floor(original(1,:)/L)*L;

% use this line for without across condition
 hitEgg = BMcheckIfHit(point,original,egg,delta,numberOfSteps,L,d,initial);

% use this line for with across condition
% [hitEgg,x,x1,y1,x2,y2] = BMcheckIfHitAcross(point,original,egg,delta,numberOfSteps,L,d,initial);
% if(x)
%     across(1,asuccess)=x1;
%     across(2,asuccess)=y1;
%     across(3,asuccess)=x2;
%     across(4,asuccess)=y2;
%     asuccess=asuccess+1;
% end

initial = mod(point(:,numberOfSteps),L);
loop = loop + 1; 
 end
success(1,i) = (numberOfSteps*(loop-1)+hitEgg)*dt;
sum = sum + (numberOfSteps*(loop-1)+hitEgg)*dt;
conv(1,i) = sum/i;
loop = 0;
hitEgg = -1;
initial = [0 0 0];
end
fprintf('%i,%i,%f,%f,%i\n',A,L,mean(success),var(success),shearCutoff);
%plot(conv);
end
end
toc