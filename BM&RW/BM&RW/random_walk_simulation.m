function x = random_walk_simulation ( x0,m, n, step_size, t )

%*****************************************************************************80
%
%% BROWNIAN_MOTION_SIMULATION simulates Brownian motion.
%
%    Modified:
%
%    2 June 2020
%
%    Author:
%
%    Yishu Gong
%
%  Parameters:
%    
%
%    Input, integer M, the spatial dimension.
%    This defaults to 2.
%
%    Input, integer N, the number of time steps to take, plus 1. 
%    This defaults to 1001.
%
%    Input, step_size, how much distance the particle travels 
%    This defaults to 0.1
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
    dx = 0.1;
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Using default spatial step = %g\n', dx );
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
%  draw the direction;
%  
   dx=zeros(m,n-1);
   if m==1
        r = randi([1 2],1,n-1);
        %1=+x,2=-x
        dx(1,r==1)=1*step_size;
        dx(1,r==2)=-1*step_size;
   end
   if m==2
        r = randi([1 4],1,n-1);
        %1=+x,2=-x,3=+y,4=-y
        dx(1,r==1)=1*step_size;
        dx(1,r==2)=-1*step_size;
        dx(2,r==3)=1*step_size;
        dx(2,r==4)=-1*step_size;
   end
   if m==3
        r = randi([1 6],1,n-1);
        %1=+x,2=-x,3=+y,4=-y,5=+z,6=-z
        dx(1,r==1)=1*step_size;
        dx(1,r==2)=-1*step_size;
        dx(2,r==3)=1*step_size;
        dx(2,r==4)=-1*step_size;
        dx(3,r==5)=1*step_size;
        dx(3,r==6)=-1*step_size;
   end
%  Each position is the sum of the previous steps.
%
  x(1:m,2:n) = x0+cumsum ( dx(1:m,1:n-1), 2 );

  return
end
