function isHit = BMcheckIfHit(p,o,e,delta,n,L,d,initial)
isHit = -1;
if(d==1)
    for i=1:n
        if(p(2,i)>=e(2)-delta && p(2,i)<=e(2)+delta)
            isHit = i;
            break;
        end
    end
else
for i=1:n
    if((p(1,i)-e(1))^2+(p(2,i)-e(2))^2<delta^2)
     %if(p(2,i) <= e(2)+delta && p(2,i)>= e(2)-delta)  
        isHit = i;        
        break;
    end
    
end
end
end

