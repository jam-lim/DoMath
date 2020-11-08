%This is a sample run for Brownian motion and Random walk in 2D: 
%parameters needed:
dt=0.01;
m=2; %dimension
n=10000; %number of steps
d=1/4; %diffusion coeffcients for brownian motion
t=n*dt; %total time
step_size=0.1; %step size for random walk
x0=[0;0]; %initil location
L=100; %size of the box
egg_loc=[L/2;L/2]; %location of the egg
egg_size=0.05; %size of the egg
total_run=1000;
hit_time_bm_list=zeros(0,total_run);
hit_time_rw_list=zeros(0,total_run);
%The egg is 0.5mm=0.05cm in radius and the size of the box is 100cm=1m.

%It is inefficient to store all the the data if no hit has occurred. so we
%keep n=10000 and the last location only to run a few times.
%%
%X_bm and X_rw stores the locations of the brownian motion and random walk
%respectively.
for i=1:total_run
    counter_bm=0;
    hit_loc_bm=-1;
    x0_bm=x0;
    while (hit_loc_bm==-1)
        X_bm=brownian_motion_simulation(x0_bm,m,n,d,t);
        X_bm_bdy=add_boundary(X_bm,L);
        hit_loc_bm=check_hit(X_bm_bdy,egg_loc,egg_size);
        x0_bm=X_bm_bdy(:,end);
        counter_bm=counter_bm+1;
    end
    hit_loc_bm=hit_loc_bm+counter_bm*n;
    
    counter_rw=0;
    hit_loc_rw=-1;
    x0_rw=x0;
    while (hit_loc_rw==-1)
        X_rw=random_walk_simulation(x0_rw,m,n,step_size,t);
        X_rw_bdy=add_boundary(X_rw,L);
        hit_loc_rw=check_hit(X_rw_bdy,egg_loc,egg_size);
        x0_rw=X_rw_bdy(:,end);
        counter_rw=counter_rw+1;
    end
    hit_loc_rw=hit_loc_rw+counter_rw*n;
    hit_time_rw_list(i)=hit_loc_rw;
    hit_time_bm_list(i)=hit_loc_bm;
end
avg_hit_time_rw=sum(hit_time_rw_list*dt)/total_run;
avg_hit_time_bm=sum(hit_time_bm_list*dt)/total_run;
var_hit_time_rw=var(hit_time_rw_list*dt);
var_hit_time_bm=var(hit_time_bm_list*dt);
%only plot the last run. 
%%
figure (1)
brownian_motion_display ( m, n, X_bm , "Brownian motion",egg_loc,egg_size)
%%
%figure (2)
%rownian_motion_display ( m, n, X_bm_bdy, "Brownian motion" ,egg_loc,egg_size)
%%
figure (3)
brownian_motion_display_with_bdy ( m, n, X_bm_bdy ,"Brownian motion",egg_loc,egg_size)
%%
figure (4)
brownian_motion_display ( m, n, X_rw ,"Random Walk",egg_loc,egg_size)
%%
%figure (5)
%brownian_motion_display ( m, n, X_rw_bdy , "Random Walk",egg_loc,egg_size)
%%
figure (6)
brownian_motion_display_with_bdy ( m, n, X_rw_bdy ,"Random Walk",egg_loc,egg_size)
%%
figure (7)
histogram(hit_time_rw_list*dt)
hold on
histogram(hit_time_bm_list*dt)
hold off
xlabel('Hitting Time')
ylabel('Count')
title('Histogram of Hitting time')
legend('Random Walk','Brownian Motion')