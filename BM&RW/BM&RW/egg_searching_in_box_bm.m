function [avg_hit_time_bm,var_hit_time_bm]=egg_searching_in_box_bm(dt,m,n,d,x0,L,egg_loc,egg_size,total_run)
%dt=0.01;
%m=2; %dimension
%n=10000; %number of steps
%d=1; %diffusion coeffcients for brownian motion
t=n*dt; %total time
%step_size=0.1; %step size for random walk
%x0=[0;0]; %initil location
%L=10; %size of the box
%egg_loc=[L/2;L/2]; %location of the egg
%egg_size=0.05; %size of the egg
%total_run=500;

hit_time_bm_list=zeros(1,total_run);
%The egg is 0.5mm=0.05cm in radius and the size of the box is 10cm=0.1m.

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
        hit_loc_bm=hit_loc_bm+counter_bm*(n-1);
        hit_time_bm_list(i)=hit_loc_bm;
    end
    avg_hit_time_bm=sum(hit_time_bm_list*dt)/total_run;
    var_hit_time_bm=var(hit_time_bm_list*dt);
    return
end