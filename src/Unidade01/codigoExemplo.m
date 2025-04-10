clc
clear

a = [ 1 1 1 6
      1 2 4 15
      1 3 9 28];
      
plot(a(:,2), a(:,4), 'o')
hold on

s = rref(a);

x = s(:,4)

p = @(t) x(1) + x (2)*t + x(3)*t^2

fplot(p)