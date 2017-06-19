function dydt = f(t,y)
    dydt = [y(2);-g/L*sin(y(1))] endfunction

function y = solution_approx(theta0,t)
    y = theta0*cos(sqrt(g/L)*t); endfunction

g=9,81; L=1; //donnees
t=linspace(0,10,10000);
gammeTheta = [%pi/32,%pi/16,%pi/8,%pi/4,%pi/2,3*%pi/4];
nomTheta = ["\\frac{\\pi}{32}","\\frac{\\pi}{16}","\\frac{\\pi}{8}",
"\\frac{\\pi}{4}","\\frac{\\pi}{2}","\\frac{3\\pi}{4}"];
clf;
for i=1:length(gammeTheta)
    theta0=gammeTheta(i); y0=[theta0;0];
    y=ode(y0,0,t,f);
    subplot(3,2,i);
    plot(t,y(1,:),'r'); plot(t,solution_approx(theta0,t),'b');
    title(sprintf('$$\\theta_0='+nomTheta(i)+'$$')); end
