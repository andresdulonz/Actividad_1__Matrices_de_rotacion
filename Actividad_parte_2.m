clear all
close all
clc

% Matriz antisimetrica - Producto cruz
J1 = @(wA) [0 -wA(3) wA(2); wA(3) 0 -wA(1); -wA(2) wA(1) 0];
J2 = @(wB) [0 -wB(3) wB(2); wB(3) 0 -wB(1); -wB(2) wB(1) 0];

% Matriz de identidad
I = [1 0 0; 0 1 0; 0 0 1];

% Rotacion en los ejes: x(rojo), y(verde), z(azul)
wA = [0 1 0]';
wB = [1 0 0]';

% Sentido de rotacion del angulo theta
theta_1 = (5*pi)/6;
theta_2 = pi/4;


% Cuaternion unitario (u_0, u) = (cos(theta/2), sin(theta/2)*w
% Parte escalar
u0 = cos(theta_1/2);
v0 = cos(theta_2/2);
% parte vectorial
u = sin(theta_1/2)*wA;
v = sin(theta_2/2)*wB;

% Producto entre dos cuaterniones
uXv = cross(u,v);
u0p = (u0*v0-(u'*v));
up = (u0*v + v0*u + uXv);
%qc = [u0p; up]
% Matriz de rotación para cuaternio unitario
Producto_de_dos_cuaterniones = (u0p^2-up'*up)*I + 2*u0p*J1(up) + 2*(up*up')


% Matriz de rotacion con trigonometria
Rx1 = @(theta_1) [1 0 0; 0 cos(theta_1) -sin(theta_1); 0 sin(theta_1) cos(theta_1)];
Ry1 = @(theta_1) [cos(theta_1) 0 sin(theta_1); 0 1 0; -sin(theta_1) 0 cos(theta_1)];
Rz1 = @(theta_1) [cos(theta_1) -sin(theta_1) 0; sin(theta_1) cos(theta_1) 0; 0 0 1];

Rx2 = @(theta_2) [1 0 0; 0 cos(theta_2) -sin(theta_2); 0 sin(theta_2) cos(theta_2)];
Ry2 = @(theta_2) [cos(theta_2) 0 sin(theta_2); 0 1 0; -sin(theta_2) 0 cos(theta_2)];
Rz2 = @(theta_2) [cos(theta_2) -sin(theta_2) 0; sin(theta_2) cos(theta_2) 0; 0 0 1];

% Rotacion en los ejes: x(rojo), y(verde), z(azul)
R1 = Rx1(0)*Ry1(theta_1)*Rz1(0);
R2 = Rx2(theta_2)*Ry2(0)*Rz2(0);
Producto_de_matrices_de_rotacion = R1*R2

% Limpiar la grafica para no encimar resultados
%cla

% Funcion de dibujo en la grafica
%Dibujar_Sistema_Referencia_3D([[Producto_de_dos_cuaterniones [0 0 0]']; 0 0 0 1], 'Producto de dos cuaterniones')
%Dibujar_Sistema_Referencia_3D([[Producto_de_matrices_de_rotacion [0 0 0]']; 0 0 0 1], 'Producto de matrices de rotacion')

% Ver desde cierta posición tridimencional
%view([-71 34])