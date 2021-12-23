%% 
clear; clc;
f1 = @(x,y) exp(-1*x.*(1-y./25))-((100/15)*exp(1))*(1/y);
f2 = @(x,y) exp(-1*x.*(1-y./50))-((100/15)*exp(1))*(1/y);
f3 = @(x,y) exp(-1*x.*(1-y./100))-(100/15)*exp(1)*(1/y);
f4 = @(x,y) exp(-1*x.*(1-y./200))-((100/15)*exp(1))*(1/y);
f5 = @(x,y) exp(-1*x.*(1-y./400))-((100/15)*exp(1))*(1/y);
figure
hold on
fimplicit(f1, [0 2 0 100]);
fimplicit(f2, [0 2 0 100]);
fimplicit(f3, [0 2 0 100]);
fimplicit(f4, [0 2 0 100]);
fimplicit(f5, [0 2 0 100]);
%fimplicit(@(y,x) exp(-x.*(1-y/25))-(20*exp(1))/(3*y))
axis
ax = gca; 
legend({'25','50','100','200', '400'})
hold off
%% 
%% 

t=[];
for a=0:0.1:2
    t=[t;a];
end
syms y
z1=[];
z2=[];
z3=[];
z4=[];
z5=[];
for i=0:0.1:2
    %f = @(i,y) exp(-1*i.*(1-y./400))-((100/15)*exp(1))*(1/y);
    s1=vpasolve( exp(-1*i*(1-y./25))-((100/15)*exp(1))*(1/y)==0, y, 20)
    z1=[z1; s1];
end
for i=0:0.1:2
    %f = @(i,y) exp(-1*i.*(1-y./400))-((100/15)*exp(1))*(1/y);
    s2=vpasolve( exp(-1*i*(1-y./50))-((100/15)*exp(1))*(1/y)==0, y, 20)
    z2=[z2; s2];
end
for i=0:0.1:2
    %f = @(i,y) exp(-1*i.*(1-y./400))-((100/15)*exp(1))*(1/y);
    s3=vpasolve( exp(-1*i*(1-y./100))-((100/15)*exp(1))*(1/y)==0, y, 20)
    z3=[z3; s3];
end
for i=0:0.1:2
    %f = @(i,y) exp(-1*i.*(1-y./400))-((100/15)*exp(1))*(1/y);
    s4=vpasolve( exp(-1*i*(1-y./200))-((100/15)*exp(1))*(1/y)==0, y, 20)
    z4=[z4; s4];
end
for i=0:0.1:2
    %f = @(i,y) exp(-1*i.*(1-y./400))-((100/15)*exp(1))*(1/y);
    s5=vpasolve( exp(-1*i*(1-y./400))-((100/15)*exp(1))*(1/y)==0, y, 20)
    z5=[z5; s5];
end
a1=[];
a2=[];
a3=[];
a4=[];
a5=[];
for i=1:21
    a1=[a1; 2*(1-z1(i)./25)];
end
for i=1:21
    a2=[a2; 2*(1-z2(i)./50)];
end
for i=1:21
    a3=[a3; 2*(1-z3(i)./100)];
end
for i=1:21
    a4=[a4; 2*(1-z4(i)./200)];
end
for i=1:21
    a5=[a5; 2*(1-z5(i)./400)];
end
figure
hold on
plot(t,a1);
plot(t,a2);
plot(t,a3);
plot(t,a4);
plot(t,a5);
l1=[];
l2=[];
l3=[];
l4=[];
l5=[];
legend({'25','50','100','200', '400'})
for i=1:21
    l1=[l1; (exp(0.25)-1)*a2(i)];
end
for i=1:21
    l2=[l2; (exp(0.25)-1)*a2(i)];
end
for i=1:21
   l3=[l3; (exp(0.25)-1)*a3(i)];
end
for i=1:21
    l4=[l4; (exp(0.25)-1)*a4(i)];
end
for i=1:21
    l5=[l5; (exp(0.25)-1)*a5(i)];
end
figure
hold on
plot(t,l1);
plot(t,l2);
plot(t,l3);
plot(t,l4);
plot(t,l5);
legend({'25','50','100','200', '400'})
s1=[];
s2=[];
s3=[];
s4=[];
s5=[];
legend({'25','50','100','200', '400'})
for i=1:21
    s1=[s1; 0.15*z1(i)*a1(i)*(1-exp(-0.25))];
end
for i=1:21
    s2=[s2; 0.15*z2(i)*a2(i)*(1-exp(-0.25))];
end
for i=1:21
   s3=[s3; 0.15*z3(i)*a3(i)*(1-exp(-0.25))];
end
for i=1:21
    s4=[s4; 0.15*z4(i)*a4(i)*(1-exp(-0.25))];
end
for i=1:21
    s5=[s5; 0.15*z5(i)*a5(i)*(1-exp(-0.25))];
end
figure
hold on
plot(t,s1);
plot(t,s2);
plot(t,s3);
plot(t,s4);
plot(t,s5);
legend({'25','50','100','200', '400'})
v1=[];
v2=[];
v3=[];
v4=[];
v5=[];
for i=1:21
    v1=[v1; ((a1(i)*exp(1))*(exp(t(i)*a1(i)-0.25)-exp(-0.75))/(1+t(i)*a1(i)))];
end
for i=1:21
    v2=[v2; ((a2(i)*exp(1))*(exp(t(i)*a2(i)-0.25)-exp(-0.75))/(1+t(i)*a2(i)))];
end
for i=1:21
   v3=[v3; ((a3(i)*exp(1))*(exp(t(i)*a3(i)-0.25)-exp(-0.75))/(1+t(i)*a3(i)))];
end
for i=1:21
    v4=[v4; ((a4(i)*exp(1))*(exp(t(i)*a4(i)-0.25)-exp(-0.75))/(1+t(i)*a4(i)))];
end
for i=1:21
    v5=[v5; ((a5(i)*exp(1))*(exp(t(i)*a5(i)-0.25)-exp(-0.75))/(1+t(i)*a5(i)))];
end
figure
hold on
plot(t,v1);
plot(t,v2);
plot(t,v3);
plot(t,v4);
plot(t,v5);
legend({'25','50','100','200', '400'})
