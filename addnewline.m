function pos = addnewline(linetype, linewidth, axes)
% pos = [x0, x1, y0, y1]
mouse = imline(gca);
pos = floor(getPosition(mouse));
pos = reshape(pos, 1, 4);
fprintf("[INFO] New line on %c axes (x0:%d x1:%d y0:%d y1:%d)\n", axes, pos);
x = [pos(1), pos(2)];
y = [pos(3), pos(4)];
plot(x, y, linetype, 'LineWidth', linewidth);   
hold on;
