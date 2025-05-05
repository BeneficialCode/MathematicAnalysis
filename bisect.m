function res = bisect(f,a,b,delta) 
    % 输入 
    % f 已知函数,a,b初始区间端点,delta误差 
    % 输出 
    % 第一列迭代次数,第二列近似解,第三列函数值,第四列误差 
    res = []; 
    ya = feval(f,a); 
    yb = feval(f,b); 
    
    % 检查两个端点的函数值是否异号 
    if ya * yb > 0 
        error('两个端点的函数值必须异号,否则本方法无效'); 
    end 
    
    % 计算最大迭代次数 
    max1 = 1 + round((log(b - a) - log(delta)) / log(2)); 
    
    for k = 1:max1 
        c = (a + b) / 2; 
        yc = feval(f,c); 
        
        % 判断函数值是否为 0 
        if yc == 0 
            a = c; 
            b = c; 
        elseif yb * yc > 0 
            b = c; 
            yb = yc; 
        else 
            a = c; 
            ya = yc; 
        end 
        
        % 将当前迭代信息添加到结果矩阵中 
        res = [res; k, c, yc, b - a]; 
        
        % 判断误差是否小于给定阈值 
        if b - a < delta 
            break; 
        end 
    end 
    
    % 显示结果 
    for i = 1:size(res, 1) 
        fprintf('迭代次数=%u,近似解x=%3.15f,函数值y=%e,误差e=%e.\n', res(i, 1), res(i, 2), res(i, 3), res(i, 4)); 
    end 
end 