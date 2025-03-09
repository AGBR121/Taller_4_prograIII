%Hechos
mujer(clara).
mujer(isabel).
mujer(ana).
mujer(patricia).
hombre(tomas).
hombre(jose).
hombre(jaime).

progenitor(clara, jose).
progenitor(tomas, jose).
progenitor(tomas, isabel).
progenitor(jose, ana).
progenitor(jose, patricia).
progenitor(patricia, jaime).

%Reglas

dif(X,Y) :- X \= Y.

es_madre(X) :- mujer(X), progenitor(X,_).
es_padre(X) :- hombre(X), progenitor(X,_).
es_hijo(X) :- progenitor(_,X).
hermana_de(X,Y) :- mujer(X), progenitor(Z,X), progenitor(Z,Y), dif(X,Y).
abuelo_de(X,Y) :- hombre(X), progenitor(X,Z), progenitor(Z,Y), dif(X,Y).
abuela_de(X,Y) :- mujer(X), progenitor(X,Z), progenitor(Z,Y), dif(X,Y).
hermanos(X,Y) :- progenitor(Z,X), progenitor(Z,Y), dif(X,Y).
tia(X,Y) :- mujer(X), progenitor(Z,Y), hermana_de(X,Z).