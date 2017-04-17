function Y=f0(X)
    Y=[1/3 0;0 1/3]*X;
endfunction

function Y=f1(X)
    Y=[1/3 0;0 1/3]*X+[2/3; 0];
endfunction

N=input("Entrez N, le nombre de points a dessiner : ");
C=zeros(2,N); C(:,1)=[0;0]; //initialisation de l'ensemble de N points

for i=2:N
    t=floor(2*rand(1)+1); //selection aleatoire de la fonction
    select t;
    case 1 then
        C(:,i)=f0(C(:,i-1));
    case 2 then
        C(:,i)=f1(C(:,i-1));
    end
end

clf;
isoview(0,1,-0.05,0.05);
plot(C(1,:),C(2,:),".",'markersize',1); //affichage
