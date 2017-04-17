function y=f(x)
    y=x^2-2;
endfunction

//initialisation
a=1; b=2;
ITMAX=1000;
precision=1e-10;
erreur=zeros(ITMAX,1);

for k=1:ITMAX
        x=(a+b)/2;
        erreur(k)=abs(x-sqrt(2));
        if abs(f(x))<precision
            break;
        end
        if f(a)*f(x)>0
            a=x;
        else b=x;
        end
end

erreur=erreur(1:k);
//affichage
disp(x); disp(k); disp(erreur);
