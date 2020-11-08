function [i,j]=find_grids(h,x)
    i=floor(x(1)/h);
    j=floor(x(2)/h);
end