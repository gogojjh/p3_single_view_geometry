function drawallline(line_xaxes, line_yaxes, line_zaxes)
for i=1:size(line_xaxes, 1)
    x = [line_xaxes(i, 1), line_xaxes(i, 2)];
    y = [line_xaxes(i, 3), line_xaxes(i, 4)];
    plot(x, y, 'r-', 'LineWidth', 3);   
    hold on;
end
for i=1:size(line_yaxes, 1)
    x = [line_yaxes(i, 1), line_yaxes(i, 2)];
    y = [line_yaxes(i, 3), line_yaxes(i, 4)];    
    plot(x, y, 'g-', 'LineWidth', 3);
    hold on;
end
for i=1:size(line_zaxes, 1)
    x = [line_zaxes(i, 1), line_zaxes(i, 2)];
    y = [line_zaxes(i, 3), line_zaxes(i, 4)];    
    plot(x, y, 'b-', 'LineWidth', 3);   
    hold on;
end
