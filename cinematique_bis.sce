function out=f(theta)
        M=[l1*cos(theta(1))+l2*cos(sum(theta))
           l1*sin(theta(1))+l2*sin(sum(theta))];
        out=M-[xA;yA];
endfunction

function out=Jf(theta)
out=[-l1*sin(theta(1))-l2*sin(sum(theta)) -l2*sin(sum(theta))
     l1*cos(theta(1))+l2*cos(sum(theta))  l2*cos(sum(theta))];
endfunction

l1=1; l2=1;
ITMAX=1000; precision=1e-10;
theta=[0,%pi/2]'; //choix arbitraire d'une position initiale

for t=linspace(0,2*%pi,100) //on choisit de tracer 100 bras
        xA = 1 + (1/2)*cos(t); yA = 1 + (1/2)*sin(t);
        for k=1:ITMAX
            if abs(norm(f(theta)))<precision
                break;
            end
            theta = theta-Jf(theta)\f(theta);
        end
        dessine_bras(theta)
end
