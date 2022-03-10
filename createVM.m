clc;
clear;
Rp=45; %cpu range
Rm=45; %ram range
P=1;   %probability value (0,0.25, 0.5, 0.75, 1)
nVM=200; %number of VMs

%initialization
x=zeros(1,nVM);
y=zeros(1,nVM);
vm.cpu=zeros(nVM);
vm.ram=zeros(nVM);

for i=1:nVM
  Rpi=rand()*2*Rp;
  Rmi=rand()*Rm;
  x(i)=Rpi;
  y(i)=Rmi;
  r=rand(1.0);
  if(r<P && Rpi >=Rp)||(r>=P && Rpi<Rp)
    Rmi=Rmi+Rm;
    y(i)=Rmi;
  end
end
vm.cpu=x;
vm.ram=y;  
rho=corr(vm.cpu',vm.ram')