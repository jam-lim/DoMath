function [isHit,x,x1,y1,x2,y2] = BMcheckIfHitAcross(p,o,e,delta,n,L,d,initial)
isHit = -1;
x1=0;
y1=0;
x2=0;
y2=0;
x=false;
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
        isHit = i;        
        break;
    end
    %(p(1,i)>e(1)-delta-0.3 && p(1,i)<e(1)+delta+0.3) &&(p(2,i)>e(2)-delta-0.3 && p(2,i)<e(2)+delta+0.3)
    if((p(2,i)>e(2)-delta-0.3 && p(2,i)<e(2)+delta+0.3))
        if(i>1)
        if(checkAcross(o(:,i-1),o(:,i),e,delta,L))
            isHit = i;
            x = true;
            x1 = o(1,i-1);
            y1 = o(2,i-1);
            x2 = o(1,i);
            y2 = o(2,i);
            break;
        end
        else
            if(checkAcross(initial,o(:,i),e,delta,L))
            x = true;
            x1 = initial(1);
            y1 = initial(2);
            x2 = o(1,i);
            y2 = o(2,i);
            isHit = i;
            break;
            end
        end
    end
%     if(i>1 && abs(p(1,i)-p(1,i-1))<L/2 && abs(p(2,i)-p(2,i-1))<L/2)
%         across =(p(2,i)-p(2,i-1))*e(1)-(p(1,i)-p(1,i-1))*e(2)+ p(1,i)*p(2,i-1)-p(2,i)*p(1,i-1);
%         if(abs(across)/norm(p(:,i)-p(:,i-1))<=delta && norm(p(:,i)-transpose(e))<norm(p(:,i)-p(:,i-1)))
%             isHit = i;      
%             break;
%         end
%     end
%     if(i>1)
%         dx = p2(1,i)-floor(p2(1,i-1)/L)*L;
%         dy = p2(2,i)-floor(p2(2,i-1)/L)*L;
%         throughBoundary = dx < 0 || dx >= 90 || dy < 0 || dy >= 90;
%         if(~throughBoundary && norm(p(:,i)-transpose(e))<norm(p2(:,i)-p2(:,i-1)))
%         across =(p(2,i)-p(2,i-1))*e(1)-(p(1,i)-p(1,i-1))*e(2)+ p(1,i)*p(2,i-1)-p(2,i)*p(1,i-1);
%         if(abs(across)/norm(p(:,i)-p(:,i-1))<=delta)
%             isHit = i;      
%             break;
%         end
%         end
%     end
end
end
end

