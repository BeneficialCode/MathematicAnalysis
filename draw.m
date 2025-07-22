a = 1; % 设定圆柱半径 
figure('Position', [100 100 800 600]); % 设置图形窗口大小 
 
% 绘制第一个圆柱面：x²+y²=a²（蓝色，透明度0.5） 
fimplicit3(@(x,y,z) x.^2 + y.^2 - a^2, ... 
    [-1.5*a 1.5*a -1.5*a 1.5*a -1.5*a 1.5*a], ... 
    'FaceColor', 'b', 'FaceAlpha', 0.5); 
hold on;
 
% 绘制第二个圆柱面：x²+z²=a²（红色，透明度0.5） 
fimplicit3(@(x,y,z) x.^2 + z.^2 - a^2, ... 
    [-1.5*a 1.5*a -1.5*a 1.5*a -1.5*a 1.5*a], ... 
    'FaceColor', 'r', 'FaceAlpha', 0.5); 
hold off;
 
% 设置图形属性 
xlabel('x', 'FontSize', 12); 
ylabel('y', 'FontSize', 12); 
zlabel('z', 'FontSize', 12); 
title(sprintf('Intersection of Cylinders: $x^2+y^2=%d^2$ and $x^2+z^2=%d^2$', a, a), ... 
    'FontSize', 14, 'Interpreter', 'latex'); 
grid on;
view(30, 30); % 设置视角（ azimuth=30°, elevation=30°）
axis equal; % 坐标轴等比例显示 