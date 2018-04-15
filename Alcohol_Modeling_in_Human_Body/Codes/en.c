#include<stdio.h>
int main()
{
    float a,b,c,x,y,z,h,t,k1,k2;
    printf("\nEnter x0,y0,z0,h,xn: ");
    scanf("%f%f%f%f%f",&a,&b,&c,&h,&t);
    x=a;
    y=b;
    c=z;  
    //printf("\n  x\t  y\n");

    float M=0.005;
    float K3=0.014;
    float K1, K2;
    K1=6;
    K2=6;
    //float I=0.07371;

    FILE *fp;
    fp=fopen("cgi.dat","w");

    FILE *fp1;
    fp1=fopen("cbs.dat","w");

    while(x<=t)
    {

        float f2,f1;
        //f1=I-K1*y;
        f1=-K1*y;
        f2=K2*y-((K3*z)/(z+M));
        
        k1=h*f1;
        k2=h*f2;
        y=y+k1;
        z=z+k2;
        x=x+h;
        fprintf(fp,"%0.3f\t%0.3f\n",x,y);
        fprintf(fp1,"%0.3f\t%0.3f\n",x,z);
   }     
    fclose(fp);
    fclose(fp1);
    return 0;
}