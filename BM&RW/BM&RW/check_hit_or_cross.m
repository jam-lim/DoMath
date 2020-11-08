function hit=check_hit_or_cross(prev_x,current_x, egg_loc,egg_size)
    hit=0;
    ax=prev_x(1);
    ay=prev_x(2);
    bx=current_x(1);
    by=current_x(2);
    cx=egg_loc(1);
    cy=egg_loc(2);
    r=egg_size;
    
    % parameters: ax ay bx by cx cy r
    ax =ax- cx;
    ay =ay- cy;
    bx =bx- cx;
    by =by- cy;
    a = (bx - ax)^2 + (by - ay)^2;
    b = 2*(ax*(bx - ax) + ay*(by - ay));
    c = ax^2 + ay^2 - r^2;
    disc = b^2 - 4*a*c;
    if(disc < 0) 
        hit=0;
    else
        sqrtdisc = sqrt(disc);
        t1 = (-b + sqrtdisc)/(2*a);
        t2 = (-b - sqrtdisc)/(2*a);
        if((0 < t1 && t1 < 1) || (0 < t2 && t2 < 1)) 
            hit=1;
        else
            hit=0;
        end
    end
end
