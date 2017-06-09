function somme=f1(x)
    somme=-1/6;
    for i=1:p
      somme=somme+1/(4*%pi^2*i^2)*cos(4*%pi*i*x)+1/(4*%pi*i)*sin(4*%pi*i*x);
    end
endfunction

function somme=f2(x)
    somme=-1/6;
    for i=1:p
      somme=somme+1/(%pi^2*i^2)*cos(2*%pi*i*x);
    end
endfunction

function somme=f3(x)
    somme=0;
    for i=1:p
      somme=somme+4*((-1)^i-1)/(%pi^3*i^3)*sin(%pi*i*x);
    end
endfunction

function out=f(x)
    out=x^2-x;
endfunction

clf;
x=linspace(-1/2,1/2,1000);
p=100;
plot(x,f(x),'k');
plot(x,f1(x),'b');
plot(x,f2(x),'r');
plot(x,f3(x),'m');
legend(["f(x)";"f1(x)";"f2(x)";"f3(x)"],opt=1);
title("Sommes partielles des series de Fourier",'fontsize',4);
