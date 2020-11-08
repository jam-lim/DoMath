


%ExpectedTime to reach target for annulus
boxStartSize = 10;
boxEndSize = 1000;
boxDelta = 10;
dx = 1;
dim = 2;
counter = 1;
ExpTimes = zeros((boxStartSize + boxEndSize)/2,1);
for L = boxStartSize:boxDelta:boxEndSize
    boxSize = L;
    %ExpTimes(counter,1) = L;
    ExpTimes(counter,1) = annulus(L,dx,dim);
    counter = counter + 1;
end
disp(ExpTimes);
