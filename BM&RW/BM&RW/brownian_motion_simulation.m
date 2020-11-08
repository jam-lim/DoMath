function x= brownian_motion_simulation ( x0,m, n, d, t )

%*****************************************************************************80
%
%% BROWNIAN_MOTION_SIMULATION simulates Brownian motion.
%
% this is an adaptation to John Burkardt's code, we allow the code to take
% in initial location x0, and return the steps we take. and return the
% steps we generated as well.
%
%    Modified by Yishu Gong on:
%
%    2 June 2020
%
%    Original Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the spatial dimension.
%    This defaults to 2.
%
%    Input, integer N, the number of time steps to take, plus 1. 
%    This defaults to 1001.
%
%    Input, real D, the diffusion coefficient.  
%    This defaults to 10.0.
%
%    Input, real T, the total time.
%    This defaults to 1.0;
%
%    Output, real X(M,N), the initial position at time 0.0, and 
%    the N-1 successive locations of the particle.
%

%
%  Supply default values if necessary.
%
  if ( nargin < 5 )
    t = 1.0;
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Using default total time T = %g\n', t );
  end

  if ( nargin < 4 )
    d = 1/4;
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Using default diffusion coefficient D = %g\n', d );
  end

  if ( nargin < 3 )
    n = 1001;
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Using default number of steps N = %g\n', n );
  end

  if ( nargin < 2 )
    m = 2;
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Using default spatial dimension M = %g\n', m );
  end
  
  if ( nargin < 1 )
    x0 = [0;0];
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Using default initial location x = %g\n', x0 );
  end
%
%  Set the time step.
%
  dt = t / ( n - 1 );
%
%  Compute the individual steps.
%
  x = zeros ( m, n );
  x(:,1)=x0;
%  Stepsize is normal.
%
  s = sqrt ( 2.0 * m * d * dt ) * randn ( 1, n - 1 );
%xn+1= xn + randn(0,1)*sqrt(2*dt*dimension*diffusion coefficient)


%dt RW & BM


%step size RW

%BM diffusion coefficient=(step size)^2/(2*dimension*dt)
%

%step size given by randn(0,1)*sqrt(2*dt*dimension*diffusion coefficient)
%  Direction is random.
%
  if ( m == 1 )
    dx(1:m,1:n-1) = s(1:n-1);
  else
    a = randn ( m, n - 1 ); %a=(0.5,-0.2) is a direction
    
    v = s ./ sqrt ( sum ( a.^2 ) );
    b = spdiags ( v', 0, n-1, n-1 );
    dx(1:m,1:n-1) = a * b;
    
  end
%
%  Each position is the sum of the previous steps.
%
  x(1:m,2:n) = x0+cumsum ( dx(1:m,1:n-1), 2 );

  return
end
