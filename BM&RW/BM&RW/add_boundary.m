function xx=add_boundary(x,L)
    xx=x;
    for i=1:size(x,1)
        temp=x(i,:);
        temp(temp<0)=temp(temp<0)+L;
        rnd=floor( temp / L) * L;
        temp=temp-rnd;
        xx(i,:)=temp;
    end
    return
end