sum=0;
t=1;
c2=1;
l=20;
mu=2;
D=69;
T=1;
for i=1:10000
    a=(D*pi^2*i^2/l^2+mu);
    temp=(-1)^i*(1- exp(-a*T))/a;
    sum=temp+sum;
end
((1-exp(-mu*T))/mu+2*sum)/20