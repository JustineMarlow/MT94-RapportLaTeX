//utile pour le calcul de e (troisieme point)
function K=rotation(theta)
    K=[cos(theta), -sin(theta)
       sin(theta), cos(theta)];
endfunction

function koch(n,a,b)
    if n<1
        plot([a(1),b(1)],[a(2),b(2)]);
    else
        //calcul des nouveaux points
        c=a+(b-a)/3;
        d=b-(b-a)/3;
        e=c+rotation(%pi/3)*(d-c);
        //appel de sierpinski pour les segments retenus
        koch(n-1,a,c);
        koch(n-1,c,e);
        koch(n-1,e,d);
        koch(n-1,d,b);
    end
endfunction

clf;
a=[0,0]'; b=[1,0]'; //extremites du segment initial

N=input("Entrez n, le nombre de niveaux a dessiner : ");
koch(N,a,b)
isoview(0,1,0,0.3);
