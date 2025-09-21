function t = ex1602(N)
    x = randn(N,1)*20; % randn
    y = randn(N,1)*20; % randn
    tic % 启动计时
    for i=0:N-1
        z(i+1)=0;
        for j=0:i
            z(i+1)=z(i+1)+x(j+1)*y(i-j+1);
        end
        for j=i+1:N-1
            z(i+1)=z(i+1)+x(j+1)*y(N+i-j+1);
        end
    end
    t1 = toc; % 结束计时
    tic;
    x1 = fft(x,N);
    y1 = fft(y,N);
    z1 = ifft(x1.*y1);
    t2 = toc;
    t = [t1,t2];
    if t1 > t2
        fprintf('FFT方法比直接卷积更快。\n');
    else
        fprintf('直接卷积比FFT方法更快。\n');
    end
    fprintf('直接卷积时间: %.6f 秒\nFFT卷积时间: %.6f 秒\n', t1, t2);
end