function dessine_bras(theta)
    l1=1;l2=1;
    t=linspace(0,2*%pi,64);
    x=[0
       l1*cos(theta(1))
       l1*cos(theta(1))+l2*cos(sum(theta))];
    y=[0
       l1*sin(theta(1))
       l1*sin(theta(1))+l2*sin(sum(theta))];
    drawlater
    plot(1+.5*cos(t),1+.5*sin(t),x,y,"-o");
    set(gca(),"isoview","on")
    drawnow
endfunction
