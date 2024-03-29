I=imread('cameraman.tif');
%imshow(I);
I=double(I);

%Discrete cosine transform
%D=dct2(I);
%imshow(uint8(D)); affichage image dct2 
 
[L,C]=size(I);
%on divise la matrice en blocs de 8x8
Q=[16 11 10 16 24 40   51  61;
   12 12 14 19 26 58   60  55;
   14 13 16 24 40 57   69  56; 
   14 17 22 29 51 87   80  62;
   18 22 37 56 68 109  103 77; 
   24 35 55 64 81 104  113 92;
   49 64 78 87 103 121 120 101;
   72 92 95 98 112 100 103 99];

for i=1:8:L
    for j=1:8:C
                D=I(i:i+7,j:j+7);%pas:pas+nbr-1 ex:nbr=8
                DB=dct2(D);
                Ic(i:i+7,j:j+7)=DB;%image compressee
                QB=round(DB./Q);
                Ic(i:i+7,j:j+7)=QB;
    end 
end
for i=1:8:L
    for j=1:8:C
                B=Ic(i:i+7,j:j+7);%pas:pas+nbr-1 ex:nbr=8
                D=B.*Q;%inverse de la quantification
                
                ID=idct2(D);%inverse DCT
                IR(i:i+7,j:j+7)=ID;
    end 
end
imshow(uint8(I));%show l'originale
title('image originale');
figure;
imshow(uint8(IR));
title('image compressee');

Z=zigzag(Q);