function return=f(t,X)
    return = [2/3*X(1)-4/3*X(1)*X(2)
              -X(2)+X(1)*X(2)]
endfunction

clf;
t=linspace(0,100,5000);
X0=[1/2;1/2];
X=ode(X0,t(1),t,f);
subplot(2,1,1);
plot(t,X(1,:),"b");
plot(t,X(2,:),"r");
legend(["Proies";"Predateurs"],opt=4);
title("Evolution des proportions de proies et de predateurs
      en fonction du temps");
subplot(2,1,2);
plot(X(2,:),X(1,:),'b');
title("Evolution de la proportion de proies
      en fonction de la proportion de predateurs");
