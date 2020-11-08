x=0:0.5:19.5;
y=0:0.5:19.5;
cx1=cx;
cy1=cy;
cx1(abs(cx1)<1e-05)=0;
cy1(abs(cy1)<1e-05)=0;
dr1=sqrt(cx1.^2+cy1.^2);
figure(1)
dr2=phi(dr1);
dr1(dr1==0)=1;
quiver(x,y,cx1,cy1,"r");
hold on

ratio=dr2./dr1;
cx2=cx1.*ratio;
difx=abs(cx1)-abs(cx2);
quiver(x(10:30),y(10:30),cx1(10:30,10:30)*0.5,cy1(10:30,10:30)*0.5,"b");
hold off