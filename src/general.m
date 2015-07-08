function dx = general(t,x,u,param=[0 0 0 0],noise=0,seed=0)
     alpha = u(1);
     n = u(2);
     
     %control laws
     ahat = param(1);
     nhat = param(2);
     phi = param(3);
     k = param(4);
     u1 = -ahat/(1+x(2)^nhat) - x(1) - k*sat(x(1),phi);
     u2 = -ahat/(1+x(1)^nhat) - x(2) - k*sat(x(2),phi);
     
     %noise
     m = noise;
     rand("seed",t+seed);
     n1 = m*(rand-.5);
     n2 = m*(rand-.5);
     
     %system of ODEs
     dx(1) = alpha/(1+x(2)^n) - x(1) + n1 + u1;
     dx(2) = alpha/(1+x(1)^n) - x(2) + n2 + u2;
end