function dx = original(t,x,u,noise=0,seed=0)
     alpha = u(1);
     n = u(2);
     I = u(3); 
     
     %noise
     m = noise;
     rand("seed",t+seed);
     n1 = m*(rand-.5);
     n2 = m*(rand-.5);
     
     %system of ODEs
     dx(1) = alpha/(1 +   x(2)^n) - x(1);
     dx(2) = alpha/(1 + I*x(1)^n) - x(2);
end