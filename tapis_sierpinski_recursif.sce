function tapis(N,a,b,c,d)
    if N<1 then
        plot([a(1),b(1)],[a(2),b(2)]); plot([b(1),c(1)],[b(2),c(2)]);
        plot([c(1),d(1)],[c(2),d(2)]); plot([d(1),a(1)],[d(2),a(2)]);
    else
        //calcul des nouveaux sommets
        e=[a(1),a(2)+2*(d(2)-a(2))/3];
        f=[a(1),a(2)+(d(2)-a(2))/3];
        g=[a(1)+(b(1)-a(1))/3,a(2)];
        h=[a(1)+2*(b(1)-a(1))/3,a(2)];
        i=[b(1),a(2)+(c(2)-b(2))/3];
        j=[b(1),a(2)+2*(c(2)-b(2))/3];
        k=[a(1)+2*(b(1)-a(1))/3,c(2)];
        l=[a(1)+(b(1)-a(1))/3,c(2)];
        m=[a(1)+(b(1)-a(1))/3,a(2)+2*(d(2)-a(2))/3];
        n=[a(1)+(b(1)-a(1))/3,a(2)+(d(2)-a(2))/3];
        o=[a(1)+2*(b(1)-a(1))/3,a(2)+(c(2)-b(2))/3];
        p=[a(1)+2*(b(1)-a(1))/3,a(2)+2*(c(2)-b(2))/3];
        //appels de tapis pour chacun des carres retenus
        tapisSierpinski(N-1,a,g,n,f);
        tapisSierpinski(N-1,f,n,m,e);
        tapisSierpinski(N-1,e,m,l,d);
        tapisSierpinski(N-1,l,k,p,m);
        tapisSierpinski(N-1,p,j,c,k);
        tapisSierpinski(N-1,j,p,o,i);
        tapisSierpinski(N-1,b,h,o,i);
        tapisSierpinski(N-1,n,o,h,g);
    end
endfunction

A=[0,0]; B=[1,0]; C=[1,1]; D=[0,1]; //points du premier carre

N=input("Entrez n, le nombre de niveaux a dessiner : ");
tapis(N,A,B,C,D) 
clf isoview(0,1,0,1); //affichage
