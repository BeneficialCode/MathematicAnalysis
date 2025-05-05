function res = Newton(f,df,a,tor,ma) 
    % 输入 
    % f是输入函数,df是f的导函数,a是初值,tor是精度，ma是最大迭代次数 
    % 输出 
    % a近似解,err误差估计,k迭代次数,y函数值 
    y = feval(f,a); 
    for k = 1:ma 
        df_val = feval(df,a); 
        % 检查导数是否为零 
        if df_val == 0 
            fprintf('导数为零，无法继续迭代。\n'); 
            res = [k,a,y,NaN]; 
            fprintf(1,'迭代次数=%u，近似解x=%3.15f,函数值y=%e,误差e=%e.\n',[k,a,y,NaN]); 
            return; 
        end 
        b = a - y/df_val; 
        err = abs(b - a); 
        a = b; 
        y = feval(f,a); 
        if err < tor 
            break; 
        end 
    end 
    % 检查是否达到最大迭代次数 
    if k == ma 
        fprintf('已达到最大迭代次数，可能未收敛。\n'); 
    end 
    res = [k,a,y,err]; 
    % 显示结果 
    fprintf(1,'迭代次数=%u，近似解x=%3.15f,函数值y=%e,误差e=%e.\n',[k,a,y,err]); 
end 