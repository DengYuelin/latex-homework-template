clc,clear
t = 0:0.01:10;
% system 1
A = [-5 0;
     0  -1];
B = [3;1];
C = [7 0];
D = 0;
sys_ss_1 = ss(A,B,C,D);
[NUM, DEN] = ss2tf(A,B,C,D);
sys_ss2tf_1 = tf(NUM, DEN);

% system 2
A = [-5 0;
     0  -1];
B = [3;0];
C = [7 3];
D = 0;
sys_ss_2 = ss(A,B,C,D);
[NUM, DEN] = ss2tf(A,B,C,D);
sys_ss2tf_2 = tf(NUM, DEN);

% hand tf
NUM = 21;
DEN = [1 5];
sys_tf = tf(NUM, DEN);

[y1,t] = step(sys_ss_1,t);
[y2,t] = step(sys_ss_2,t);
[y3,t] = step(sys_ss2tf_1,t);
[y4,t] = step(sys_ss2tf_2,t);
[y5,t] = step(sys_tf,t);
plot(t,y1,'r',t,y2,'r:',t,y3,'g',t,y4,'g:',t,y5,'b','linewidth',2)
grid minor
title('Response to step')
xlabel('Time (s)')
ylabel('Amplitude')
legend('ss(1)', 'ss(2)','ss2tf(1)','ss2tf(2)','hand tf','location','best')