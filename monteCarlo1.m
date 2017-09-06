function [prob1,prob2,prob3]=monteCarlo1(N)
number1=0;
number2=0;
number3=0;
for i=1:N
A=zeros(26,16);
B=zeros(5,16);
B(1:5,14:16)=5;
    for j=1:26
        m=randperm(16,9);
        c=A(j,m);
        c(1:3)=c(1:3)+5;
        c(4:6)=c(4:6)+2;
        c(7:9)=c(7:9)+1;
        A(j,m)=c;
    end
    %%%%%%%%  
    for h=1:5
        s=randperm(13,6);
        e=B(h,s);
        e(1:3)=e(1:3)+2;
        e(4:6)=e(4:6)+1;
        B(h,s)=e;
    end
    tps=sum(A)+sum(B);
    [f_result,ind]=sort(tps);
    winner=ind(:,9:16);
    number1=number1+ismember(14,winner);
    number2=number2+ismember(15,winner);
    number3=number3+ismember(16,winner);
end
prob1=number1/N;
prob2=number2/N;
prob3=number3/N;