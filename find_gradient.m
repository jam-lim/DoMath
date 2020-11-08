function [cx,cy]=find_gradient(c,L,h,current_x)
    i=floor(current_x(1)/h);
    j=floor(current_x(2)/h);
    if i-4>0 && i+5<L/h && j-4>0 && j+5<L/h
        grid_x=[i-4:i+5];
        grid_x(grid_x<0)=grid_x(grid_x<0)+L/h;
        grid_y=[j-4:j+5];
        grid_y(grid_y<0)=grid_y(grid_y<0)+L/h;
        x=[grid_x(1:5)*h current_x(1) grid_x(6:end)*h];
        y=[grid_y(1:5)*h current_x(2) grid_y(6:end)*h];
        [x2,y2]=meshgrid(x,y);
        [x1,y1]=meshgrid(grid_x*h,grid_y*h);
        Vq = interp2(x1,y1,full(c(grid_x,grid_y)),x2,y2,'cubic');
        [cx_full,cy_full]=gradient(Vq,x,y);
        cx=cx_full(6,6);
        cy=cy_full(6,6);
    else
        cx=0;
        cy=0;
    end
end