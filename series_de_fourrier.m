#----------------------------------------------------
#     Aproxima uma funcao por series de Fourier
#     Por: Douglas A.S
#----------------------------------------------------
#  Instale o pacote "symbolic" e digite na janela de
# comandos "pkg load symbolic" e depois "syms x"
#.....................................................
clear
syms x
f(x) = x #.......Funcao a ser aproximada
n = 15   #.......Numero de interacoes
L = pi   #.......Extremidades do intervalo a se aproximar
#.....................................................
a = (1/L)*(int(f(x),[-L,L]));
b1 = (1/L)*(int((f(x)*cos(x)),[-L,L]));
c1 = (1/L)*(int((f(x)*sin(x)),[-L,L]));
h(x) = b1*cos((pi*x)/L)+c1*sin((pi*x)/L);
for i = 2:n
  b = (1/L)*(int((f(x)*cos(i*x)),[-L,L]));
  c = (1/L)*(int((f(x)*sin(i*x)),[-L,L]));
  h(x) = h(x) + b*cos((pi*i*x)/L)+c*sin((pi*i*x)/L);
endfor
#.....................................................
k(x) = 0.5*a+ h(x)
ezplot(x,k(x)) #....Grafico da funcao aproximadora
hold
ezplot(x,f(x)) #....Grafico da funcao original
