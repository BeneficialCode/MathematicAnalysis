n = 8;
aa = 0;
for i = 1:k
    aa = aa + GaussLegendre(f,n,(2*i-2)*pi,2*i*pi);
end
fprintf('计算结果：%.14f\n', aa); % 显示 14 位小数