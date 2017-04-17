function cantor(n,a,b)
    if n<1
            break;
    else
        I = (b-a)/3;
        plot([a,a+I],[n,n]);
        plot([b-I,b],[n,n]);
        cantor(n-1,a,a+I);
        cantor(n-1,b-I,b);
    end
endfunction

clf;
N=input("Entrez n, le nombre de niveaux a dessiner : ");
plot([0,1],[N+1,N+1]); //pour permettre une visualisation du premier niveau
plot([0,1],[N,N]);
N=N-1;
cantor(N,0,1)
plot([0,1],[0,0]); //pour permettre une visualisation du dernier niveau
