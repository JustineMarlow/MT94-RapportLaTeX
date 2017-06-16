function rho=pasOptimal(x_k,d_k,f)
    // Recherche du pas optimal pour la methode de descente
    // x_k+1=x_k+rho*d_k
    // f est la fonction a minimiser

    if type(f)<>15 // f peut etre du type list(fun,p1,...,pn)
        f=list(f)
    end
    function y=phi(t)
        y=f(1)(x_k+t*d_k,f(2:$));
    endfunction

    // Recherche de l'intervalle initial
    a=0;b=0.5;c=1;
    phi0=phi(a);
    while phi(c)<phi0
        b=c; c=c*2;        
    end

    gr=(1+sqrt(5))/2; 
    c=b-(b-a)/gr
    d=a+(b-a)/gr
    MAX=100
    for i=1:MAX // 100 iterations maximum
        if phi(c)<phi(d)
          b=d
        else
          a=c
        end
        c=b-(b-a)/gr
        d=a+(b-a)/gr
        if abs(c-d)<1e-8*(abs(c)+abs(d))
          break
        end
    end
    rho=(a+b)/2; 
endfunction
