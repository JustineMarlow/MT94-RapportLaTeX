function dydt=f1(t,y)
    dydt = -t*y+t;
endfunction

function y=euler(y0,t,f)
    n=length(t);
    h=t(2)-t(1);
    y(1)=y0;
    for i=1:n-1
        y(i+1)=y(i)+h*f(t(i),y(i));
    end
endfunction

function y = solution_exacte(t)
    y = 1-exp(-t^2/2);
endfunction

T=4; N=20; //intervalle et nombre de points
h=T/N; //pas
t=[0:h:T]; //subdivision
y0=0;
y=euler(0,t,f1); //approximation par le schema

clf;
subplot(2,1,1);
plot(t,y,'ro');
plot(t,solution_exacte(t),'bo');
legend(["Schema Euler";"Solution exacte"],opt=4);
title("Application du schema d''Euler",'fontsize',5);
//on zoom sur certains points pour juger visuellement l'approximation
subplot(2,1,2);
plot(t(10:16),y(10:16),'ro');
plot(t(10:16),solution_exacte(t(10:16)),'bo');
