function drawline_vp(vp, lines, linetype)
for i=1:size(lines, 1)
    x = floor([vp(1), lines(i, 1)]);
    y = floor([vp(2), lines(i, 3)]);
    plot(x, y, linetype, 'LineWidth', 1);   
    hold on;
    x = floor([vp(1), lines(i, 2)]);
    y = floor([vp(2), lines(i, 4)]);
    plot(x, y, linetype, 'LineWidth', 1);   
    hold on;
end
