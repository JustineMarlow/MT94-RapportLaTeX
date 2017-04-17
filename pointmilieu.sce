function dydt=f1(t,y)
    dydt = -t*y+t;
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

function y = solution_exacte(t)
y = 1-exp(-t^2/2);
endfunction


T=4; N=20; //intervalle et nombre de points
h=T/N; //pas
t=[0:h:T]; //subdivision
y0=0;
y=point_milieu(0,t,f1); //approximation par le schema

clf;
subplot(2,1,1);
plot(t,y,'ro');
plot(t,solution_exacte(t),'bo');
legend(["Schema Point milieu";"Solution exacte"],opt=4);
title("Application du schema du point milieu",'fontsize',5);
//on zoom sur certains points pour juger visuellement l'approximation
subplot(2,1,2);
plot(t(10:16),y(10:16),'ro');
plot(t(10:16),solution_exacte(t(10:16)),'bo');
