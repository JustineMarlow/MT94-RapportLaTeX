data=[...]; //ici les donnees
[data_tri]=gsort(data,'lr','i'); //permet de trier les donnees
t=data_tri(:,1);
y=data_tri(:,2);
clf;
plot(t,y,'ko');

//Levenberg-Marquardt
function r=res(theta,n)
    r=exp(theta(1)+t*theta(2)+t.^2*theta(3))-y;
endfunction

function J=jac(theta,n)
    J=ones(n,3);
    for i=1:n
        for k=1:3
            J(i,k)=t(i)^(k-1)*exp(theta(1)+t(i)*theta(2)+t(i)^2*theta(3));
        end
    end
endfunction

//Logtrick
function return=constrA(t,y,d)
    n=length(t);
    A=ones(n,d+1);
    for i=1:d
        A(:,i+1)=t.^i;
    end
    return=A;
endfunction

function [theta,reg]=reglin(t,y,d)
    A=constrA(t,y,d);
    theta=A\y;
    reg=A*theta;
endfunction

//Levenberg-Marquardt
n=length(t);
theta=[1;-1;-1]; //theta_0 proche de la solution
lambda=1;
for i=1:50
    Jr=jac(theta,n);
    newtheta=theta-(Jr'*Jr+lambda*eye(3,3))\(Jr'*res(theta,n))
    theta=newtheta;
end
plot(t,exp(theta(1)+t*theta(2)+t.^2*theta(3)),"b");

//Logtrick
[theta_bis,reg]=reglin(t,log(y),2);
plot(t,exp(reg),"r");

//A la place de Levenberg-Marquardt, on aurait pu utiliser lsqrsolve
//theta_0=[1;-1;-1]; //theta_0 proche de la solution
//theta_second=lsqrsolve(theta_0,res,length(t),jac);
//plot(t,exp(theta_second(1)+t*theta_second(2)+t.^2*theta_second(3)),"m");

title("Approximations par le log-trick et par Levenberg-Marquardt",
      'fontsize',3);
legend(["Donnees";"Levenberg-Marquardt";"Log-trick"],opt=1);
