function [avg_hit_time_rw,var_hit_time_rw]=egg_searching_in_box_rw(dt,m,n,step_size,x0,L,egg_loc,egg_size,total_run)
%dt=0.01;
%m=2; %dimension
%n=10000; %number of steps
%d=1/4; %diffusion coeffcients for brownian motion
t=n*dt; %total time
%step_size=0.1; %step size for random walk
%x0=[0;0]; %initil location
%L=10; %size of the box
%egg_loc=[L/2;L/2]; %location of the egg
%egg_size=0.05; %size of the egg
%total_run=100;

hit_time_rw_list=zeros(0,total_run);
%The egg is 0.5mm=0.05cm in radius and the size of the box is 10cm=0.1m.

%It is inefficient to store all the the data if no hit has occurred. so we
%keep n=10000 and the last location only to run a few times.
%%
%X_bm and X_rw stores the locations of the brownian motion and random walk
%respectively.
    for i=1:total_run
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
    end

    avg_hit_time_rw=sum(hit_time_rw_list*dt)/total_run;
    var_hit_time_rw=var(hit_time_rw_list*dt);
    return
end