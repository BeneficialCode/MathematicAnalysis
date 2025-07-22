function res = integral(f,a,b,method)
% 输入
%   f是输入函数，a，b区间端点
%   method=1 梯形方法
%   method=2 Simpson方法
%   method=3 Cotes方法
% 输出
%   res近似解
switch method
    case 1
        res = (b-a)/2*(feval(f,a)+feval(f,b));
    case 2
        res = (b-a)/6*(feval(f,a)+feval(f,b)+4*feval(f,(a+b)/2));
    case 3
        res = (b-a)/90*(7*(feval(f,a)+feval(f,b))+32*(feval(f,3*a/4+b/4) ...
        +feval(f,a/4+3*b/4))+12*feval(f,(a+b)/2));
end
% 程序结束