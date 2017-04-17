function sierpinski(n,a,b,c)
    if n<1
            break;
    else
        a1=(c+b)/2; b1=(c+a)/2; c1=(b+a)/2; //calcul des nouveaux sommets
        //trace du triangle central
        plot([a1(1),b1(1)],[a1(2),b1(2)]);
        plot([b1(1),c1(1)],[b1(2),c1(2)]);
        plot([a1(1),c1(1)],[a1(2),c1(2)]);
        //appel de sierpinski pour les triangles retenus
        sierpinski(n-1,a,c1,b1);
        sierpinski(n-1,c1,b,a1);
        sierpinski(n-1,b1,a1,c);
    end
endfunction

clf;
a=[0,0]'; b=[1/2, sqrt(3)/2]'; c=[1,0]'; //sommets de T0
//trace de T0
plot([a(1),b(1)],[a(2),b(2)]);
plot([b(1),c(1)],[b(2),c(2)]);
plot([a(1),c(1)],[a(2),c(2)]);

N=input("Entrez n, le nombre de niveaux a dessiner : ");
sierpinski(N,a,b,c)

isoview(0,1,0,1);
