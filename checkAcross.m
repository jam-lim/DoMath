function x = checkAcross(p1,p2,e,r,L)
x=true;

if(ThroughTorus(p1,p2,L)) % two points go across the torus
    x = false;
else
    p1 = p1-floor(p1/L)*L - transpose(e);
    p2 = p2-floor(p2/L)*L - transpose(e);
    dx = p2(1)-p1(1);
    dy = p2(2)-p1(2);
    dr = sqrt(dx^2+dy^2);
    d = det([p1,p2]);
    
    discriminant = r^2*dr^2-d^2;
    if(discriminant<0)  % the line formed doesn't intersect the egg
        x = false;
    else
    sgny = 1; if(dy<0); sgny =-1; end
    x1 = (d*dy+sgny*dx*sqrt(discriminant))/(dr^2);
    y1 = (-d*dx+abs(dy)*sqrt(discriminant))/(dr^2);
    x2 = (d*dy-sgny*dx*sqrt(discriminant))/(dr^2);
    y2 = (-d*dx-abs(dy)*sqrt(discriminant))/(dr^2);
    a1= p1(1); a2=p2(1); if(p2(1)>a1); a1=p2(1); a2=p1(1); end %sort the x-coords and y cords
    b1= p1(2); b2=p2(2); if(p2(2)>b1); b1=p2(2); b2=p1(2); end
    % check if the intersections are between two points
    if((x1>=a2 && x1<=a1 && y1>=b2 && y1<=b1) || (x2>=a2 && x2<=a1 && y2>=b2 && y2<=b1))
        x = true;
    else
        x = false;
    end
    end
end
end

% p1 = [-2, -2];
% p2=[2,2];
% c=[0,0];
% r=2;
% p12 = p2 - p1;
% N=p12/norm(p12); %normalized vector in direction of the line
% p1c = c- - p1; % line from onepoint to center
% v= abs(n(1)*p1c(2) -n(2)*p1c(1)); %norm of the 2d cross product
% dointersect = (v<=R);

