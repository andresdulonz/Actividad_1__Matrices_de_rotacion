clear all
close all
clc

% Matriz antisimetrica - Producto cruz
J = @(w) [0 -w(3) w(2); w(3) 0 -w(1); -w(2) w(1) 0];

% Matriz de identidad
I = [1 0 0; 0 1 0; 0 0 1];

% Rotacion en los ejes: x(rojo), y(verde), z(azul)
w = [0 0 1]';

% Sentido de rotacion del angulo theta
theta = (3*pi)/8;


% Cuaternion unitario (u_0, u) = (cos(theta/2), sin(theta/2)*w
% Parte escalar
u0 = cos(theta/2);
% parte vectorial
u = sin(theta/2)*w;

% Matriz de rotación para cuaternio unitario
R = (u0^2-u'*u)*I + 2*u0*J(u) + 2*(u*u');
% Inversion de matriz R
inv(R);
Inversa_de_R = R'

% Cuaternion conjugado de q
qc = [u0; -u];
Cuaternion_q_conjugado = (qc(1)^2-qc(2:4)'*qc(2:4))*I + 2*qc(1)*J(qc(2:4)) + 2*(qc(2:4)*qc(2:4)')

% Limpiar la grafica para no encimar resultados
%cla

% Funcion de dibujo en la grafica
%Dibujar_Sistema_Referencia_3D([[Inversa_de_R [0 0 0]']; 0 0 0 1], 'Inversa de R')
%Dibujar_Sistema_Referencia_3D([[Cuaternion_q_conjugado [0 0 0]']; 0 0 0 1], 'Cuaternion q conjugado')

% Ver desde cierta posición tridimencional
%view([-54 59])