clear; 
img_ori = imread('image/box.png');
figure, imshow(img_ori);
hold on;
mouse = imline(gca);
pos = floor(getPosition(mouse));
disp(pos)
plot([100,100], [200, 400], 'r-');