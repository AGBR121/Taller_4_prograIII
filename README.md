# Puntos de la tarea

## Ejercicio 1.1

### a) ?- progenitor(jaime,X).
false.

### b) ?- progenitor(X,jaime).
X = patricia.

### c) ?- progenitor(clara,X),progenitor(X,patricia).
X = jose.

### d) ?- progenitor(tomas,X),progenitor(X,Y),progenitor(Y,Z).
X = jose,
Y = patricia,
Z = jaime ;
false.

## Ejercicio 1.2

### a) ¿Quien es el progenitor de Patricia?
?- progenitor(X,patricia).
X = jose.

### b) ¿Tiene Isabel un hijo o una hija?
?- progenitor(isabel, X).  
false.

### c) ¿Quien es el abuelo de Isabel?
?- progenitor(X,Y), progenitor(Y, isabel).
false.

### d) ¿Cuáles son los tíos de Patricia? (no excluir al padre)
?- progenitor(X,patricia), progenitor(Y,X), progenitor(Y,Z).
X = Z, Z = jose,
Y = clara ;
X = Z, Z = jose,
Y = tomas ;
X = jose,
Y = tomas,
Z = isabel.

## Ejercicio 1.3

### Hechos
```pl
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
```
### Reglas
```pl
dif(X,Y) :- X \= Y.
```
### Ejercicio
a) es_madre(X).
```pl
es_madre(X) :- mujer(X), progenitor(X,_).
```

b) es_padre(X).
```pl
es_padre(X) :- hombre(X), progenitor(X,_).
```

c) es_hijo(X).
```pl
es_hijo(X) :- progenitor(_,X).
```

d) hermana_de(X,Y).
```pl
hermana_de(X,Y) :- mujer(X), progenitor(Z,X), progenitor(Z,Y), dif(X,Y).
```

e) abuelo_de(X,Y) y abuela_de(X,Y).
```pl
abuelo_de(X,Y) :- hombre(X), progenitor(X,Z), progenitor(Z,Y), dif(X,Y).
abuela_de(X,Y) :- mujer(X), progenitor(X,Z), progenitor(Z,Y), dif(X,Y).
```

f) hermanos(X,Y). Tened en cuenta que una persona no es hermano de sí mismo
```pl
hermanos(X,Y) :- progenitor(Z,X), progenitor(Z,Y), dif(X,Y).
```

g) tia(X,Y). Excluid a los padres
```pl
tia(X,Y) :- mujer(X), progenitor(Z,Y), hermana_de(X,Z).
```