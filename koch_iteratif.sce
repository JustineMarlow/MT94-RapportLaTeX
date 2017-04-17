function Y=f1(X) //partie gauche basse (reduction 1/3)
    Y=[1/3,0;0,1/3]*X
endfunction

function Y=f2(X) //partie gauche haute (reduction 1/3 et rotation)
    Y=[1/6,-sqrt(3)/6;sqrt(3)/6,1/6]*X+[1/3;0]
endfunction

function Y=f3(X) //partie droite haute (reduction 1/3 et rotation)
    Y=[1/6,sqrt(3)/6;-sqrt(3)/6,1/6]*X+[1/2;sqrt(3)/6]
endfunction

function Y=f4(X) //partie droite basse (reduction 1/3)
    Y=[1/3,0;0,1/3]*X+[2/3;0]
endfunction

N=input("Entrez N, le nombre de points a dessiner :");
X=zeros(2,N); X(:,1)=[0,0]'; //initialisation de l'ensemble de N points

for i=2:N
    t=floor(4*rand(1)+1); //selection aleatoire de la fonction
    select t
    case 1 then X(:,i)=f1(X(:,i-1));
    case 2 then X(:,i)=f2(X(:,i-1));
    case 3 then X(:,i)=f3(X(:,i-1));
    case 4 then X(:,i)=f4(X(:,i-1));
    end
end

clf isoview(0,1,0,0.4); plot(X(1,:),X(2,:),".",'markersize',1); //affichage
