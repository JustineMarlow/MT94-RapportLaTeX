function out=a(n)
    if (n==0) out=2*lambda/%pi;
    else out=-2/(n*%pi)*sin(n*(%pi-lambda));
    end
endfunction

function out=chaleur(theta,i)
    somme=a(0)/2;
    for n=1:p somme=somme+a(n)*cos(n*theta)*exp(-n^2*t(i)); end
    out=somme;
endfunction

lambda=%pi/2;
M=200; t=linspace(0.01,2,M);
N=64;  theta=linspace(0,2*%pi,N);
p=100;
r=[1 1.5];
[R,TH]=meshgrid(r,theta);
X=R.*cos(TH);
Y=R.*sin(TH);
NCOL=256; set(gcf(),"color_map",hotcolormap(NCOL))    
zmin=0; zmax=1;
for i=1:M
    Z=chaleur(TH,i);
    drawlater;
    clf; C=round(((Z-zmin)/(zmax-zmin)*(NCOL-1)))+1;
    surf(X,Y,Z,C)
    set(gca(),'view','2d','isoview','on')
    set(gce(),"color_flag",3,'color_mode',-1,'cdata_mapping','direct')
    drawnow;
end

