%Prueba de sistema tipo feedback simple 1 

%declaración de parametros de espera y de la función logística
T = 0.1;
tau1 = 0.05;
tau2 = 0.03;
x0 = 6;
k = 1.5;
R = 3;

%{
la arquitectura de este sistema es un simple ciclo cerrado de feedback con
función de transferencia G tal como se expresa en el articulo Krenz 1985
 en el bloque planta
bloque de feedback C como se expresa en el artículo
%}

Den = conv([tau1,1],[tau2,1]);
G = tf(1,Den,'InputDelay',T);
C = tf([1],[tau1,1]);

%Creamos función de transferencia con forma logística
s = tf('s');
S = (R*x0)/(x0 + (R-x0)*exp(-k*s));

%generamos el sistema con feedback negativo (pues el bloque C regula la
%amplitud de la pupila, no la refuerza
sys = feedback(G,C,-1);

%{
Por un articulo sobre sistemas de control, el output debería ser igual al
producto de la entrada por la salida. Hacemos producto de función de
transferencia logística por el sistema generado
%}
K = S*sys;

stepplot(K)

%{
Notas: 
-La señal en el sistema 'sys' parece acercarse al valor .5, y por la funcion
'S' el sistema resultante se va hacia .5*x0, sin embargo no sigue un
comportamiento cíclico como el artículo propone.
-Entre más varía el término k>0 más varía la amplitud del sistema
%}
