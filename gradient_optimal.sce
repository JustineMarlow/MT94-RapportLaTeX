function out=formeQ(x,A,b)
    out=.5*x'*A*x-b'*x; // Forme quadratique
endfunction

function out=gradient(x,A,b)
    out=A*x-b;
endfunction

function trace(xk)
    c=formeQ(xk)-formeQ(xc);
    a=sqrt(2*c/d(1));
    b=sqrt(2*c/d(2));
    N=128;
    t=linspace(0,2*%pi,N);
    x=P*[a*cos(t);b*sin(t)]+xc(:,ones(1,N));
    plot(x(1,:),x(2,:),'linewidth',2)
endfunction

A=[2 -1;-1 2];
b=[1 1]';
xc=A\b; // Point qui minimise le gradient (annule la forme quadratique)
[D,P]=bdiag(A); // Matrice reelle (blocs de diagonalisation)
d=diag(D);

clf;
x=[1;0]; //point de depart arbitraire
set(gca(),"isoview","on");
trace(x);

for i=1:50
    last=x;
    g=gradient(last,A,b);
    if (abs(g)>0)
        rho= norm(g)^2/(g'*A*g);
        x=last-rho*gradient(last,A,b);
        plot([last(1) x(1)],[last(2) x(2)],"r");
        trace(x);
    else break;
    end
end

title("Algorithme du gradient a pas optimal",'fontsize',3);
