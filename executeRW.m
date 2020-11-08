function [x,y,z] = executeRW(x,y,z,rw,a,b,c,dx)
x0 = a;
y0 = b;
z0 = c;
for i=1:length(rw)
    % 1 - right 2 - left 3 - y pos 4 - y neg 5 - up 6 - down
    if(rw(i)==1)
        x(i) = x0 + dx;
        x0 = x(i);
        y(i) = y0;
        z(i) = z0;
    elseif(rw(i)==2)
        x(i) = x0 - dx;
        x0 = x(i);
        y(i) = y0;
        z(i) = z0;
    elseif(rw(i)==3)
        y(i) = y0 + dx;
        x(i) = x0;
        y0 = y(i);
        z(i) = z0;
    elseif(rw(i)==4)
        y(i) = y0 - dx;
        x(i) = x0;
        y0 = y(i);
        z(i) = z0;
    elseif(rw(i)==5)
        z(i) = z0 + dx;
        x(i) = x0;
        y(i) = y0;
        z0 = z(i);
    else
        z(i) = z0 - dx;
        x(i) = x0;
        y(i) = y0;
        z0 = z(i);
    end
end

end