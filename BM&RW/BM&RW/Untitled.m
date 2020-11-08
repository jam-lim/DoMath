%du/dt=Dd^2u/dx^2-cu
%u=1 x=0
%u=0 x=w
%c=0 0<x<w t=0 


W=20; %width of the placenta
L=220;
x = linspace(0,W,100); %2–2.5 cm (0.8–1 inch) in thickness, 
t = linspace(0,300,1000); %if we run simulation for 20 days
m = 0;
sol = pdepe(m,@pdex1pde,@pdex1ic,@pdex1bc,x,t);

u= sol(:,:,1);



%trapz (u(end,:)) %area under the curve at the end time
%assume homogeneous along the length.
virus_tot=trapz (u(end,:))*(L/2*pi)^2*pi*4; %in the placenta.
possible_virus=virus_tot/20*0.0002;
%%
figure (1)
surf(x,t,u)
title('Numerical solution')
xlabel('Distance x')
ylabel('Time t')

%%
figure (2)
plot(x,u(end,:))
%In humans, the placenta averages 22 cm (9 inch) in length and 2–2.5 cm (0.8–1 inch) in thickness, 

function [c,f,s] = pdex1pde(x,t,u,dudx)
c =1/155;% 1/(1.8*10^-3) ; %inverse of the diffusion coefficent
f = dudx;
s = -2*u; %death of the cmv %death rate is 1, 2 virus day per day
end
function u0 = pdex1ic(x)
u0 = 0; %initial is 0
end
function [pl,ql,pr,qr] = pdex1bc(xl,ul,xr,ur,t)
pl = ul-1; %u(0,t)=1
ql = 0; 
pr = ur; %u(L,t)=0
qr = 0;
end
