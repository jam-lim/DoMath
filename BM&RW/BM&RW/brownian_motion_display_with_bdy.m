function brownian_motion_display_with_bdy ( m, n, x ,sim_type,egg_loc,egg_size)

%*****************************************************************************80
%
%% BROWNIAN_MOTION_DISPLAY displays successive Brownian motion positions.
%
%  Licensing:
%
%    This code is loosely based on John Burkardt's code so that we can
%    include the box and show the egg.
%
%  Modified by Yishu Gong
%
%    Jun 2 2020
%
%  Orginal Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the spatial dimension.
%    M should be 1, 2 or 3.
%
%    Input, integer N, the number of time steps. 
%
%    Input, real X(M,N), the particle positions.
%    Input, egg_loc, a m-by-1 array that stores the location of the egg
%    Input, egg_size, a double that stores the size of the egg
%    plotting the egg only works in 2D now, will update later so it works
%    in 1D and 3D.
  if ( m == 1 )
    y(1,1:n) = ( 0 : n - 1 ) / ( n - 1 );
    clf
    hold on
    scatter( x(1,:), y(1,:) )
    plot ( x(1,1), y(1,1), 'g.', 'MarkerSize', 35 );
    plot ( x(1,n), y(1,n), 'r.', 'MarkerSize', 35 );
    axis equal
    grid on
    xlabel ( '<--X-->' )
    ylabel ( '<--Time-->' )
    title ( strcat(sim_type,' simulation in 1D'), 'Fontsize', 16 )
%   axis equal
    hold off
  elseif ( m == 2 )
    clf
    hold on
    sz = 5;
    c = linspace(1,10,length(x));
    scatter(x(1,:), x(2,:),sz,c,'filled')
    
    plot ( x(1,1), x(2,1), 'g.', 'MarkerSize', 35 );
    plot ( x(1,n), x(2,n), 'r.', 'MarkerSize', 35 );
    grid on
    xlabel ( '<--X-->' )
    ylabel ( '<--Y-->' )
    title ( strcat(sim_type,' simulation in 2D'), 'Fontsize', 16 )
    axis equal
    %plot (5,5, 'y','MarkerSize', 35);
    
    r=egg_size;
    x0=egg_loc(1);
    y0=egg_loc(2);
    theta = linspace(0,2*pi,100);
    plot(x0 + r*cos(theta),y0 + r*sin(theta),'-')
    hold off
  elseif ( m == 3 )
    clf
    hold on
    plot3 ( x(1,:), x(2,:), x(3,:), 'Color', 'b', 'LineWidth', 2 )
    plot3 ( x(1,1), x(2,1), x(3,1), 'g.', 'MarkerSize', 35 );
    plot3 ( x(1,n), x(2,n), x(3,n), 'r.', 'MarkerSize', 35 );
    grid on
    xlabel ( '<--X-->' )
    ylabel ( '<--Y-->' )
    zlabel ( '<--Z-->' )
    title ( strcat(sim_type,' simulation in 3D'), 'Fontsize', 16 )
    axis equal
    view ( 3 )
    hold off
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'BROWNIAN_MOTION_DISPLAY - Fatal error!\n' );
    fprintf ( 1, '  Cannot display data except for M = 1, 2, 3.\n' );
    return
  end

  return
  
end