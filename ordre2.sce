T=4;
N=[10,20,50,100,200,350,500,750,950,1500]; //variation du nombre de points

//initialisation
pas=zeros(10,1);
erreur_euler=zeros(10,1);
erreur_euler_cauchy=zeros(10,1);
erreur_point_milieu=zeros(10,1);
erreur_runge_kutta=zeros(10,1);

for j=1:10
    h=T/N(j); //pas
    pas(j)=h;
    t=[0:h:T];
    n=length(t);
    y0=0;
    //Euler
    y=euler(y0,t,f1);
    e=calcul_erreur(y,t);
    erreur_euler(j)=e;
    //Euler Cauchy
    y=euler_cauchy(y0,t,f1);
    e=calcul_erreur(y,t);
    erreur_euler_cauchy(j)=e;
    //point milieu
    y=point_milieu(y0,t,f1);
    e=calcul_erreur(y,t);
    erreur_point_milieu(j)=e;
    //Runge Kutta
    y=runge_kutta(y0,t,f1);
    e=calcul_erreur(y,t);
    erreur_runge_kutta(j)=e;
end

//trace
clf;
plot(log(pas)',log(erreur_euler)','red');
plot(log(pas)',log(erreur_euler_cauchy)','blue');
plot(log(pas)',log(erreur_point_milieu)','magenta');
plot(log(pas)',log(erreur_runge_kutta)','black');
legend(["Euler";"Euler-Cauchy";"Point milieu";"Runge-Kutta"],opt=4);
title("Regression lineaire des differents schemas",'fontsize',5);

//calcul des coeff de regression lineaire
a1= reglin(log(pas)',log(erreur_euler)');
a2= reglin(log(pas)',log(erreur_euler_cauchy)');
a3= reglin(log(pas)',log(erreur_point_milieu)');
a4= reglin(log(pas)',log(erreur_runge_kutta)');
