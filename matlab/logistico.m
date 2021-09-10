function [Y] = logistico(X,k,x0,R)
%Regresa arreglo igual de largo que X con valores logísticos con parametros
%x0 = mayor valor , k = tasa de velocidad , R= valor mínimo (asintota)
Y = zeros(length(X),1);
for i=1:length(X)
    Y(i) = (R*x0)/(x0 + (R-x0)*exp(-k*X(i)));
end
end