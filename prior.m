clc;
clear all;
close all;
%Probablity Arrays
D=[0.6;0.4];
I=[0.7;0.3 ];
P=zeros(48,1);
%Probablity Matrices
cpdG=[0.3 0.4 0.3; 0.05 0.25 0.7; 0.9 0.08 0.02; 0.5 0.3 0.2];
cpdL=[0.1 0.9;0.4 0.6;0.99 0.01];
cpdS=[0.95 0.05; 0.2 0.8];
nS=5*10000;%No.of.nodes*no.of.samples
R=rand(1,nS);%generating random values
Sample=[];
for i=1:5:nS
    tmp(1)=getVal(D,R(i));%finding the value with the help of random numbers generated
    tmp(2)=getVal(I,R(i+1));
    tmp(3)=getVal(cpdG((tmp(2)-1)*2+tmp(1),:),R(i+2));
    tmp(4)=getVal(cpdS(tmp(2),:),R(i+3));
    tmp(5)=getVal(cpdL(tmp(3),:),R(i+4));
    T(1)="D"+tmp(1);
    T(2)="I"+tmp(2);
    T(3)="G"+tmp(3);
    T(4)="S"+tmp(4);
    T(5)="L"+tmp(5);    
    Sample=[Sample;T];%insert the samples
end
Sample
D1=length(find(Sample=='D1'))/length(Sample)%P(D1)
function V=getVal(P,r)
   V=-1;
   %disp(P)
   if(sum(P)==1)
       C=zeros(length(P));
       C(1)=P(1);
       for i=2:length(C)
           C(i)=P(i)+C(i-1);
       end
       for i=1:length(C)
           if(r<C(i))
               V=i;
               break
           end
       end
   end
end