function out=S2(x,p)
    somme=0;
    for i=0:p
        somme=somme+cos((2*i+1)*x)/(2*i+1)^2;
    end
    out=%pi/2-somme*4/%pi;
endfunction
//pas de discontinuite, donc pas d'effet Gibbs

clf;
x=linspace(-%pi,%pi,10000);
n=100;
plot(x,S2(x,n));
title("n=100");
