% original system
t = 0:0.01:10;
J = 1;
c = 2;
k_theta = 5;
K = 0.1; % step input amplitude

A = [0, 1; -(k_theta/J) -(c/J)];
B = [0; 1/J];
C = [1 0];
D = [0];
sys1 = ss(A,B,C,D) * K;

% new system
k_1 = 27;
k_2 = 6;
K = 0.64;
A = [0, 1; -(k_theta+k_1)/J -(c+k_2)/J];
B = [0; 1/J];
C = [1 0];
D = [0];
sys2 = ss(A,B,C,D) * K;

% plot step responce
[y1,t] = step(sys1,t);
[y2,t] = step(sys2,t);
plot(t,y1,'r',t,y2,'b--','linewidth',2)
grid minor
title('Response to step')
xlabel('Time (s)')
ylabel('Amplitude')
legend('y1', 'y2')