a = 2;
n = 50;
 
% 球面 
[xs, ys, zs] = sphere(n);
xs = a * xs;
ys = a * ys;
zs = a * zs;
 
% 圆柱面
theta = linspace(0, 2*pi, n);
z_cyl = linspace(-a, a, n);
[Theta, Z_cyl] = meshgrid(theta, z_cyl);
 
X_cyl = (a/2) * (1 + cos(Theta));
Y_cyl = (a/2) * sin(Theta);
Z_cyl = Z_cyl;
 
% 绘图
figure;
surf(xs, ys, zs, 'EdgeColor', 'none','FaceAlpha', 0.5);
hold on;
surf(X_cyl, Y_cyl, Z_cyl, 'EdgeColor', 'none','FaceAlpha', 0.5);

axis equal;
xlabel('x');
ylabel('y');
zlabel('z');
title('Intersection of Sphere x^2 + y^2 + z^2 = a^2 and Cylinder x^2 + y^2 = ax');
view(3);