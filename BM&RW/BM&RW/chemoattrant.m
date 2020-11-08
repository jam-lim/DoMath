function c=chemoattrant(L,h,Amp,shear_cutoff,egg_size)
M=L/h;
N=M*M;
%flow=flow_fun(h,L,Amp,shear_cutoff);

rho=rho_fun(h,L,egg_size);
rho_reshape=reshape(rho(1:end-1,1:end-1),[N,1]);

A1=diffusion_discretization(h,M);
A2=flow_discretization(L,Amp,shear_cutoff,h,M);
e = ones(N,1);
A3=spdiags(e,0,N,N);

full_matrix=A1+A2+A3;

c=full_matrix\rho_reshape;

c=reshape(c,[M,M]);
c(c<1e-5)=0;

end
%%
% %make c better by interpolation
% [x,y] = meshgrid(0:h:L);
% figure (5)
% surf(x(1:end-1,1:end-1),y(1:end-1,1:end-1),c)
% [Xq,Yq] = meshgrid(0:h/10:L);
% %Interpolate at the query points.
% %figure (6)
% %Vq = interp2(x(1:end-1,1:end-1),y(1:end-1,1:end-1),full(c),Xq(1:end-1,1:end-1),Yq(1:end-1,1:end-1),'cubic');
% %surf(Xq(1:end-1,1:end-1),Yq(1:end-1,1:end-1),Vq);
% %title('Cubic Interpolation Using Finer Grid');

%%
function A2=flow_discretization(L,Amp,shear_cutoff,h,M)
    N=M*M;
    e = ones(N,1);
    A2 = spdiags([-e 0*e e],[-M,0,M],N,N);
    A2((N-M)*N+1:N+1:N*N)=-1;
    A2((N-M)+1:1+N:M*N)=1;
    flow=flow_fun(h,L,Amp,shear_cutoff);
    A2=A2(1:end,:).*flow(1:end);
    
    
    A2=1/(2*h)*A2;
    %figure(1)
    %imagesc(A2)
end



function A=diffusion_discretization(h,M)
    N=M*M;
    e = ones(N,1);
    A = spdiags([-e,-e 4*e -e,-e],[-M,-1,0,1,M],N,N);
    A(1,N)=-1;
    A(N,1)=-1;
    A((N-M)*N+1:N+1:N*N)=-1;
    A((N-M)+1:1+N:M*N)=-1;
    A=4/h^2*A;
    %figure(2)
    %imagesc(A)
end

function flow=flow_fun(h,L,Amp,shear_cutoff)
    %x = 0:h:L;
    y = 0:h:L;
    shear=sin(2*pi*y/L)*Amp;
    shear(shear>shear_cutoff)=shear_cutoff;
    shear(shear<-shear_cutoff)=-shear_cutoff;
    tmp=transpose(shear);
    flow=repmat(tmp(1:end-1),L/h,1);
end


function rho=rho_fun(h,L,egg_size)
%this function gives the rho function, it also shows a picure of what rho looks like.

    x = 0:h:L;
    y = 0:h:L;
    [xx yy] = meshgrid(x,y);
    rho = zeros(size(xx));
    rho(( (L/2-xx).^2+(L/2-yy).^2)<egg_size^2)=1/(pi*egg_size^2);   % radius 100, center at the origin
    rho=sparse(rho);
    %figure(3)
    %imagesc(rho(1:end-1,1:end-1))
    
end