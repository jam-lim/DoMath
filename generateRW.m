function randomwalk  = generateRW(dim,size,dx,initial)
rw = randi([1,2*dim],1,size);
randomwalk = zeros(dim,size);
% 1 - right 2 - left 3 - y pos 4 - y neg 5 - up 6 - down
for i=1:size
    if(rw(i)==1)
        randomwalk(1,i) = dx;
    elseif(rw(i)==2)
        randomwalk(1,i) = -dx;
    elseif(rw(i)==3)
        randomwalk(2,i) = dx;
    elseif(rw(i)==4)
        randomwalk(2,i) = -dx;
    elseif(rw(i)==5)
        randomwalk(3,i) = dx;
    elseif(rw(i)==6)
        randomwalk(3,i) = -dx;
    end
end
for i=1:dim
randomwalk(dim,1) = randomwalk(dim,1) + initial(dim);
end
end
