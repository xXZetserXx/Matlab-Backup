%function [ output_args ] = Induction_motor_curves( R1,X1,Xm,Rc )
%Calculate and plot the Torque vs. Speed and Current vs Speed curves
%   Detailed explanation goes here

R1 = 6.71;
R2 = R1;
X1 = 4.94;
X2 = X1;
Rc = 28.146;
Xm = 7.645;
R2=R1;
X2=X1;

RPM_range=0:1799;  %%RPM varied from 1 to 1799
S=(1800-RPM_range)/1800;   %%slip factor
w=(2*pi*RPM_range)/60;     %%

V1=120; %100 percent voltage
V2=108; %%90 percent voltage
V3=96;  %%80 percent voltage

Z_1=R1+1i*X1; %%calculate impedance 1 (R1+jX1)
Z_2=(Rc*(1i*Xm))/(Rc+(1i*Xm)); %%Calc impedance in middle branch

for n = 1:1800
    Z3(n)=R2+(i*X2)+R2*((1-S(n))/S(n));
    I1(n)=abs(V1/(((Z_2*Z3(n))/(Z_2+Z3(n)))+Z_1)*(Z_2/(Z_2+Z3(n)))); %Calculate I2 
    I2(n)=abs(V2/(((Z_2*Z3(n))/(Z_2+Z3(n)))+Z_1)*(Z_2/(Z_2+Z3(n)))); %different
    I3(n)=abs(V3/(((Z_2*Z3(n))/(Z_2+Z3(n)))+Z_1)*(Z_2/(Z_2+Z3(n)))); %voltage cases
    T1(n)=(3*(I1(n))^2*(R2/S(n))*(1-S(n)))/w(n);   %calculate Torque
    T2(n)=(3*(I2(n))^2*(R2/S(n))*(1-S(n)))/w(n);   %different voltage
    T3(n)=(3*(I3(n))^2*(R2/S(n))*(1-S(n)))/w(n);   %cases
end

%%%%%%%plot Torque Vs Speed
figure
plot(RPM_range,T1,'DisplayName','100% Voltage');
hold on
plot(RPM_range,T2,'Color',[0 1 0],'DisplayName','90% Voltage')
plot(RPM_range,T3,'Color',[1 0 0],'DisplayName','80% Voltage')
xlabel({'Machine Speed (RPM)'});
ylabel({'Torque (RPM_range)'});
title({'Torque Vs. Speed'});
legend('show');

%%%% plot Current Vs Speed
figure
plot(RPM_range,I1,'DisplayName','100% Voltage')
hold on
plot(RPM_range,I2,'Color',[0 1 0],'DisplayName','90% Voltage')
plot(RPM_range,I3,'Color',[1 0 0],'DisplayName','80% Voltage')
xlabel({'Machine Speed (RPM)'});
ylabel({'Current (Amps)'});
title({'Current Vs. Speed'});
legend('show');
hold off

%end

