%% Clean Up
clc
clear all
close all

%% 3D Manipulator for 6 Links RRRRPR (theta d a alpha) 
L1 = Link([0 0 0 -pi/2 0]); % Revolute Joint
L2 = Link([0 5 0 pi/2 0]); % Revolute Joint
L3 = Link([0 4 0 0 0]); % Revolute Joint
L4 = Link([0 0 0 -pi/2 0]); % Revolute Joint
L5 = Link([0 2 0 pi/2 1]); % Prismatic Joint 
L6 = Link([0 3 0 0 0]); % Revolute Joint

L5.qlim = [0 8];
% Create the 6-DOF manipulator robot
robot = SerialLink([L1 L2 L3 L4 L5 L6]);


%% Calculate the end-effector position using the first three joints
m = robot.fkine([pi/6, pi/3, pi/4, 0, 5, pi/3]); % Forward kinematics to get the end-effector transformation matrix
%% Extract x, y, z coordinates
m.t
x = m.t(1,1)
y = m.t(2,1)
z = m.t(3,1)
%% Plot the 5-dof maniipulator including the teach function
plot(robot, [pi/2, pi/2, pi/3, pi/4, 5, pi/3], 'workspace', [-12 12 -12 12 -12 12]);
robot.teach()