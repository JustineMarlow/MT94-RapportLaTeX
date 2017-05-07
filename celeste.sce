function dvdt=celeste(t,v)
    u1=[v(1),v(2)]';
    u1_prime=[v(3),v(4)]';
    u2=[v(5),v(6)]';
    u2_prime=[v(7),v(8)]';
    dvdt=[u1_prime,G*m2*(u2-u1)/(norm(u2-u1))^3,
          u2_prime,-G*m1*(u2-u1)/(norm(u2-u1))^3];
endfunction

//constantes : donnees de l'exercice
m1=5.975e24;
m2=7.35e22;
G=6.67e-11;
d=3.84402e8;
T=27.55*24*60*60;

t=[0:10000:2*T];
u1_zero=[0,0]';
u1_prime_zero=[0,0]';
u2_zero=[d,0]';
u2_prime_zero=[0,2*d*%pi/T]';
v0=[u1_zero;u1_prime_zero;u2_zero;u2_prime_zero];
v=ode(v0,0,t,celeste);

clf;
//trace des trajectoires (affichage 1)
subplot(2,1,1);
plot(v(1,:),v(2,:),'bo',v(5,:),v(6,:),'ro')
title("Trajectoires des deux corps",'fontsize',4);

//code animation dynamique trajectoires
//comet(v(1,:),v(2,:),"colors",color("blue"));
//comet(v(5,:),v(6,:),"colors",color("red"));

//coordonnees du centre de gravite
Gx=((m1*v(1,:)+m2*v(5,:))/(m1+m2));
Gy=((m1*v(2,:)+m2*v(6,:))/(m1+m2));

//trace des trajectoires (affichage 2)
subplot(2,1,2);
plot(v(1,:)-Gx,v(2,:)-Gy,'bo',v(5,:)-Gx,v(6,:)-Gy,'ro')
title("Trajectoires des deux corps (centrees sur leur centre de gravite)",
      'fontsize',4);
