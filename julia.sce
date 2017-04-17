x=linspace(-0.5,0.5,400); //valeurs de x (partie reelle de )
y=linspace(-0.5,0.5,400); //valeurs de y (partie imaginaire de Z)
[X,Y]=meshgrid(x,y); Z=X+%i*Y; //on cree une grille de valeur pour Z

c=0.32+%i*0.043; //valeur de c que l'on peut changer
A=zeros(length(x),length(y)); //matrice de couleurs

for i=1:500
    Rc=max(abs(c),2); Z=Z.^2+c;
    conver=abs(Z)<Rc; //analyse de la convergence
    A(conver)=A(conver)+1;
end

//affichage
clf; set(gca(),"isoview","on"); set(gcf(), 'color_map', jetcolormap(256));
grayplot(x,y,A);
