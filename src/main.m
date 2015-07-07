pkg load odepkg

%Solve Original System
%x0 = [1,1];
%f = @(t,x)original(t,x,[150 2 3.2]);
%[t,y] = ode45(f, 0:.1:20, x0);

u = [150,2];
params = [u 1];
xd = [20 4];
noise = 0;
seed = 0;
%x0 = [1,1,1];
%f = @(t,x)known(t,x,u,params,xd,noise,seed);
[t,y] = ode45(f, 0:.1:20, x0);

plot(t,y(:,1),'--g','LineWidth',2);
hold on
plot(t,y(:,2),'b','LineWidth',2);
hold off

%plot(t,y(:,3),'r','LineWidth',2);hold on;plot(t,y(:,1)-xd(1),'b','LineWidth',2);plot(t,-y(:,3),'r','LineWidth',2);hold off

pkg unload odepkg