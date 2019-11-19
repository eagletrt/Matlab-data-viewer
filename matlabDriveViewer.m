%   ______          _____ _      ______   _______ _____ _______ 
%  |  ____|   /\   / ____| |    |  ____| |__   __|  __ \__   __|
%  | |__     /  \ | |  __| |    | |__       | |  | |__) | | |   
%  |  __|   / /\ \| | |_ | |    |  __|      | |  |  _  /  | |   
%  | |____ / ____ \ |__| | |____| |____     | |  | | \ \  | |   
%  |______/_/    \_\_____|______|______|    |_|  |_|  \_\ |_|   

clc
close all
clear all

cd('/Users/cristianostrobbe/Documents/MATLAB/MatlabDrive/SpadaLog')

%% Load data

% % CSV Log
% acceleration = readmatrix('sensorlog_accel_20191119_150244');
% angVelocity  = readmatrix('sensorlog_angvel_20191119_150244');
% orientation  = readmatrix('sensorlog_orient_20191119_150244');
% positions    = readmatrix('sensorlog_pos_20191119_150244');

load('spadaLog.mat')

%%  _____  _    _  ____  _   _ ______ 
%  |  __ \| |  | |/ __ \| \ | |  ____|
%  | |__) | |__| | |  | |  \| | |__   
%  |  ___/|  __  | |  | | . ` |  __|  
%  | |    | |  | | |__| | |\  | |____ 
%  |_|    |_|  |_|\____/|_| \_|______|
%
%% Galaxy S6
%
%  Front camera
%   ___________
%  |   |_o_|   |
%  |           |
%  |           |
%  |   Front   |
%  |           |
%  |           |
%  |___________|
%
%------ IMU ----------------%
% (Pitch)     o Z (Azimuth) |
%   X  <---+    (pointing   |
%          |     as camera) |
%          |                |
%          v                |
%                           |
%          Y  (Roll)        |
%---------------------------%
 
%%  _____ __  __ _    _ 
%  |_   _|  \/  | |  | |
%    | | | \  / | |  | |
%    | | | |\/| | |  | |
%   _| |_| |  | | |__| |
%  |_____|_|  |_|\____/ 
%                       
%% Plot accelerations
clc
close all

figure
subplot(1,3,1)
plot(Acceleration.Timestamp, Acceleration.X)
title('ax')
xlabel('Global time')
ylabel('ax [m/s^2]')
grid on
subplot(1,3,2)
plot(Acceleration.Timestamp, Acceleration.Y)
title('ay')
xlabel('Global time')
ylabel('ay [m/s^2]')
grid on
subplot(1,3,3)
plot(Acceleration.Timestamp, Acceleration.Z)
title('az')
xlabel('Global time')
ylabel('az [m/s^2]')
grid on

%%   _______     _______   ____  
%   / ____\ \   / /  __ \ / __ \ 
%  | |  __ \ \_/ /| |__) | |  | |
%  | | |_ | \   / |  _  /| |  | |
%  | |__| |  | |  | | \ \| |__| |
%   \_____|  |_|  |_|  \_\\____/ 
%
%% Plot orientation
clc
close all

figure
subplot(1,3,1)
plot(Orientation.Timestamp, Orientation.X)
title('Azimuth')
xlabel('Global time')
ylabel('Azimuth [deg]')
grid on
subplot(1,3,2)
plot(Orientation.Timestamp, Orientation.Y)
title('Pitch')
xlabel('Global time')
ylabel('Pitch [deg]')
grid on
subplot(1,3,3)
plot(Orientation.Timestamp, Orientation.Z)
title('Roll')
xlabel('Global time')
ylabel('Roll [deg]')
grid on

%% Plot angular velocity
clc
close all

figure
subplot(1,3,1)
plot(AngularVelocity.Timestamp, AngularVelocity.X)
title('wx')
xlabel('Global time')
ylabel('xGyro [rad/s]')
grid on
subplot(1,3,2)
plot(AngularVelocity.Timestamp, AngularVelocity.Y)
title('wy')
xlabel('Global time')
ylabel('yGyro [rad/s]')
grid on
subplot(1,3,3)
plot(AngularVelocity.Timestamp, AngularVelocity.Z)
title('wz')
xlabel('Global time')
ylabel('zGyro [rad/s]')
grid on

%%   _____ _____   _____ 
%   / ____|  __ \ / ____|
%  | |  __| |__) | (___  
%  | | |_ |  ___/ \___ \ 
%  | |__| | |     ____) |
%   \_____|_|    |_____/ 
%
%% Plot position
clc
close all

figure
subplot(1,2,1)
plot(Position.Timestamp, Position.Latitude)
title('Latitude')
xlabel('Global time')
ylabel('Latitude [deg]')
grid on
subplot(1,2,2)
plot(Position.Timestamp, Position.Longitude)
title('Longitude')
xlabel('Global time')
ylabel('Longitude [deg]')
grid on


%% Plot speed-course
clc
close all

figure
subplot(1,2,1)
plot(Position.Timestamp, Position.Speed)
title('Speed')
xlabel('Global time')
ylabel('Speed [m/s]')
grid on
% Plot yaw angle - Course
subplot(1,2,2)
plot(Position.Timestamp, Position.Course)
title('Course')
xlabel('Global time')
ylabel('Course-Yaw [deg]')
grid on

%%  ________   _________ _____            
%  |  ____\ \ / /__   __|  __ \     /\    
%  | |__   \ V /   | |  | |__) |   /  \   
%  |  __|   > <    | |  |  _  /   / /\ \  
%  | |____ / . \   | |  | | \ \  / ____ \ 
%  |______/_/ \_\  |_|  |_|  \_\/_/    \_\
%
%% Altitude - Horizontal accuracy
clc
close all

figure
subplot(1,2,1)
plot(Position.Timestamp, Position.Altitude)
title('Altitude')
xlabel('Global time')
ylabel('Altitude [m]')
grid on
% Plot yaw angle - Course
subplot(1,2,2)
plot(Position.Timestamp, Position.HorizontalAccuracy)
title('Horizontal accuracy')
xlabel('Global time')
ylabel('Horizonta accuracy [m]')
grid on