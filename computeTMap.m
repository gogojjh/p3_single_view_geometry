function texture_map = computeTMap(X, H, img)
X0 = floor(min(X(:,1))); X1 = floor(max(X(:,1)));
Y0 = floor(min(X(:,2))); Y1 = floor(max(X(:,2)));
texture_map = zeros(Y0, X0, size(img, 3));
for j = Y0:Y1
    for k = X0:X1
        x = H * [k; j; 1];
        x = x / x(normal_item);
        x_floor = floor(x);
        dx = x(1) - x_floor(1);
        dy = x(2) - x_floor(2);
        texture_map(k-X0+1, j-Y0+1, :) = (1-dx)*(1-dy)*img(x_floor(1), x_floor(2), :) ...
                + dx*(1-dy)*img(x_floor(1)+1, x_floor(2), :) ...
                + (1-dx)*dy*img(x_floor(1), x_floor(2)+1, :) ...
                + dx*dy*img(x_floor(1)+1, x_floor(2)+1, :);
    end
end
