x=linspace(-1,1,400); //valeurs de x (partie reelle de C)
y=linspace(-1.5,0.5,400); //valeurs de y (partie imaginaire de C)
[X,Y]=meshgrid(x,y); C=Y+%i*X; //on cree une grille de valeur pour C

Z=0;
A=zeros(length(x),length(y)); //matrice de couleurs

for i=1:500
    Rc=max(abs(c),2); Z=Z.^2+C;
    conver=abs(Z)<Rc; //analyse de la convergence
    A(conver)=A(conver)+1;
end

//affichage
clf; set(gca(),"isoview","on"); set(gcf(), 'color_map', jetcolormap(256));
grayplot(x,y,A);
