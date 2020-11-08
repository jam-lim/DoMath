function a = phi(grad)
maxv=0.002;
a=grad;
a(a<1e-04)=0;
a(a>0.002)=maxv;
end