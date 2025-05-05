function res = Newton1(n, A, tor, ma)
% 输入参数说明 
% n: 方程阶数（如求n次方根）
% A: 常数项
% tor: 容许误差 
% ma: 最大迭代次数 

% 检查输入有效性
if n == 0
    error('n 不能为 0');
end

% 初始化 
a = 1;


% 如果 n 为负数，调整为求正数次方根的倒数
isNegativeN = false;
if n < 0
    n = abs(n);
    isNegativeN = true;
end

% 牛顿迭代循环 
for k = 1:ma 
    % 计算下一次迭代值
    b = (n-1)/n * a + A/n / a^(n-1);
    err = abs(b - a);
    
    % 更新近似值并检查终止条件 
    if err < tor
        break;
    end
    a = b;
end 

% 检查是否达到最大迭代次数
if k == ma && err >= tor
    warning('达到最大迭代次数，未收敛');
end

% 如果 n 是负数，取倒数
if isNegativeN
    a = 1 / a;
end

% 组合输出结果
res = [k, a, err];

% 显示结果 
fprintf('迭代次数 = %d, 近似解 = %.10e, 误差 = %.1e.\n', k, a, err);
end