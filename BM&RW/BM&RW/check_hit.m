function hit_loc=check_hit(xx,egg_loc,egg_size)
    hit_loc=-1;
%situation 1: we just land in the egg in some step
    hit=vecnorm(xx-egg_loc)<egg_size;
    if sum(hit)
        hit_loc = find(hit~=0, 1, 'first');
    end
end