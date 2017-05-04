//recuperation de l'image originale
n=512;
funcprot(0);
l=read('/home/marlow/scilab/TD7/lena.csv',512,512);
lena=l';
x=[1:512];
y=[512:-1:1];
xset('colormap',graycolormap(256));

//resolution du SVD
[U,S,V]=svd(lena);
sig=diag(S);
clf;
plot(sig/sig(1),'o');
eps=0.005;
for i=1:n
    if sig(i)<eps*sig(1) then
        break;
    end
end
clf;

//creation de differentes valeurs de k
gammek = [10,20,30];
nomk = ["10","20","30"];

//application pour creer differentes compressions
for i=1:length(gammek)
    k=gammek(i);
    Ak=sig(1)*U(:,1)*V(:,1)';
        for j=2:k
            Ak=Ak+sig(j)*U(:,j)*V(:,j)';
        end
        subplot(2,3,i);
        grayplot(x,y,Ak);
        set(gca(),'isoview','on');
        title(sprintf('$$k='+nomk(i)+'$$'));
        //affichage de l'erreur
        subplot(2,3,i+3);
        grayplot(x,y,Ak-lena);
        set(gca(),'isoview','on');
        title('Erreur');
end
