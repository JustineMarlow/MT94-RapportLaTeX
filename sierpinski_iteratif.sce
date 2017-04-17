function Y=f0(X)
    Y=[1/2 0;0 1/2]*X;
endfunction

function Y=f1(X)
    Y=[1/2 0;0 1/2]*X+[1/2;0];
endfunction

function Y=f2(X)
    Y=[1/2 0;0 1/2]*X+[1/4;sqrt(3)/4];
endfunction

N=input("Entrez n, le nombre de points a dessiner : ");
T=zeros(2,N); T(:,1)=[0,0]'; //initialisation de l'ensemble de N points

for i=2:N
    t=floor(3*rand(1)+1); //selection aleatoire de la fonction
    select t
    case 1 then
        T(:,i)=f0(T(:,i-1));
    case 2 then
        T(:,i)=f1(T(:,i-1));
    case 3 then
        T(:,i)=f2(T(:,i-1));
    end
end

clf;
isoview(0,1,0,1);
plot(T(1,:),T(2,:),".",'markersize',1); //affichage
