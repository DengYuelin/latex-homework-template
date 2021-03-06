clc,clear
t = 0:0.01:10;
%% a
NUM = 100;
DEN = [1 20 10 7 100];
sys_a_tf = tf(NUM, DEN);
[A_, B_, C_, D_] = tf2ss(NUM, DEN);
A = [0 1 0 0;
     0 0 1 0;
     0 0 0 1;
    -100 -7 -10 -20];
B = [0;0;0;1];
C = [100 0 0 0];
D = 0;
sys_a_ss = ss(A,B,C,D);
sys_a_tf2ss = ss(A_,B_,C_,D_);

[y1,t] = step(sys_a_tf,t);
[y2,t] = step(sys_a_ss,t);
[y3,t] = step(sys_a_tf2ss,t);
plot(t,y1,'r',t,y2,'b:',t,y2,'g--','linewidth',2)
grid minor
title('Response to step')
xlabel('Time (s)')
ylabel('Amplitude')
legend('transfer function', 'state space','tf2ss')