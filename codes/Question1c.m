t = 0:0.01:10;

A = [0, 1; -2 -2];
B = [0; 1.5];
C = [1 0];
D = [0];
sys1 = ss(A,B,C,D);

A = [-2, 1; -2 0];
B = [1.5; 1.5];
C = [1 -1];
D = [0];
sys2 = ss(A,B,C,D);

[y1,t] = step(sys1,t);
[y2,t] = step(sys2,t);
plot(t,y1,'r',t,y2,'b--','linewidth',2)
grid minor
title('Response to step')
xlabel('Time (s)')
ylabel('Amplitude')
legend('y1', 'y2')