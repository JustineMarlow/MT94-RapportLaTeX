function out=a(n)
    if (n==0) out=2*lambda/%pi;
    else out=-2/(n*%pi)*sin(n*(%pi-lambda));
    end
endfunction

N=100;
t=linspace(0.01,1,N);
lambda=%pi/2;
theta=linspace(0,2*%pi,N);
p=20;
somme=zeros(N,length(x));

for i=1:N
    somme(i,:)=a(0)/2;
    for n=1:p
        somme(i,:)=somme(i,:)+a(n)*cos(n*theta)*exp(-n^2*t(i));
    end
end
clf;
set(gcf(),"color_map",jetcolormap(128))
surf(theta,t,somme);
set(gce(),"color_flag",3)
xlabel theta; ylabel t; zlabel u;
title("Courbe de la chaleur en fonction de theta et de t",'fontsize',4);
