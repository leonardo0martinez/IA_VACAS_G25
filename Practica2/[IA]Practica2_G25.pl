%===========================================
%           Definición de instancias
%===========================================
instancia_de(olivo, arboles).
instancia_de(encino, arboles).
instancia_de(arandanos, matas).
instancia_de(jazmin, arbustos).
instancia_de(trigo, hierbas).
instancia_de(arroz, hierbas).
instancia_de(maiz, anuales).
instancia_de(coliflor, anuales).
instancia_de(cebolla, bianuales).
instancia_de(rabano, bianuales).
instancia_de(yuca, perennes).
instancia_de(camote, perennes).
instancia_de(helechos, esporas).
instancia_de(musgos, esporas).
instancia_de(rosa, angiospermas).
instancia_de(manzano, angiospermas).
instancia_de(tomate, angiospermas).
instancia_de(cedro, gimnospermas).
instancia_de(pino, gimnospermas).

%===========================================
%          Definición de subclases
%===========================================
subclase_de(arboles, tamanio).
subclase_de(matas, tamanio).
subclase_de(arbustos, tamanio).
subclase_de(hierbas, tamanio).
subclase_de(hierbas, anuales).
subclase_de(anuales, duracion).
subclase_de(bianuales, duracion).
subclase_de(perennes, duracion).
subclase_de(arboles, gimnospermas).
subclase_de(gimnospermas, semillas).
subclase_de(angiospermas, semillas).
subclase_de(semillas, reproduccion).
subclase_de(esporas, reproduccion).
subclase_de(tamanio, plantas).
subclase_de(duracion, plantas).
subclase_de(reproduccion, plantas).

%===========================================
%         Definición de propiedades
%===========================================
tiene_propiedad(arboles, necesitan, abono).
tiene_propiedad(gimnospermas, tienen, flores).
tiene_propiedad(semillas, pueden, germinar).
tiene_propiedad(musgos, tienen, esporangio).
tiene_propiedad(esporas, no_tienen, flores).
tiene_propiedad(plantas, tienen, hojas).
tiene_propiedad(plantas, tienen, tallo).
tiene_propiedad(plantas, tienen, raiz).


%===========================================
%                 Reglas
%===========================================
%Regla para saber si un objeto es una instancia de una clase en concreto
es(Clase, Obj):-instancia_de(Obj, Clase).  
es(Clase, Obj):-instancia_de(Obj, Clasep),
                subc(Clasep, Clase).


%Regla para saber si una clase es subclase de otra
subc(C1, C2):-subclase_de(C1,C2).
subc(C1, C2):-subclase_de(C1,C3),
              subc(C3,C2).


%Regla para saber las propiedades de un objeto
propiedad(Obj,Prop):-es(Clase,Obj),
                     tiene_propiedad(Clase,Propiedad,Clase2),
                     Prop =.. [Propiedad, Clase2].

%===========================================
%                 Pruebas
%===========================================
% es(plantas, olivo).
% es(matas, arandanos).
% es(reproduccion, encino).
% es(duracion, trigo).
% es(semillas, tomate).
% es(esporas, helechos).

% subc(reproduccion, plantas).
% subc(reproduccion, arboles).
% subc(duracion, hierbas).
% subc(hierbas, reproduccion).

% propiedad(olivos, X).
% propiedad(musgos, X).
% propiedad(pino, X).
% propiedad(maiz, X).
