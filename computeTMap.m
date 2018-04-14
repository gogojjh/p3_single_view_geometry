function texture_map = computeTMap(x_image, X_world, H, img, c)
if c == 1
    X0 = floor(min(X_world(:,1))); X1 = floor(max(X_world(:,1)));
    Y0 = floor(min(X_world(:,2))); Y1 = floor(max(X_world(:,2)));
    texture_map = imresize(img, [Y1-Y0+1, X1-X0+1]);
    % texture_map = zeros(Y1-Y1+1, X1-X0+1, size(img, 3));
    for j = Y1:-1:Y0 
        for k = X0:X1
            x = inv(H) * [k; j; 1];
            x = x / x(3);
            x_floor = floor(x);
            if ((x_floor(1) > size(img,2)-1) || (x_floor(1) <= 0) || (x_floor(2) > size(img,1)-1) || (x_floor(2) <= 0))
                continue;
            end
            dx = x(1) - x_floor(1);
            dy = x(2) - x_floor(2);
            p = (1-dx)*(1-dy)*img(x_floor(2), x_floor(1), :) ...
                    + dx*(1-dy)*img(x_floor(2)+1, x_floor(1), :) ...
                    + (1-dx)*dy*img(x_floor(2), x_floor(1)+1, :) ...
                    + dx*dy*img(x_floor(2)+1, x_floor(1)+1, :);
            texture_map(Y1-j+1, k-X0+1, :) = p;
        end
    end
elseif c == 2
    X0 = floor(min(X_world(:,1))); X1 = floor(max(X_world(:,1)));
    Y0 = floor(min(X_world(:,2))); Y1 = floor(max(X_world(:,2)));
    texture_map = imresize(img, [Y1-Y0+1, X1-X0+1]);
    % texture_map = zeros(Y1-Y1+1, X1-X0+1, size(img, 3));
    for j = Y1:-1:Y0
        for k = X1:-1:X0
            x = inv(H) * [k; j; 1];
            x = x / x(3);
            x_floor = floor(x);
            if ((x_floor(1) > size(img,2)-1) || (x_floor(1) <= 0) || (x_floor(2) > size(img,1)-1) || (x_floor(2) <= 0))
                continue;
            end
            dx = x(1) - x_floor(1);
            dy = x(2) - x_floor(2);
            p = (1-dx)*(1-dy)*img(x_floor(2), x_floor(1), :) ...
                    + dx*(1-dy)*img(x_floor(2)+1, x_floor(1), :) ...
                    + (1-dx)*dy*img(x_floor(2), x_floor(1)+1, :) ...
                    + dx*dy*img(x_floor(2)+1, x_floor(1)+1, :);
            texture_map(Y1-j+1, X1-k+1, :) = p;
        end
    end    
    
elseif c == 3
    X0 = floor(min(X_world(:,1))); X1 = floor(max(X_world(:,1)));
    Y0 = floor(min(X_world(:,2))); Y1 = floor(max(X_world(:,2)));
    texture_map = imresize(img, [X1-X0+1, Y1-Y0+1]);
    % texture_map = zeros(Y1-Y1+1, X1-X0+1, size(img, 3));
    for j = X1:-1:X0
        for k = Y1:-1:Y0
            x = inv(H) * [j; k; 1];
            x = x / x(3);
            x_floor = floor(x);
            if ((x_floor(1) > size(img,2)-1) || (x_floor(1) <= 0) || (x_floor(2) > size(img,1)-1) || (x_floor(2) <= 0))
                continue;
            end
            dx = x(1) - x_floor(1);
            dy = x(2) - x_floor(2);
            p = (1-dx)*(1-dy)*img(x_floor(2), x_floor(1), :) ...
                    + dx*(1-dy)*img(x_floor(2)+1, x_floor(1), :) ...
                    + (1-dx)*dy*img(x_floor(2), x_floor(1)+1, :) ...
                    + dx*dy*img(x_floor(2)+1, x_floor(1)+1, :);
            texture_map(X1-j+1, Y1-k+1, :) = p;
        end
    end    
end
