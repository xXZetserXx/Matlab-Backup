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
plot(I, RPM1, I, RPM2, I, RPM3)
xlabel('Current I1 (A)')
ylabel('Speed (RPM)')
figure
plot(I, T1, I, T2, I, T3)
xlabel('Current I1 (A)')
ylabel('Torque')