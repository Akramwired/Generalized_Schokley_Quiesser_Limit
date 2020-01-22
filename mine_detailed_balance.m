clc;
close all;
h=6.63e-34;c=3e8;kb=8.316/6.023e23;q=1.6e-19;T=300;
data=xlsread('AM_1_5','Sheet1','A1:B91');
%data=xlsread('AM_1_5_whole','Sheet1','A1:B2002');
%data=xlsread('Sylvania_Incandescent','Sheet1','A1:B300');
%data=xlsread('Halogen_lamp','Sheet1','A1:B289');
%data=xlsread('Incandescent_lamp','Sheet1','A1:B531');
%data=xlsread('White_LED_15W','Sheet1','A1:B701');
Pin=1000; %For AM_1.5 & White LED 15W
%Pin=2.5; %For Ledtech Par 20 & all other LED Bulbs
%Pin=10.01391; %For Halogen_lamp
%Pin=10.22; %For Incandescent_lamp
phi=data(:,2);
lambda=data(:,1);
%Iph=q*trapz(lambda,phi);
%Isc=Iph;
Eg=0.5:0.1:3.5;
qef=zeros(size(lambda));
lambdag=(h*c)./Eg/q*1e9;
%lambdag=lambda1.*1e9;
for j=1:length(Eg)
  k=qef(find(lambda<=lambdag(j)));
  [l,m]=size(k);
  lambda1=lambda(1:l,1);phi1=phi(1:l,1);
  Iph(j)=q*trapz(lambda1,phi1);
  Isc(j)=Iph(j);
  Io(j)=q*(2*pi*kb*T)/(h^3*c^2)*((Eg(j)*q+kb*T)^2)*(exp(-(Eg(j)*q/(kb*T))));
  Voc(j)=(kb*T)*log((Iph(j)/Io(j))+1)/q;
  voc(j)=Voc(j)/(kb*T/q);
  FF(j)=(voc(j)-log(voc(j)+0.72))/(voc(j)+1);
  n(j)=(Voc(j)*Isc(j)*FF(j))/Pin;
end
plot(Eg,n);