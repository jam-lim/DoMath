tic

disp("boxsize,exittime,variance");
%prints in this order

%outer loop to loop through different boxsize
%in this case this loops through L=50 to L=1000 by 50 increment
for j=250
    
numberOfSteps = 10000;

%starting x y z position
x0 = 0;
y0 = 0;
z0 = 0;

d = 2; %dimension
L = j;
egg = [round(L/2),round(L/2),round(L/2)]; %position of the egg

if(d<2)
    egg(2) = 0;
    egg(3) = 0;
elseif(d<3)
    egg(3) = 0;
end

trial = 1000; % number of trials
success = zeros(1,trial);


hitEgg = -1;
dx = 0.5;
dt = dx^2; %since (dx)^2 ~ dt


x = zeros(1,numberOfSteps);
y = zeros(1,numberOfSteps);
z = zeros(1,numberOfSteps);

%to show the mean converge
conv = zeros(1,trial);
sum = 0;

%tic

rw = zeros(1,numberOfSteps);
loop = 0;


for i=1:trial
while(hitEgg==-1)
    
    rw = randi([1,2*d], 1, numberOfSteps); 
    [x,y,z] = executeRW(x,y,z,rw,x0,y0,z0,dx);
    hitEgg = checkIfHit(x,y,z,L,egg,numberOfSteps,d);
    x0 = mod(x(numberOfSteps),L);
    y0 = mod(y(numberOfSteps),L);
    z0 = mod(z(numberOfSteps),L);
    loop = loop + 1;
end

success(1,i) = (numberOfSteps*(loop-1)+hitEgg)*dt;
sum = sum + (numberOfSteps*(loop-1)+hitEgg)*dt;
conv(1,i) = sum/i;
loop = 0;
hitEgg = -1;
x0 = 0;
y0 = 0;
z0 = 0;
end

%toc

fprintf('%i,%f,%f\n',L,mean(success),var(success));

%---- comment this section if you don't want any graphs 

%plots histogram of exit time frequency
% figure
% histogram(success);
% title("box size="+L);
% xlabel("Exit Time");
% ylabel("Frequency");
% 
% %plots mean vs trial
% figure
% plot(conv);
% title("box size="+L);
% xlabel("trial");
% ylabel("mean");
% 
% drawnow;

%----

end

toc