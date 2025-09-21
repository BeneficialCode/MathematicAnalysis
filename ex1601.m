function ex1601(N)
    t=0:N-1;
    x = randn(N,1)*20; % randn
    y = fft(x,N);
    z = abs(y);
    plot(t,x,'+',t,z,'o');
    delta = input('Enter delta value: ');
    for i=0:N-1
        if z(i+1)<delta
            y(i+1)=0;
        end
    end
    z = real(ifft(y));
    plot(t,x,'+',t,z,'o');