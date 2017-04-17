function sierpinski(n,a,b,c,d)
    if n<1
        plot([a(1),b(1)],[a(2),b(2)]);
        plot([b(1),c(1)],[b(2),c(2)]);
        plot([c(1),d(1)],[c(2),d(2)]);
        plot([d(1),a(1)],[d(2),a(2)]);
        e=gce()
        set(gca(),"isoview","on")
    else
        //calcul des coordonnees des points
        e=[(b(1)-a(1))*1/3+a(1),a(2)];
        f=[a(1),(b(1)-a(1))*1/3+a(2)];
        g=[(b(1)-a(1))*1/3+a(1),(b(1)-a(1))*1/3+a(2)];
        h=[(b(1)-a(1))*2/3+a(1),a(2)];
        i=[(b(1)-a(1))*2/3+a(1),(b(1)-a(1))*1/3+a(2)];
        j=[(b(1)-a(1))*3/3+a(1),(b(1)-a(1))*1/3+a(2)];
        k=[(b(1)-a(1))*3/3+a(1),(b(1)-a(1))*2/3+a(2)];
        l=[(b(1)-a(1))*2/3+a(1),(b(1)-a(1))*2/3+a(2)];
        m=[(b(1)-a(1))*2/3+a(1),(b(1)-a(1))*3/3+a(2)];
        p=[(b(1)-a(1))*1/3+a(1),(b(1)-a(1))*3/3+a(2)];
        o=[(b(1)-a(1))*1/3+a(1),(b(1)-a(1))*2/3+a(2)];
        q=[a(1),(b(1)-a(1))*2/3+a(2)];
        //appels recursifs
        sierpinski(n-1, a, e, g, f)
        sierpinski(n-1, e, h, i, g)
        sierpinski(n-1, h, b, j ,i)
        sierpinski(n-1, i, j, k, l)
        sierpinski(n-1, l, k, c, m)
        sierpinski(n-1, o, l, m, p)
        sierpinski(n-1, q, o, p, d)
        sierpinski(n-1, f, g, o, q)
        
    end
endfunction

A=[0,0]; B=[1,0]; C=[1,1]; D=[0,1]; //initialisation

//dessin du premier carre
plot([A(1),B(1)],[A(2),B(2)]);
plot([B(1),C(1)],[B(2),C(2)]);
plot([C(1),D(1)],[C(2),D(2)]);
plot([D(1),A(1)],[D(2),A(2)]);
e=gce()
set(gca(),"isoview","on")

N=input("Entrez n, le nombre de niveaux a dessiner : ");
sierpinski(N,A,B,C,D)
