function y=f(x)
    y=x^2-2;
endfunction

x=2; y=1;
ITMAX=1000; precision=1e-10; erreur=zeros(ITMAX,1); //initialisation

for k=1:ITMAX
        y=x-f(x)*(x-y)/(f(x)-f(y));
        //passage par une variable temporaire pour inverser les valeurs de x et y
        temp=x; x=y; y=temp;
        erreur(k)=abs(y-sqrt(2));
        if abs(f(y))<precision
            break;
        end
end

erreur=erreur(1:k); disp(x); disp(k); disp(erreur); //affichage
