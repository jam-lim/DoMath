dt=0.09;
tic
m=2; %dimension
n=10000; %number of steps
d=1/(2*m); %diffusion coeffcients for brownian motion
t=n*dt; %total time
step_size=0.1; %step size for random walk
x0=[0;0]; %initil location
L=50; %size of the box
egg_loc=[L/2;L/2]; %location of the egg
egg_size=1; %size of the egg
total_run=1000;
Amp=200;
shear_cutoff=10;
chemo_cutoff=10;
h=0.5;
chi=100;
%
%shear_cutoff_list=10:10:200;
%avg_hit_time_chemo_list=zeros(1,size(shear_cutoff_list,2));
%%
%for i=1:size(shear_cutoff_list,2)

c=chemoattrant(L,h,Amp,shear_cutoff,egg_size);
for i =[0,1,2,3,4,5,6,7,8,9,10]
    chi =i;
success =egg_searching_in_box_chemo(dt,m,n,d,x0,L,h,c,chi,shear_cutoff,chemo_cutoff,Amp,egg_loc,egg_size,total_run);
fprintf("%i,%f,%f\n",chi,mean(success),var(success));
end
%avg_hit_time_chemo_list(i)=avg_hit_time_chemo;
%end
%%
Amp=0;
% c=chemoattrant(L,h,Amp,shear_cutoff,egg_size);
% [avg_hit_time_no_shear,var_hit_time_no_shear]=egg_searching_in_box_chemo(dt,m,n,d,x0,L,h,C,chi,shear_cutoff,chemo_cutoff,Amp,egg_loc,egg_size,total_run)
%%

% [avg_hit_time_bm,var_hit_time_bm]=egg_searching_in_box_bm(dt,m,n,d,x0,L,egg_loc,egg_size,total_run)
toc 