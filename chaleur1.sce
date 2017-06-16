function out=a(n)
    if (n==0) out=2*lambda/%pi;
    else out=-2/(n*%pi)*sin(n*(%pi-lambda));
    end
endfunction

N=1000;
t=linspace(0.01,5,4);
lambda=%pi/2;
theta=linspace(0,2*%pi,1000);
p=100;

for i=1:N
    somme=a(0)/2;
    for n=1:p
        somme=somme+a(n)*cos(n*theta)*exp(-n^2*t(i));
    end
    drawlater;
    subplot(2,2,i);
    plot(theta,somme,'b');
    set(gca(),'data_bounds',[0 2*%pi -0.2 1.2]);
    drawnow;
end
