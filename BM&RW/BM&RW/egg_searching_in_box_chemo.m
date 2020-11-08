function [hit_time]=egg_searching_in_box_chemo(dt,m,n,d,x0,L,h,c,chi,Amp,shear_cutoff,chemo_cutoff,egg_loc,egg_size,total_run)
% dt=0.01;
% m=2; %dimension
% n=10000; %number of steps
% d=1/(2*m); %diffusion coeffcients for brownian motion
t=n*dt; %total time
% step_size=0.1; %step size for random walk
 %x0=[24;24]; %initil location
% L=50; %size of the box
% egg_loc=[L/2;L/2]; %location of the egg
% egg_size=1; %size of the egg
%total_run=10;
current_x=x0;
%%
%Amp=20;


%%
%h=0.2;
%c=chemoattrant(L,h,Amp,egg_size);
% vec_x=[0:0.2:49.8];
% vec_y=[0:0.2:49.8];
% [cx,cy]=gradient(c,vec_x,vec_y);
% quiver(vec_x,vec_y,cx,cy)
%%
%traj=[current_x];
%hit_loc=-1;
%chi=20;
%hit=0;
hit_time_chemo_list=zeros(1,total_run);

for k=1:total_run
    hit_loc=-1;
    hit=0;
    counter_chemo=0;
    while (hit_loc==-1)
        dx=brownian_motion_steps(current_x,m,n,d,t);
        for i=1:n-1
            hit=0;
            [cx1,cy1]=find_gradient(c,L,h,current_x);
            prev_x=current_x;
            
            shear=Amp*sin(2*pi*current_x(2)/L);
            shear(shear>shear_cutoff)=shear_cutoff;
            shear(shear<-shear_cutoff)=-shear_cutoff;
            chemo=norm(cx1,cy1)*chi;
%             chemo(chemo>shear_cutoff)=chemo_cutoff;
%             chemo(chemo<-shear_cutoff)=-chemo_cutoff;
            current_x(1)=current_x(1)+dx(1,i)+shear*dt+chemo*cx1/norm(cx1,cy1)*dt;
            current_x(2)=current_x(2)+dx(2,i)+chemo*cy1/norm(cx1,cy1)*dt;
            current_x(1)=current_x(1)-floor(current_x(1)/L)*L;
            current_x(2)=current_x(2)-floor(current_x(2)/L)*L;
            %traj=[traj current_x];
            if (current_x(1)>15 && current_x(1)<35 && current_x(2)>15 && current_x(2)<35 )
                hit=check_hit_or_cross(current_x,prev_x, egg_loc,egg_size);
            end
            if hit==1
               hit_loc=i;
               break;
            end
        end
        counter_chemo=counter_chemo+1;
    end
    hit_loc=hit_loc+counter_chemo*(n-1);
    hit_time_chemo_list(k)=hit_loc;
end

    hit_time = (hit_time_chemo_list*dt);
end
%%
