function dx = varyingparams(t,x,u,ctrlparam=[0 0 0 0], xd = [0 0],noise=0,seed=0)
     alpha = u(1)+ 25*sin(3 *t);
     n = u(2); + 1*cos(.5*t);
      
     %control laws
     ahat = ctrlparam(1);
     nhat = ctrlparam(2);
     k = ctrlparam(3);
     nmax = noise*(.5);
     sa = x(1)-xd(1);
     sb = x(2)-xd(2);
     u1 = -ahat/(1+x(2)^nhat) + x(1) - nmax - k*sat(sa,1);
     u2 = -ahat/(1+x(1)^nhat) + x(2) - nmax - k*sat(sb,1);
     
     %noise
     m = noise;
     rand("seed",t+seed);
     n1 = m*(rand-.5);
     n2 = m*(rand-.5);
     
     %system of ODEs
     dx(1) = alpha/(1+x(2)^n) - x(1) + n1 + u1;
     dx(2) = alpha/(1+x(1)^n) - x(2) + n2 + u2;
     dx(3) = u1;
     dx(4) = u2;
end