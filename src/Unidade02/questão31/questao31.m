clear
clc
format bank

A = [
     4 -1 -1 0 0 0 0 0
     -1 4 0 -1 0 0 0 0
     -1 0 4 -1 -1 0 0 0
     0 -1 -1 4 0 -1 0 0
     0 0 -1 0 4 -1 -1 0
     0 0 0 0 -1 0 4 -1 
     0 0 0 0 0 -1 -1 4
];

B = [5 15 0 10 0 10 20 30] '

// % Ax = B

x = inv(A)*B

% usando lu

[L, U] = lu(A)

M  = reshape(x, 2, 4)

verificandoLu = L * U - A 

iamgesc(M)
colorbar

[X, Y] = meshgrid(1:4, 1:2); % --
[Xq, Yq] = meshgrid(1:0.1:4, 1:0.1:2); % --
Mq = interp2(X. Y, M, Xq, Yq, 'linear'); % --

figure;
imagesc(Mg);
colorbar;
title("Matriz Interpolada");