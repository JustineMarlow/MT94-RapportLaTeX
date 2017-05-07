function dxdt=f(x,y)
    dxdt = 2/3*x -4/3*x*y;
endfunction

function dydt=g(x,y)
    dydt=-y + x*y;
endfunction

function [x,y]=euler(x0,y0,t,f1,f2)
    n=length(t);
    h=t(2)-t(1);
    x(1)=x0;
    y(1)=y0;
    for i=1:n-1
        x(i+1)=x(i)+h*f1(x(i),y(i)); //proie
        y(i+1)=y(i)+h*f2(x(i),y(i)); //predateur
    end
endfunction

T=100; //intervalle
N=5000; //nombre de points
h=T/N; //pas
t=[0:h:T]; //subdivision

x0=1/2; //condition initiale proie
y0=1/2; //condition initiale predateur
[x,y]=euler(x0,y0,t,f,g); //approximation par le schema

clf;
subplot(2,1,1);
plot(t,x,'b');
plot(t,y,'r');
legend(["Proies";"Predateurs"],opt=4);
title("Evolution des proportions de proies et de predateurs
      en fonction du temps");
subplot(2,1,2);
plot(y,x,'b');
title("Evolution de la proportion de proies en fonction
      de la proportion de predateurs");
