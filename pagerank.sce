function A=constrA(G,n)
    e=ones(n,1);
    A=p*G+(1-p)/n*e*e';
endfunction

function H=constrH(G,n)
    H=zeros(G);
    for i=1:n
        for j=1:n
        s=sum(G(:,j));
        if s == 0 then
            G(:,j)=ones(n,1)/n; s=1;
        end
        H(i,j)=G(i,j)/s;
        end
    end
endfunction

alpha=0.15; p=1-alpha;
G=sparse([1,2;1,3;2,1;3,1;],ones(4,1)); //config 1
//config 2 : G=sparse([2,1;3,1;4,2;2,3;5,3;2,4;5,4;6,4;6,5;7,5;8,5;8,6;5,7;
                     //8,7;6,8;7,8;],ones(16,1));
//config 3 : G=[sparse([1,2;2,1;3,4;3,5;4,3;4,5],ones(6,1));0 0 0 0 0];
//config 4 : G=sparse([1,3;1,4;2,1;3,1;3,2;3,4;4,1;4,2;],ones(8,1))
//config 5 : G=sparse([1,5;2,1;2,3;3,2;3,4;4,8;5,2;5,9;6,3;6,9;7,2;7,12;8,3;
                     //9,1;9,13;10,5;10,6;10,7;10,14;11,6;11,7;11,8;11,12;
                     //11,14;12,4;12,8;12,15;13,10;13,14;14,13;14,15;15,11;
                     //15,14;],ones(33,1));

n=length(G(1,:)); //nombre de pages
H=constrH(G,n);
A=constrA(H,n);
x=ones(n,1)/n; //equiprobabilite au depart
for i=1:100
    x=A*x; x=x/sum(x);
end

disp(x); pie(x); //permet de tracer un diagramme circulaire
