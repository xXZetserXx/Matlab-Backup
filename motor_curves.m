function [ output_args ] = motor_curves(R1, X1, Xm, Rc)
%Calculate and output the Induction motor curves as functions of R1, R2,
%X1, X2, Xm, and Rc

R2 = R1;
X2 = X1;
RPM = 1:1799;

Slip = (1800-RPM)/1800;
wm = (2*pi*RPM)/60;
ws = wm./(1-Slip);

V1 = 120;   %100% Voltage
V2 = 108;   %90% Voltage
V3 = 96;    %80% Voltage

Z1 = R1+1i*X1;
Zm = (Rc*1i*Xm)/(Rc+ 1i*Xm);    %impedance in magnetizing branch
Z2 = R1./Slip+1i*X1;

%Calculate current going into entire circuit 
%then multiply by a curren divider for different voltages
%I2_1 =abs(V1./(((Zm*Z2)./(Zm+Z2))+Z1)*(Zm./(Zm+Z2)));
I2_1 = abs(V1./(((Zm.*Z2)./(Zm+Z2))+Z1).*(Zm./(Zm+Z2)));
I2_2 = abs(V2./(((Zm.*Z2)./(Zm+Z2))+Z1).*(Zm./(Zm+Z2)));
I2_3 = abs(V3./(((Zm.*Z2)./(Zm+Z2))+Z1).*(Zm./(Zm+Z2)));

%Pgap = I2_1.^2.*(R2./Slip)
T1=(3.*(I2_1).^2.*(R2./Slip))./ws;
T2=(3.*(I2_2).^2.*(R2./Slip))./ws;
T3=(3.*(I2_3).^2.*(R2./Slip))./ws;

figure
subplot(2,1,1)
plot(RPM, I2_1, RPM, I2_2, RPM, I2_3)
xlabel('Rotor Speed (RPM)')
ylabel('Current (A)')
legend('100% Voltage', '90% Voltage', '80% Voltage')

subplot(2,1,2)
plot(RPM, T1, RPM, T2, RPM, T3)
xlabel('Rotor Speed (RPM)')
ylabel('Torque (NM)')
legend('100% Voltage', '90% Voltage', '80% Voltage')

end