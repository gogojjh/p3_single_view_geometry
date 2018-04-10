function pos = addnewline(linetype, linewidth, axes)
% pos = [x0, x1, y0, y1]
mouse = imline(gca);
pos = roundn(getPosition(mouse), -3);
pos = reshape(pos, 1, 4);
fprintf("[INFO] New line on %c axes (x0:%d x1:%d y0:%d y1:%d)\n", axes, pos);
x = floor([pos(1), pos(2)]);
y = floor([pos(3), pos(4)]);
plot(x, y, linetype, 'LineWidth', linewidth);   
hold on;
