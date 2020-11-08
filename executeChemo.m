function p = executeChemo(i,rw,L,A,n,dt,cutoff,c,h,chi)
p = zeros(2,n);
dx = 0;
dy = 0;

if(i(1) ~= 0 && i(2) ~=0) 
    [dx,dy]=phi(find_gradient(c,L,h,i));
end
p(1,1) = i(1) + rw(1,1)*cosd(rw(2,1)) + chi*dx*dt;
p(2,1) = i(2) + rw(1,1)*sind(rw(2,1)) + chi*dy*dt;

p(2,1) = p(2,1)-floor(p(2,1)/L)*L;
shear = A*sin(p(2,1)*2*pi/L);
if(cutoff>0 && shear>cutoff); shear = cutoff; end
p(1,1) = p(1,1) + shear*dt;
p(1,1) = p(1,1)-floor(p(1,1)/L)*L;

for i=2:n
dx = 0;
dy = 0;
% [dx,dy] = find_gradient(c,L,h,p(:,i-1));
% 
% dx=phi(dx);
% dy=phi(dy);
%disp([dx,dy]);
p(1,i) = p(1,i-1) + rw(1,i)*cosd(rw(2,i)) + chi*dx*dt;
p(2,i) = p(2,i-1) + rw(1,i)*sind(rw(2,i)) + chi*dy*dt;

p(2,i) = p(2,i)-floor(p(2,i)/L)*L;
shear = A*sin(p(2,i)*2*pi/L);

if(cutoff>0 && shear>cutoff); shear = cutoff; end
p(1,i) = p(1,i) + shear*dt;
p(1,i) = p(1,i)-floor(p(1,i)/L)*L;
    
end
end