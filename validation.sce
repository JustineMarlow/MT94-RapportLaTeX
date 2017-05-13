data=[...];//ici les donnees
t=data(:,1); y=data(:,2);

function return=constrA(t,y,d)
    n=length(t); A=ones(n,d+1); for i=1:d A(:,i+1)=t.^i; end return=A;
endfunction

function [theta,reg,erreur]=reglin(t,y,p)
    A=constrA(t,y,p); theta=A\y; erreur=norm(A*theta-y)^2; reg=A*theta;
endfunction

function y=evalpoly(theta,t)
    y=zeros(t)+theta(1);
    for i=2:length(theta)
        y=y+theta(i)*t.^(i-1); end
endfunction

clf;
n=length(t);
V=find(abs(t)<=1); erreur_v=zeros(8,1); //validation
T=setdiff(1:n,V); erreur_t=zeros(8,1); //apprentissage

nom_degre=["degre 1","degre 2","degre 3","degre 4","degre 5","degre 6",
           "degre 7","degre 8"];
for degre=1:8
    [theta,reg,erreur_t(degre)]=reglin(t(T),y(T),degre);
    yv=evalpoly(theta,t(V));
    erreur_v(degre)=(norm(y(V)-yv))^2;
    subplot(4,2,degre);
    plot(t(T),y(T),'o',t(V),y(V),'o',t,evalpoly(theta,t),'r');
    title(nom_degre(degre));
end

scf(1); plot(1:8,log(erreur_t),'-o',1:8,log(erreur_v),'-o');
title("Variation de l''erreur sur T et sur V en fonction du degre",
      'fontsize',3);
legend(["Erreur d''apprentissage";"Erreur de validation"],opt=2);
