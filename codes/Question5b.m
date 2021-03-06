clc,clear
t = 0:0.01:10;
%% a
NUM = [8 10];
DEN = [1 1 5 13];
sys_b_tf = tf(NUM, DEN);
[A_,B_, C_, D_] = tf2ss(NUM, DEN);
A = [0 1 0;
     0 0 1;
    -13 -5 -1];
B = [0;0;1];
C = [10 8 0];
D = 0;
sys_b_ss = ss(A,B,C,D);
sys_b_tf2ss = ss(A_,B_,C_,D_);

[y1,t] = step(sys_b_tf,t);
[y2,t] = step(sys_b_ss,t);
[y3,t] = step(sys_b_tf2ss,t);
plot(t,y1,'r',t,y2,'b:',t,y2,'g--','linewidth',2)
grid minor
title('Response to step')
xlabel('Time (s)')
ylabel('Amplitude')
legend('transfer function', 'state space','tf2ss','location','best')