clear all
close all
clc

% Matriz antisimetrica - Producto cruz
J = @(w) [0 -w(3) w(2); w(3) 0 -w(1); -w(2) w(1) 0];

% Matriz de identidad
I = [1 0 0; 0 1 0; 0 0 1];

% Rotacion en los ejes: x(rojo), y(verde), z(azul)
w = [0 1 0]';

% Sentido de rotacion del angulo theta
theta = -pi/4;


% Formula de Rodrigues
RR = I + sin(theta)*J(w) + (1-cos(theta))*(J(w)*J(w));
% RR = I + sin(theta)*J(w) + (1-cos(theta))*(w*w'-I)

Matriz_de_rotacion_R_por_formula_de_Rodrigues = RR


% Cuaternion unitario (u_0, u) = (cos(theta/2), sin(theta/2)*w
% Parte escalar
u0 = cos(theta/2);
% parte vectorial
u = sin(theta/2)*w;

% Matriz de rotación para cuaternio unitario
RCU = (u0^2-u'*u)*I + 2*u0*J(u) + 2*(u*u');

Cuaternion_unitario_q_parte_escalar = u0
Cuaternion_unitario_q_parte_vectorial = u
Matriz_de_rotacion_R_relacionada_con_el_cuaternion_q = RCU


% Matriz de rotacion con trigonometria
Rx = @(theta) [1 0 0; 0 cos(theta) -sin(theta); 0 sin(theta) cos(theta)];
Ry = @(theta) [cos(theta) 0 sin(theta); 0 1 0; -sin(theta) 0 cos(theta)];
Rz = @(theta) [cos(theta) -sin(theta) 0; sin(theta) cos(theta) 0; 0 0 1];

% Rotacion en los ejes: x(rojo), y(verde), z(azul)
RM = Rx(0)*Ry(theta)*Rz(0);

Matriz_de_rotacion_R_con_matriz_de_rotacion_trigonometrica = RM
%return

% Limpiar la grafica para no encimar resultados
%cla

% Funcion de dibujo en la grafica
%Dibujar_Sistema_Referencia_3D([[RR [0 0 0]']; 0 0 0 1], 'R Rodrigues')
%Dibujar_Sistema_Referencia_3D([[RCU [0 0 0]']; 0 0 0 1], 'R Cuaternion')
%Dibujar_Sistema_Referencia_3D([[RM [0 0 0]']; 0 0 0 1], 'R Trigonometrica')

% Ver desde cierta posición tridimencional
%view([50 20])