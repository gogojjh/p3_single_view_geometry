function [x1, x2, x3, X1, X2, X3] = splitplane(x_image, X_world)
% x_image: [u, v, 1]
% X_world: [X, Y, Z]
% xz
x1 = x_image(1:4, :); X1 = X_world(1:4, :); 
X1(:,:) = X1(:,:) ./ X1(:,2); 
% yz
x2 = x_image(5:8, :); X2 = X_world(5:8, :);
X2(:,:) = X2(:,:) ./ X2(:,1); 
% xy
x3 = x_image(9:12, :); X3 = X_world(9:12, :);
X3(:,:) = X3(:,:) ./ X3(:,3); 