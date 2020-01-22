clc;
close all;
h=6.63e-34;c=3e8;kb=8.316/6.023e23;q=1.6e-19;T=300;
data=xlsread('AM_1_5','Sheet1','A1:B91');
%data=xlsread('Ledtech_Par_20','Sheet1','A1:B301');
Pin=1000; %For AM_1.5
%Pin=10; %For Ledtech Par 20
phi=data(:,2);
lambda=data(:,1);
Eg=0.5:0.1:3.5;
lambdag=(h*c)./Eg/q*1e9;
qef=zeros(size(lambda));
for j=1:length(Eg)
    %qef(find(lambda<=lambdag(j)))=1;
    %lam=lambda.*qef
    %Iph(j)=q*trapz((lambda.*qef),(phi.*qef));
    k=qef(find(lambda<=lambdag(j)));
    [l,m]=size(k);
    lambda1=lambda(1:l,1);phi1=phi(1:l,1);
    Iph(j)=q*trapz(lambda1,phi1)
end
%k=qef(find(lambda<=lambdag(30)));
%lambda1=lambda(1:(size(k)+1),1);phi1=phi(1:(size(k)+1),1);
%Iph=q*trapz(lambda1,phi1)
%Iph=q*trapz
