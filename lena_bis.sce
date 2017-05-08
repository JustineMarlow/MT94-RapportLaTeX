//recuperation de l'image originale
n=512; funcprot(0);
l=read('/home/marlow/scilab/TD7/lena.csv',512,512); lena=l';
x=[1:512]; y=[512:-1:1]; xset('colormap',graycolormap(256));

//resolution du SVD
[U,S,V]=svd(lena);
sig=diag(S);
eps=0.005; //seuil
for i=1:n if sig(i)<eps*sig(1) then break; end end

//signal bruite
k=i; T=zeros(n,n);
for i=1:n
    for j=1:n
        T(i,j)=exp(-1/10*(i-j)^2);
    end
    C(i)=sum(T(i,:));
    T(i,:)=T(i,:)/C(i);
end
eta=rand(n); eta=eta\norm(eta); eta=eta*norm(lena)*0.001;
v=T*lena*T; w=v+eta; Ab=T*w*T;

//signal debruitee
[U,ST,V]=svd(T);
sigT=diag(ST);
Td=zeros(T');
for i=1:k
    Td=Td+sigT(i)*U(:,i)*V(:,i)';
end
Ar=pinv(Td)*w*pinv(Td);

//affichage
clf;
subplot(1,3,1); set(gca(),'isoview','on');
grayplot(x,y,lena); title('Image originale');
subplot(1,3,2); set(gca(),'isoview','on');
grayplot(x,y,Ab); title('Image bruitee');
subplot(1,3,3); set(gca(),'isoview','on');
grayplot(x,y,Ar); title('Image debruitee');
