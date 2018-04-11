function drawreferpoint(refer_points, linetype, linewidth, fontsize)
if isempty(refer_points)
    return
end
text(refer_points(1,1), refer_points(1,2), 'o', ...
    'Color', 'w', 'FontSize', fontsize); hold on;
refer_points_text = ['X', 'Y', 'Z'];
for i = 2:size(refer_points, 1)
    x = [refer_points(1,1), refer_points(i,1)];
    y = [refer_points(1,2), refer_points(i,2)];
    plot(x, y, linetype, 'LineWidth', linewidth); hold on;
    text(refer_points(i,1), refer_points(i,2), refer_points_text(i-1), ...
        'Color', 'w', 'FontSize', fontsize); hold on;
end