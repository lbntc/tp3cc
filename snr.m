function [ MSE, PSNR ] = snr( IR, I )

[M,N]=size(I);
MS=0;
for i=1:M
    for j=1:N
        MS=MS+(IR(i,j)-I(i,j))^2;
    end
end
MSE=(1/(M*N))*MS;
PSNR=10*(log10((255*255)/(MSE)));
end

