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
		G(:,j)=ones(n,1)/n;
		s=1;
	end
        H(i,j)=G(i,j)/s;
        end
    end
endfunction

alpha=0.15;
p=1-alpha;
n=11; //nombre de villes
x=ones(n,1)/n; //equiprobabilite au depart
nom_villes=["Varese","Milan","Pavie","Lodi","Cremone","Mantoue","Brescia",
            "Bergame","Come","Lecco","Sondrio"];
G=sparse([1,2;2,1;2,3;2,4;2,9;2,8;2,7;3,2;4,2;4,5;5,4;5,6;5,7;6,5;7,5;7,2;
          7,8;8,7;8,2;8,9;8,10;9,2;9,8;9,10;10,9;10,8;10,11;11,10;],
          ones(28,1));
H=constrH(G,n);
A=constrA(H,n);

for i=1:100
    x=A*x;
    x=x/sum(x);
end

disp(x);
pie(x,nom_villes);
