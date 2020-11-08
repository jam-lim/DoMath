%returns expected time to reach egg 
%from the edge of the circle
%L is the length of the circle
%dx is the radius of the egg
%Note: if we change the egg size to be 
%bigger than it won't equal dx anymore
%dim is dimensions
function u_of_L = annulus(L,dx,dim)
if dim == 1
    u_of_L = L*L/2 +dx*dx/2 - L*dx;
elseif dim == 2
    A = L*L/2;
    B = dx*dx/4 - A*log(dx);
    u_of_L = -L*L/4 + A*log(L) + B;
else
    A = L*L*L/3;
    B = dx/6 + A/dx;
    u_of_L = -L*L/6 -A/L + B;
end


