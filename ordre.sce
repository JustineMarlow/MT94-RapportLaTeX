function dydt=f1(t,y)
    dydt = -t*y+t;
endfunction

function y=euler(y0,t,f)
    n=length(t);
    y=zeros(1,n);
    h=t(2)-t(1);
    y(1)=y0;
    for i=1:n-1
        y(i+1)=y(i)+h*f(t(i),y(i));
    end
endfunction

function y=euler_cauchy(y0,t,f)
    n=length(t);
    y=zeros(1,n);
    h=t(2)-t(1);
    y(1)=y0;
    for i=1:n-1
        k1=f(t(i),y(i));
        k2=f(t(i)+h,y(i)+h*k1);
        y(i+1)=y(i)+h/2*(k1+k2);
    end
endfunction

function y=point_milieu(y0,t,f)
    n=length(t);
    y=zeros(1,n);
    h=t(2)-t(1);
    y(1)=y0;
    for i=1:n-1
        k1=f(t(i),y(i));
        k2=f(t(i)+h/2,y(i)+h/2*k1);
        y(i+1)=y(i)+h*k2;
    end
endfunction

function y=runge_kutta(y0,t,f)
    n=length(t);
    y=zeros(1,n);
    h=t(2)-t(1);
    y(1)=y0;
    for i=1:n-1
        k1=f(t(i),y(i));
        k2=f(t(i)+h/2,y(i)+h/2*k1);
        k3=f(t(i)+h/2,y(i)+h/2*k2);
        k4=f(t(i)+h,y(i)+h*k3);
        y(i+1)=y(i)+h/6*(k1+2*k2+2*k3+k4);
    end
endfunction

function y = solution_exacte(t)
y = 1-exp(-t^2/2);
endfunction

function return=calcul_erreur(y,t)
y = abs(y-solution_exacte(t));
return = max(y);
endfunction
