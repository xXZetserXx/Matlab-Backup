function[ output_args ] = Plot_measured_points()
%plot the points recorded in the lab
I=[1.2, 1.25, 1.3, 1.35, 1.4, 1.45, 1.5];

%100% Voltage
RPM1 = [1724 1718 1712 1705 1698 1691 1687];
T1 = [.93 1.02 1.12 1.21 1.32 1.41 1.49];

%90% Voltage
RPM2 = [1705 1699 1690 1688 1681 1674 1667];
T2 = [.95 1.05 1.13 1.28 1.35 1.41 1.47];

%80% Voltage
RPM3 = [1685 1677 1670 1662 1653 1645 1637];
T3 = [1.05 1.11 1.18 1.23 1.15 1.21 1.22];

figure
subplot(2,1,1)
plot(RPM1,T1, RPM2,T2, RPM3,T3)
xlabel('Rotor Speed (RPM)')
ylabel('Torque (NM)')
legend('100% Voltage', '90% Voltage', '80% Voltage')

subplot(2,1,2)
plot(RPM1,I, RPM2,I, RPM3,I)
xlabel('Rotor Speed (RPM)')
ylabel('Current (A)')
legend('100% Voltage', '90% Voltage', '80% Voltage')