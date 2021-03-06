t = 0:0.01:10;
m = 10;
c = 20;
k = 40;
K = 0.2; % step input amplitude

A = [0, 1; -(k/m) -(c/m)];
B = [c/m; -(c/m)^2];
C = [1 0];
D = [0];
sys = ss(A,B,C,D) * K;
step(sys,t)