function res = trapezoid(f,n,a,b)
%   梯形公式数值积分
%输入
%   f是输入函数，n区间等分数，a，b区间端点
%输出
%   res近似解
h = (b-a)/n;
res = feval(f,a)+feval(f,b);
x = a;
for k=1:n-1
    x = x +h;
    res = res + 2*feval(f,x);
end
res = res*h/2;
fprintf('计算结果：%.14f\n', res);
% 程序结束