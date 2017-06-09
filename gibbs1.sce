function out=S(x,p)
    somme=0;
    for i=0:p
        somme=somme+(sin(x*(2*i+1))/(2*i+1));
    end
    out=somme*(4/%pi);
endfunction

clf;
gamme_n = [10,100,500,1000];
nom_n = ["n=10","n=100","n=500","n=1000"];

x=linspace(-%pi,%pi,10000);

for i=1:length(gamme_n)
    n=gamme_n(i);
    subplot(2,2,i);
    plot(x,S(x,n));
    title(nom_n(i));
end
