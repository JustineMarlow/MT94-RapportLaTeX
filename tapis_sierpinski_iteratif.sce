T1=[1/3 0;0 1/3];
T2=[1/3;0];
T3=[0;1/3];

function Y=f1(X)
    Y=T1*X; endfunction

function Y=f2(X)
Y=T1*X+T2; endfunction

function Y=f3(X)
    Y=T1*X+2*T2; endfunction

function Y=f4(X)
    Y=T1*X+T3; endfunction

function Y=f5(X)
    Y=T1*X+2*T2+T3; endfunction

function Y=f6(X)
    Y=T1*X+2*T3; endfunction

function Y=f7(X)
    Y=T1*X+T2+2*T3; endfunction

function Y=f8(X)
    Y=T1*X+2*T2+2*T3; endfunction

N=input("Entrez n, le nombre de points a dessiner : ");
T=zeros(2,N); T(:,1)=[0,0]'; //initialisation de l'ensemble de N points

for i=2:N
    t=floor(8*rand(1)+1); //selection aleatoire de la fonction
    select t
    case 1 then T(:,i)=f1(T(:,i-1));
    case 2 then T(:,i)=f2(T(:,i-1));
    case 3 then T(:,i)=f3(T(:,i-1));
    case 4 then T(:,i)=f4(T(:,i-1));
    case 5 then T(:,i)=f5(T(:,i-1));
    case 6 then T(:,i)=f6(T(:,i-1));
    case 7 then T(:,i)=f7(T(:,i-1));
    case 8 then T(:,i)=f8(T(:,i-1));
    end
end

clf;
isoview(0,1,0,1);
plot(T(1,:),T(2,:),".",'markersize',1); //affichage
