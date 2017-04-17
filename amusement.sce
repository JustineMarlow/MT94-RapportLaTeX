function dvdt=celeste(t,v)
    u1=[v(1),v(2)]';
    u1_prime=[v(3),v(4)]';
    u2=[v(5),v(6)]';
    u2_prime=[v(7),v(8)]';
    dvdt=[u1_prime,G*m2*(u2-u1)/(norm(u2-u1))^3,u2_prime,-G*m1*(u2-u1)/(norm(u2-u1))^3];
endfunction

//constantes : données de l'exercice
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
//tracé des trajectoire
//plot(v(1,:),v(2,:),'yo',v(5,:),v(6,:),'g+')

//code animation dynamique trajectoires
comet(v(1,:),v(2,:),"colors",color("red"));
comet(v(5,:),v(6,:),"colors",color("blue"));

//code animation dynamique à chaque instant t
//x=v([1 5],:);
//y=v([2 6],:);
//plot(x(1,1),y(1,1),'.',x(2,1),y(2,1),'.');
//h=gce();
//a=gca();
//a.data_bounds=[min(x) max(x) min(y) max(y)];
//a.isoview='on';
//for n=2:length(t)
//    h.children(1).data=[x(1,n) y(1,n)];
//    h.children(2).data=[x(2,n) y(2,n)];
//end

//coordonnées du centre de gravité
//Gx=((m1*v(1,:)+m2*v(5,:))/(m1+m2));
//Gy=((m1*v(2,:)+m2*v(6,:))/(m1+m2));

//plot(v(1,:)-Gx,v(2,:)-Gy,'r',v(5,:)-Gx,v(6,:)-Gy,'b')
//comet(v(5,:)-Gx,v(6,:)-Gy,"colors",color("blue"));
