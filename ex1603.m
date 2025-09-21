function [z,maxerror] = ex1603(m)
    % z:乘积，maxerror:最大误差,m:阶数
    len = 4*m+2;
    a = zeros(len,1); % 被乘式系数
    a(2) = 1;
    for i=4:2:2*m+2
        a(i) = -1*a(i-2)/(i-2)/(i-1);
    end
    b = zeros(len,1); % 乘式系数
    b(1) = 1;
    for i=3:2:2*m+1
        b(i) = -1*b(i-2)/(i-2)/(i-1);
    end
    c = zeros(len,1);% 乘积系数
    c(2) = 1;
    for i=4:2:len
        c(i) = -4*c(i-2)/(i-1)/(i-2);
    end
    x = fft(a,len);
    y = fft(b,len);
    z1 = x.*y;
    z = ifft(z1); % Fourier逆变换
    maxerror = 0;
    for i=1:len
        e = abs(z(i)-c(i));
        if e > maxerror
            maxerror = e;
        end
    end
    fprintf('m = %d, 误差 = %.12f\n', m, maxerror);
end
