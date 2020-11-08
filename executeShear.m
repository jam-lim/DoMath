function x = executeShear(i,rw,p,L,A,n,dt,cutoff)

x = zeros(1,n);
if(cutoff<0 || A*sin(p(2,1)*2*pi/L)<=cutoff)
x(1) = i(1) + rw(1,1)*cosd(rw(2,1)) + A*sin(p(2,1)*2*pi/L)*dt;
elseif(cutoff>=0)
    x(1) = i(1) + rw(1,1)*cosd(rw(2,1)) + cutoff*dt;
end
for i=2:n
    shear = A*sin(p(2,i)*2*pi/L);
    if(cutoff>=0 && shear>cutoff); shear = cutoff; end
    x(i) = x(i-1) + rw(1,i)*cosd(rw(2,i)) + shear*dt;
end
end