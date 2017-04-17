function Y=f1(X) //la tige
    Y=[0 0;0 0.16]*X; endfunction

function Y=f2(X) //partie gauche
    Y=[0.85 0.04;-0.04 0.85]*X+[0;1.6]; endfunction

function Y=f3(X) //partie droite
    Y=[0.2 -0.26;0.23 0.22]*X+[0;1.6]; endfunction

function Y=f4(X) //sous-parties
    Y=[0.15 0.28;0.26 0.24]*X+[0;0.44]; endfunction

p=[0.01, 0.85, 0.07, 0.07]; //probas conseillees
N=input("Entrez N, le nombre de points a dessiner : ");
X=zeros(2,N); X(:,1) = [0;0]; ; //initialisation de l'ensemble de N points

for i=2:N
    t=rand(); //selection aleatoire d'un nombre entre 0 et 1
    if (t<p(1)) then X(:,i)=f1(X(:,i-1)); end
    if (t>p(1)) & (t<p(1)+p(2)) then X(:,i)=f2(X(:,i-1)); end
    if (t>p(1)+p(2)) & (t<p(1)+p(2)+p(3)) then X(:,i)=f3(X(:,i-1)); end
    if (t>p(1)+p(2)+p(3)) then X(:,i)=f4(X(:,i-1)); end
end

clf; set(gca(), "isoview", "on");
plot(X(1,:),X(2,:),".",'markersize',1); //affichage
