data=[...];//ici les donnees
t=data(:,1);
y=data(:,2);

function return=constrA(t,y,d)
    n=length(t);
    A=ones(n,d+1);
    for i=1:d
        A(:,i+1)=t.^i;
    end
    return=A;
endfunction

function [theta,reg,erreur]=reglin(t,y,d)
    A=constrA(t,y,d);
    theta=A\y;
    erreur=norm(A*theta-y)^2;
    reg=A*theta;
endfunction

nom_degre=["degre 0","degre 1","degre 2","degre 3","degre 4","degre 5"];
erreur=zeros(6,1);
n=length(t);
for degre=0:5
    subplot(3,2,degre+1);
    plot(t,y,'ko');
    [theta,reg,erreur(degre+1)]=reglin(t,y,degre);
    plot(t,reg,"b");
    title(nom_degre(degre+1));
end
scf(1);
plot((0:5),erreur');
title("Variation de l''erreur en fonction du degre du polynome",'fontsize',4);
