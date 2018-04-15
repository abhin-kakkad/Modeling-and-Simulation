import numpy as np;
import matplotlib.pyplot as plt;

t0=0;
tf=200;
dt=0.01
t=np.arange(t0,tf,dt);
n=len(t)

Sh=np.zeros([n])
Ih=np.zeros([n])
Ah=np.zeros([n])

Sv=np.zeros([n])
Iv=np.zeros([n])

Nh=300
Mh=300
Sh[0]=Nh
Ih[0]=1
Ah[0]=0

Sv[0]=Mh
Iv[0]=0

birth=0.01
death=0.01
alpha=0.005
gamma=0.3
delta=0.01
a=0.3
b1=0.3

k=0.01

for i in range(1,n):

	Sh[i]=Sh[i-1] + dt*(-(a*Iv[i-1]*Sh[i-1])/Nh + gamma*Ih[i-1] -k)
	Ih[i]=Ih[i-1] + dt*((a*Iv[i-1]*Sh[i-1])/Nh - (alpha+gamma+delta)*Ih[i-1])
	Ah[i]=Ah[i-1] + dt*(delta*Ih[i-1] + k)
	Sv[i]=Sv[i-1] + dt*(birth*Mh - (a*Sv[i-1]*Ih[i-1])/Nh - death*Sv[i-1] )
	Iv[i]=Iv[i-1] + dt*((a*Sv[i-1]*Ih[i-1])/Nh - death*Iv[i-1] )

plt.plot(t,Sh,'-',label = "Susceptible People")
plt.plot(t,Ih,'-',label = "Infected People")
plt.plot(t,Ah,'-',label = "Immune People")
#plt.plot(t,Sv,'-',label = "Susceptible Mosquitoes")
#plt.plot(t,Iv,'-',label = "Infected Mosquitoes")


plt.suptitle('Malaria Model')
axes = plt.gca()
axes.set_ylim([0,400])
plt.xlabel("Time(in days)")
plt.ylabel("Population")
plt.legend()
plt.grid(True)
plt.show()
