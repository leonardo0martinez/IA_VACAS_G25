% Definición de instancias
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

% Definición de subclases
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

% Definición de propiedades
tiene_propiedad(arboles, necesitan, abono).
tiene_propiedad(gimnospermas, tienen, flores).
tiene_propiedad(semillas, pueden, germinar).
tiene_propiedad(musgos, tienen, esporangio).
tiene_propiedad(esporas, no_tienen, flores).
tiene_propiedad(plantas, tienen, hojas).
tiene_propiedad(plantas, tienen, tallo).
tiene_propiedad(plantas, tienen, raiz).


%===================REGLAS==================
es(Clase, Obj):-instancia_de(Obj, Clase).