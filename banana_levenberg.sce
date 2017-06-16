function out=g(x)
    out=[1-x(1)
         10*(x(2)-x(1)^2)];
endfunction

function out=jac(x)
    out=[-1       0
         -20*x(1) 10];
endfunction

//trace de la courbe de Rosenbrock   
t=linspace(0,2*%pi,1024); 
clf
a=gca();
a.isoview='on';
a.data_bounds=[-1 2 -1 2];
a.auto_scale='off';       
for c=1:5:300
    y=sqrt(c)*[cos(t);sin(t)];
    x=[1-y(1,:)
    y(2,:)/10+(1-y(1,:)).^2];
    plot(x(1,:),x(2,:));
end
plot(1,1,'xr')

x=[-0.5;1.5]; //point de depart arbitraire
lambda=1;
for i=1:20
    Jg=jac(x);
    newx=x-(Jg'*Jg+lambda*eye(2,2))\(Jg'*g(x))
    plot([x(1) newx(1)],[x(2) newx(2)],"-or");
    x=newx;
end
title("Fonction de Rosenbrock : methode de Levenberg-Marquardt",'fontsize',3);
