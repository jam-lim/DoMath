tic
disp("boxsize,exittime,variance");
    
numberOfSteps = 10000;


d = 2; %dimension
diffusion = 1/(2*d);

for j=100
%starting position
initial =  zeros(1,d);

L = j;
egg = [round(L/2),round(L/2)]; %position of the egg
trial = 2500; % number of trials
success = zeros(1,trial);
hitEgg = -1;
dt = 0.09; % using dx = 0.5
delta = 1;

rw = zeros(2, numberOfSteps); 
point = zeros(2,numberOfSteps);
original = zeros(2,numberOfSteps);



%to show the mean converge
conv = zeros(1,trial);
sum = 0;

%tic

across = zeros(4,trial);
asuccess = 1;
loop = 0;


for i=1:trial
 while(hitEgg==-1)
    
rw(1,:) = sqrt(dt)*randn(1,10000);
rw(2,:) = 360*rand(1,10000);
point(1,:) = initial(1) + cumsum(cosd(rw(2,:)).*rw(1,:));
original(1,:) = point(1,:);
point(1,:)= point(1,:)-floor(point(1,:)/L)*L;
point(2,:) = initial(2) + cumsum(sind(rw(2,:)).*rw(1,:));
original(2,:) = point(2,:);
point(2,:)= point(2,:)-floor(point(2,:)/L)*L;
%hitEgg = BMcheckIfHit(point,original,egg,delta,numberOfSteps,L,d,initial);
[hitEgg,x,x1,y1,x2,y2] = BMcheckIfHitAcross(point,original,egg,delta,numberOfSteps,L,d,initial);
if(x)
    across(1,asuccess)=x1;
    across(2,asuccess)=y1;
    across(3,asuccess)=x2;
    across(4,asuccess)=y2;
    asuccess=asuccess+1;
end
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
fprintf('%i,%f,%f\n',L,mean(success),var(success));
%plot(conv);
end
toc