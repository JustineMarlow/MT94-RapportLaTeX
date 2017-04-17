function y=f(x)
    y=x^2-2;
endfunction

function y=g(x)
    y=x/2+1/x;
endfunction

a=1; b=2; x=3/2;
ITMAX=1000; precision=1e-10; erreur=zeros(ITMAX,1); //initialisation

for k=1:ITMAX
        x=g(x);
        erreur(k)=abs(x-sqrt(2));
        if abs(f(x))<precision
            break;
        end
end

erreur=erreur(1:k);
disp(x); disp(k); disp(erreur); //affichage
