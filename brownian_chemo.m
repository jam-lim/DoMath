tic
disp("shear,boxsize,exittime,variance,cutoff");

chi = 100;
chemosize = 0.5;
numberOfSteps = 250000;
trial = 50; % number of trials
dt = 0.09; % maybe change dt to 0.01
d = 2; %dimension
diffusion = 1/(2*d);
shearCutoff = -1; %put negative cutoff for no cutoff
delta = 1;
A=0; % A is the shear coefficient

for k=[300] % change chi here
    chi = k;   
for j=[30] %put the boxsize u want
%starting position
initial =  zeros(1,d);

L = j;
TEST;
[cx,cy] = gradient(c);
cx(abs(cx)<1e-05)=0;
cy(abs(cy)<1e-05)=0;
% cx=cx*0;
% cy=cy*0;
dr1=sqrt(cx.^2+cy.^2);
dr2=phi(dr1);
dr1(dr1==0)=1;
ratio=dr2./dr1;
cx1=cx.*ratio;
cy1=cy.*ratio;
% x=0:0.5:29.5;
% y=0:0.5:29.5;
% figure(1)
% quiver(x,y,cx,cy,"r");
% hold on
% quiver(x,y,cx1,cy1,"b");
% hold off

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
    
rw(1,:) = sqrt(2*d*diffusion*dt)*randn(1,numberOfSteps);
rw(2,:) = 360*rand(1,numberOfSteps);
point = executeChemo(initial,rw,L,A,numberOfSteps,dt,shearCutoff,c,chemosize,chi);

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
fprintf('%i,%i,%f,%f,%i\n',chi,L,mean(success),var(success),shearCutoff);
%plot(conv);
end
end
toc