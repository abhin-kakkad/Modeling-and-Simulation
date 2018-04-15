import numpy as np;
from matplotlib import pyplot as plt;

t0=0;
tf=500;
dt=0.01
t=np.arange(t0,tf,dt);
n=len(t)
S=np.zeros([n]);
Sq=np.zeros([n]);
E=np.zeros([n]);
Eq=np.zeros([n]);
Iu=np.zeros([n]);
Iq=np.zeros([n]);
Id=np.zeros([n]);
D=np.zeros([n]);
R=np.zeros([n]);
pp=np.zeros([n]);
q=0
b=0.06
k=10
m=0.1775
N=10000000
p=0.2

u=0.1
v=0.16
w=0.1625

x=10000;
Sq[0]=0;
E[0]=0;
Eq[0]=0;
Iu[0]=x;
Iq[0]=0;
Id[0]=0;
D[0]=0;
R[0]=0;
pp[0]=N-x;
S[0]=N-x;

for i in range(1,n):
	if(i<3000):
		q=0
	else:
		q=0.8

	S[i]=S[i-1] + dt*(u*Sq[i-1] - q*(1-b)*k*S[i-1]*Iu[i-1]/pp[i-1] - b*(1-q)*k*S[i-1]*Iu[i-1]/pp[i-1] - q*b*k*S[i-1]*Iu[i-1]/pp[i-1] );
	Sq[i]=Sq[i-1] + dt*(q*(1-b)*k*S[i-1]*Iu[i-1]/pp[i-1] - u*Sq[i-1]);
	E[i]=E[i-1] + dt*( b*(1-q)*k*S[i-1]*Iu[i-1]/pp[i-1] - p*E[i-1]);
	Eq[i]=Eq[i-1] + dt*( b*q*k*S[i-1]*Iu[i-1]/pp[i-1] - p*Eq[i-1]);
	Iu[i]=Iu[i-1] + dt*(p*E[i-1]-w*Iu[i-1]-v*Iu[i-1]-m*Iu[i-1]);
	Iq[i]=Iq[i-1] + dt*(p*Eq[i-1]-w*Iq[i-1]-v*Iq[i-1]-m*Iq[i-1]);
	Id[i]=Id[i-1] + dt*(w*Iq[i-1]+w*Iu[i-1]-v*Id[i-1]-m*Id[i-1]);
	D[i]=D[i-1] + dt*m*(Iu[i-1]+Iq[i-1]+Id[i-1]);
	R[i]=R[i-1] + dt*v*(Iu[i-1]+Iq[i-1]+Id[i-1]);	
	pp[i]=pp[i-1] - D[i] + D[i-1];



plt.plot(t,D,'-',label = "Delay=30 days")

for i in range(1,n):
	if(i<6000):
		q=0
	else:
		q=0.8

	S[i]=S[i-1] + dt*(u*Sq[i-1] - q*(1-b)*k*S[i-1]*Iu[i-1]/pp[i-1] - b*(1-q)*k*S[i-1]*Iu[i-1]/pp[i-1] - q*b*k*S[i-1]*Iu[i-1]/pp[i-1] );
	Sq[i]=Sq[i-1] + dt*(q*(1-b)*k*S[i-1]*Iu[i-1]/pp[i-1] - u*Sq[i-1]);
	E[i]=E[i-1] + dt*( b*(1-q)*k*S[i-1]*Iu[i-1]/pp[i-1] - p*E[i-1]);
	Eq[i]=Eq[i-1] + dt*( b*q*k*S[i-1]*Iu[i-1]/pp[i-1] - p*Eq[i-1]);
	Iu[i]=Iu[i-1] + dt*(p*E[i-1]-w*Iu[i-1]-v*Iu[i-1]-m*Iu[i-1]);
	Iq[i]=Iq[i-1] + dt*(p*Eq[i-1]-w*Iq[i-1]-v*Iq[i-1]-m*Iq[i-1]);
	Id[i]=Id[i-1] + dt*(w*Iq[i-1]+w*Iu[i-1]-v*Id[i-1]-m*Id[i-1]);
	D[i]=D[i-1] + dt*m*(Iu[i-1]+Iq[i-1]+Id[i-1]);
	R[i]=R[i-1] + dt*v*(Iu[i-1]+Iq[i-1]+Id[i-1]);	
	pp[i]=pp[i-1] - D[i] + D[i-1];



plt.plot(t,D,'-',label = "Delay=60 days")

for i in range(1,n):
	if(i<9000):
		q=0
	else:
		q=0.8

	S[i]=S[i-1] + dt*(u*Sq[i-1] - q*(1-b)*k*S[i-1]*Iu[i-1]/pp[i-1] - b*(1-q)*k*S[i-1]*Iu[i-1]/pp[i-1] - q*b*k*S[i-1]*Iu[i-1]/pp[i-1] );
	Sq[i]=Sq[i-1] + dt*(q*(1-b)*k*S[i-1]*Iu[i-1]/pp[i-1] - u*Sq[i-1]);
	E[i]=E[i-1] + dt*( b*(1-q)*k*S[i-1]*Iu[i-1]/pp[i-1] - p*E[i-1]);
	Eq[i]=Eq[i-1] + dt*( b*q*k*S[i-1]*Iu[i-1]/pp[i-1] - p*Eq[i-1]);
	Iu[i]=Iu[i-1] + dt*(p*E[i-1]-w*Iu[i-1]-v*Iu[i-1]-m*Iu[i-1]);
	Iq[i]=Iq[i-1] + dt*(p*Eq[i-1]-w*Iq[i-1]-v*Iq[i-1]-m*Iq[i-1]);
	Id[i]=Id[i-1] + dt*(w*Iq[i-1]+w*Iu[i-1]-v*Id[i-1]-m*Id[i-1]);
	D[i]=D[i-1] + dt*m*(Iu[i-1]+Iq[i-1]+Id[i-1]);
	R[i]=R[i-1] + dt*v*(Iu[i-1]+Iq[i-1]+Id[i-1]);	
	pp[i]=pp[i-1] - D[i] + D[i-1];

plt.plot(t,D,'-',label = "Delay=90 days")

plt.suptitle('Death Rate with Delay in Quarantine and Isolation Measures')




plt.xlabel("Time(in days)")

plt.ylabel("No of people")
plt.legend()
plt.grid(True)
plt.show()
