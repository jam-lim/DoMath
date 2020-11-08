%This is a sample run for Brownian motion and Random walk in 2D: 
%parameters needed:
dt=0.01;
m=2; %dimension
n=10000; %number of steps
d=1/4; %diffusion coeffcients for brownian motion
t=n*dt; %total time
step_size=0.1; %step size for random walk
x0=[0;0]; %initil location
L_num=10;
L= linspace(10,100,L_num); %size of the box
total_run=100;
egg_loc=[L(1)/2;L(1)/2]; %location of the egg
egg_size=0.05; %size of the egg
avg_hit_time_bm_list=zeros(1,L_num);
var_hit_time_bm_list=zeros(1,L_num);
for i=1:L_num
    [avg_hit_time_bm,var_hit_time_bm]=egg_searching_in_box_bm(dt,m,n,d,x0,L(i),egg_loc,egg_size,total_run);
    avg_hit_time_bm_list(i)=avg_hit_time_bm;
    var_hit_time_bm_list(i)=var_hit_time_bm;
end
%%
scatter(L,avg_hit_time_bm_list*dt)
xlabel('Box size L')
ylabel('Hitting time')