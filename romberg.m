function res = romberg(f,a,b,err)
% Romberg方法数值积分
% 输入
%   f是输入函数，a，b区间端点，err精度
% 输出
%   res近似解
m = 1;
T = trapezoid(f,m,a,b);
for k=2:20
    m = 2*m;
    s = trapezoid(f,m,a,b);
    T = [s,T]; s = T(k);
    for p=1:k-1
        T(p+1) = (4^p * T(p) - T(p+1)) / (4^p - 1);
    end
    if abs(s-T(k)) < err,break,end
end
res = [k,T(k)];
% 显示结果
fprintf(1,'迭代次数 = %u,近似值 = %.14f\n',res);
% 程序结束
