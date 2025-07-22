function res = simpson(f,n,a,b)
%   Simpson公式数值积分
%输入
%   f是输入函数，n区间等分数，a，b区间端点
%输出
%   res近似解
h = (b-a)/n;
res = feval(f,a)+feval(f,b);
x = a;
for k=1:n-1
    y = x + h/2;
    x = x + h;
    res = res + 2*feval(f,x)+4*feval(f,y);
end
y = x + h/2;
res = (res + 4*feval(f,y))*h/6;
fprintf('结果是：%.14f\n', res); % 显示 14 位小数
% 程序结束