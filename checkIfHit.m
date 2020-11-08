function isHit = checkIfHit(x,y,z,L,egg,n,d)
isHit = -1;

for i=1:n
    if(mod(x(i),L) == egg(1))
        if(d <= 1)
        isHit = i;
        break;
        else
            if(mod(y(i),L) == egg (2))
                if(d <= 2)
                    isHit = i;
                    break;
                else
                    if(mod(z(i),L) == egg(3))
                        isHit = i;
                        break;
                    end
                end
            end
        end
    end           
end
end
