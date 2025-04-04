"-------------------------------------------------------"
"------------------------ Colecciones -----------------------"
"-------------------------------------------------------"

"1) Acerca de algunas colecciones muy utilizadas"

"a) Array (fixed length collection)
	x := Array with: 5 with: 4 with: 3 with: 2.
	
	Sintaxis reducida para crear arrays:
	x := #(5 4 3 2)."
	
	"Para resolver en el Workspace:
	- Crear un array usando alguna de las sintaxis anteriores.
	- Cambiar el elemento en la primera posición con el valor 42.
	- ¿Qué pasa si queremos agregar un elemento en la posición 5?"
	
	 a := #(1 2 3 4).
	 a at: 1 put: 42.
	 a at:5 put: 7.
	
	"Si queremos agrregar un elemento en la posición 5 genera un 
	error con el siguientee mensaje: 'subscript is out of bounds: 5'"

"b) Ordered Collections"

	"x := OrderedCollection with: 4 with: 3 with: 2 with: 1.
	
	Resolver en el Workspace:
		- Agregar elemento 42.
		- Agregar elemento 2.
		- ¿Cuántos elementos tiene la colección?
		- ¿Cuántas veces aparece el 2?"	
		
	x := OrderedCollection with: 4 with: 3 with: 2 with: 1.

	x add: 42.
	x add: 2.
	x size.
	x. "--> an OrderedCollection(4 3 2 1 42 2)"

	"El tamaño de la colección es 6, y el 2 aparece dos veces."

"c) Sets"
	
	"x := Set with: 4 with: 3 with: 2 with: 1."
	
	"Resolver en el Workspace:
		- Agregar elemento 42.
		- Agregar elemento 2.
		- ¿Cuántos elementos tiene la colección?
		- ¿Cuántas veces aparece el 2?"
			
	x := Set with: 4 with: 3 with: 2 with: 1.
	x add: 2.
	x size.

"d) Dictionary"

	"x := Dictionary new.
	 x add: #a->4; add: #b->3; add: #c->1; add: #d->2; yourself."

	 "Resolver en el Workspace:
		- Agregar la key #e con el value 42.
		- ¿Cuántos elementos tiene la colección?
		- Listar las keys.
		- Listar los values
		- Obtener el value del key #a.
		- Obtener el value del key #z (en caso de no encontrarlo retornar 24)"

	dict := Dictionary new.
	dict add: #a->4; add: #b->3; add: #c->1; add: #d->2; yourself.

	dict at:#e put: 42.
	dict keys.
	dict values.

	dict at: #a.
	dict at: #z ifAbsent: [^24].

"------------------------------------------------------"

"2) Conversión de colecciones
     e. Convertir el Array del punto a en una OrderedCollection y en un Set.
     f. Convertir el Set del punto c en Array
     g. ¿Qué retorna convertir el Dictionary en Array?"

"e)"
	x := #(5 4 3 2) asOrderedCollection.
	
"f)"	
	s := (Set with: 4 with: 3 with: 2 with: 1) asArray.

"g)"
	d := Dictionary new.
	d add: #a->4; add: #b->3; add: #c->1; add: #d->2; yourself.
	d asArray.
	"El array lo genera con los valores del diccionario."

"También podría haberlo hecho todo lo antrior de la siguiente manera:"
	
	o := OrderedCollection newFrom: x.
	s := Set newFrom: x.
	
	a := Array newFrom: (Set with: 4 with: 3 with: 2 with: 1).

	"Genero un array con los valores del diccionario".
	d := Dictionary new.
	d add: #a->4; add: #b->3; add: #c->1; add: #d->2; yourself.
	dict_arr := Array newFrom: d.

"------------------------------------------------------"

"3) Crear una secuencia de colaboraciones para encontrar los elementos impares en un arreglo."

	"--------------- Impares con index y while -------------"

	| elem elements index odds |
	
	elements:= #(1 2 5 6 9).
	odds := OrderedCollection new.
	
	size := elements size.
	index := 1.
	
	[index <= size]
	
	whileTrue: [
		elem := elements at: index.
		elem odd ifTrue: [odds add: elem].
		index := index +1.
	].

	^odds asArray.

"------------------------------------------------------"

"4) Evaluarlo dentro de un nuevo workspace (encontrar la forma de abrir uno nuevo)"

"Es lo que ya estamos haciendo =)."

"------------------------------------------------------"

"5) Usar las opciones Do it, Print It, Inspect It, Explore It, Debug It. Comprobar qué es lo que 
hace cada una. Es muy importante aprender a debugguear ciclos y entender el rol que juegan
los dos bloques en un whileTrue: (de un lado un bloque con la condición, del otro un bloque 
con la acción a realizar mientras la condición sea verdadera)"

"- Do it: ejectua la colaboración seleccionada."
"- Print it: ejecuta y muestra el resultado de ejecutar una colaboración."
"- Inspect It: permite inspeccionar (y modificar) cualquier tipo de objeto a partir de evaluar alguna
     colaboración."
"- Explore It: permite examinar y modificar la estructura y el comportamiento de los programas en 
     tiempo de ejecución. Muestra una estructurar de árbol desde el objeto que estás siendo esxplorado."
"- Debug it: permite debuggear el programa y modificarlo en tiempo de ejecución."



"------------------------------------------------------"

"6) Cambiar los elementos de la colección elements para comprobar que las colaboraciones 
funcionan"

"Simplemente hay que cambiar elements:= #(1 2 5 6 9) por algún otro: #(3 5 7 8 10)"

"------------------------------------------------------"

"7) Enumerar los problemas que tiene ese algoritmo según lo visto en la carrera."

""

"------------------------------------------------------"

"8) Convertir el script de 1.1 sin usar #whileTrue, utilizando el mensaje #do:, ¿qué ventaja 
tiene la nueva versión?"

	"------------------ Impares usando do: -----------------"

	| elements odds |

	elements:= #(1 2 5 6 9).
	odds := OrderedCollection new.

	elements do: [:elem | (elem odd) ifTrue: [odds add: elem] ].

	^odds asArray.

"La ventaja de usar do: es que puedo iterar el array sin tener que usar el index ni el while, 
al menos no explícitamente."

"------------------------------------------------------"

"9) Volver a convertir el algoritmo sin cambiar su comportamiento pero usando el
mensaje #select: en lugar de #do ¿qué ventaja tiene la nueva versión?"

	"---------------- Impares usando select: ---------------"

	| elements odds |

	elements := #(1 2 5 6 9).
	^elements select: [ :elem | elem odd ].

"La principal diferencia con do: es que select: devuelve una nueva colección con los elementos que cumplen con la condición, mientras que do: simplemente ejecuta un bloque de código para cada elemento sin retornar nada."
	
"Utilizar select: en lugar de do: es una buena opción cuando queremos filtrar los elementos de una colección basándonos en una condición. Y como retorna una nueva colección, no tenemos que preocuparnos por reservar una nueva; además no se modifica la colección original."

"------------------------------------------------------"

"10) Crear una secuencia similar a la de 1) pero que obtenga el doble de cada elemento 
de la colección. Por ejemplo elements = #(1 2 5) debería retornar #(2 4 10)"

	| elements doubles |
	
	elements := #(1 2 5).
	doubles := Array new: elements size.
	
	doubles at: 1 put: ((elements at: 1) * 2).
	doubles at: 2 put: ((elements at: 2) * 2).
	doubles at: 3 put: ((elements at: 3) * 2).
	
	^doubles.

"------------------------------------------------------"

"11) Reescribir el algoritmo utilizando while y luego utilizando do ¿Donde se acumulan los resultados?"

	"-------- Doble de c/elemento con index y while --------"

	| elem elements index doubles |
	
	elements:= #(1 2 5 6 9).
	doubles := OrderedCollection new.
	
	size := elements size.
	index := 1.
	
	[index <= size]
	
	whileTrue: [
		elem := elements at: index.
		doubles add: elem * 2.
		index := index +1.
	].
	
	^doubles  asArray.
		
	"-------------- Doble de c/elemento con do: ------------"

	| elements doubles |
	
	elements:= #(1 2 5 6 9).
	doubles := OrderedCollection new.
	
	elements do: [:elem | doubles add: elem * 2 ].
	
	^doubles  asArray.

"Los elementos son acumulados en la colección creada para tal fin: doubles"
	
"------------------------------------------------------"

"12) Encontrar luego un mensaje mejor en colecciones y dejar el algoritmo más
compacto. ¿Qué retorna el nuevo mensaje?"

	"----------- Doble de c/elemento con collect: ----------"

	| elements |
	elements := #(1 2 5 6 9).
	
	^elements collect: [ :elem | elem * 2 ].

"Como en este caso no hay ninguna condición sobre los elementos no podemos usar select:
Entonces podemos usar collect, que genera una nueva colección agregando cada elemento
sobre el que se realizó alguna acción."

"------------------------------------------------------"

"13 Crear una nueva secuencia de colaboraciones para encontrar el primer número par, 
utilizando otro mensaje de colecciones. Como siempre primero con while: luego con do: 
y luego con un mensaje específico. Ejemplo: dado #(1 2 5 6 9) debería retornar 2"

	"--------- Primer elemento par con index y while -------"

	| elem elements index |
	
	elements:= #(1 2 5 6 9).
	
	size := elements size.
	index := 1.
	
	[index <= size]
	
	whileTrue: [
		elem := elements at: index.
		elem even ifTrue: [^elem].
		index := index +1.
	].


	"-------------- Primer elemento par con do: ------------"

	| elements firstEven found |
	
	elements := #(1 2 5 6 9).
	firstEven := nil.
	found := false.
	
	elements do: [ :elem | 
		(elem even and: [found not]) ifTrue: [
                  firstEven := elem.
                  found := true.
             ].
       ].
	
	^firstEven.

"Utilizando do: no queda otra que recorrer todo el array y, además, tener que
agregar lógica adicional. Horrible."

"------------------------------------------------------"

"14 Utilizar la secuencia de colaboraciones con una colección sin pares. Por ejemplo #(1 5 9).
 ¿Qué ocurre?"

"Se obtiene un mensaje de error: 	'Object is not in the collection'"

"------------------------------------------------------"

"15) Modificar la secuencia para generar un error en caso de no contener pares
utilizando self error: ‘No hay pares’. Evaluarlo en una colección con pares (retorna el
primero) y sin pares (se genera un error con el mensaje específico)"

"-------------- Primer elemento par con detect: ------------"
		
	| elements  |
	
	"elements := #(1 3 5 7 9)."
	elements := #(1 2 5 6 9).
	
	^elements detect: [ :elem | elem even ] ifNone: [ self error: 'No hay pares' ].
		
"detect: detecta el 1er elemento que cumple con una condición y lo retorna. Si no
encuentra ningún elemento y no se le pasa un closure a evaluar (con ifNone:), 
retorna un mensaje de error por defecto."

"------------------------------------------------------"
		
"16) Sumar los números de una colección utilizando primero while, luego do y luego un mensaje 
de sumar colecciones. Hay un mensaje específico para la suma y otro para acumular elementos 
llamado inject:into: Solucionarlo utilizando ambos."

"----------- Sumar elementos con index y while ---------"

	| elements index accum |
	
	elements:= #(1 2 5 6 9).
	
	size := elements size.
	index := 1.
	accum := 0.
	
	[index <= size]
	
	whileTrue: [
		accum := accum + elements at: index.
		index := index +1.
	].
	
	^accum.

"---------------- Sumar elementos con do: --------------"

	| elements sum |
	
	elements := #(1 2 5 6 9).
	sum := 0.
	
	elements do: [ :elem | sum := sum + elem].
		
	^sum.

"---------------- Sumar elementos con sum: -------------"

	| elements |
	
	elements := #(1 2 5 6 9).
	^elements sum.

"------------------------------------------------------"

"17) ¿Cuántos colaboradores recibe inject:into:? Pruebe debuggearlo con el menú o poniendo self halt. 
antes de las colaboraciones (esto detendrá la ejecución y abrirá el debugger)"

"inject:into: recibe dos colaboradores:"

"El primer colaborador es el valor inicial que se pasa como primer argumento a inject:into:. Este valor inicial es el punto de partida para el cálculo acumulado. En el ejercico es 0."

"El segundo colaborador es el bloque (closure) que define cómo se va a acumular o combinar el valor inicial con los elementos de la colección a medida que se itera. El bloque recibe dos parámetros:"

"sum: que representa el valor acumulado.
elem: que representa el elemento actual de la colección que está siendo procesado."
	
	| elements |
	
	elements := #(1 2 5 6 9).
	self halt.
	^elements inject: 0 into: [ :sum :elem | sum + elem ].


"-------------------------------------------------------"
"------------------------- Strings -------------------------"
"-------------------------------------------------------"

"18) Crear una nueva secuencia para extraer únicamente las vocales en el orden que aparecen 
en un string. Implementar un extractor de vocales preservando el orden de un string usando
#select. Ejemplo, para 'abcdefguijp' debe retornar 'aeui'"

	| inputString vowels |
	
	inputString := 'abcdefguijp'.
	vowels := inputString select: [ :letter | 'aeiou' includes: letter ].
	
	^vowels.


"------------------------------------------------------"

"19) ¿Qué observa con respecto a los strings y otras colecciones?"

"En Smalltalk los strings son colecciones de caracteres, por lo que podemos aplicar métodos de 
colecciones también con ellos. Es por eso que pudimos usar select: en este ejercicio."

"------------------------------------------------------"

"20) ¿Conocía estos mensajes de colecciones de materias anteriores? ¿Cómo se llamaban?"

"-------------------------------------------------------"
"------------------------- Closures ------------------------"
"-------------------------------------------------------"

"a) ¿Cuál es la definición de Blocks que se encuentra en el libro Smalltalk-80 The Language and its Implementation.?"

"En Smalltalk, un block es un fragmento de código que puede ser pasado y ejecutado en otro contexto en el futuro. Es una unidad de función anónima o closure que puede capturar variables de su entorno cuando se evalúa."

"La secuencia de instrucciones de un closure no se ejecutan inmediatamente, sino que pueden ser evaluadas en el futuro, cuando se les pase un mensaje de evaluación (como value o valueWithArguments:)."


"b) ¿Qué valor retorna un Block cuando se evalúa (con value)?"

"Cuando un closure se evalúa con value, retorna el valor de la última expresión evaluada dentro del mismo. Si contiene varias expresiones, sólo la última expresión se considera el resultado."

"c) Evaluar en el Workspace lo siguiente:"

	| x |
	x := [ y := 1. z := 2. ].
	x value. 

"Cuando Smalltalk evalúa un closure, si contiene asignaciones, el valor de cada asignación es el valor que se le asigna a la variable. Dado que la última asignación es z := 2, el closure retorna el valor de esa asignación, que en el ejemplo es 2."

"c.i) ¿Qué sucede si queremos acceder a una variable definida en el bloque desde fuera del bloque?"

	| x |

	x := [ w := 10. z := 3. ].
	x value.
	w.

"Se puede accedeer sin problemas."
	
"¿Qué sucede al acceder a una variable definida fuera del bloque desde dentro del bloque?"	
	
	| x y |
	x := [ y := 1. z := 2. ].
	x value.
	y.

"Se puede accedeer sin problemas."

"c.ii). Dé un ejemplo de un bloque con dos parámetros y su evaluación."

	| closureSum |
	
	closureSum := [ :a :b | a + b ]. 
	closureSum value: 3 value: 5.

"Para evaluar un closure con parámetros hay que utilizar value: seguido de los argumentos 
que se desean pasar, uno por uno."

	
"-------------------------------------------------------"
"------------------------ Symbols -------------------------"
"-------------------------------------------------------"

"a) ¿Cuál es la definición de Symbol que se encuentra en el libro Smalltalk-80 The Language and its Implementation.?"

"Un Symbol es un identificador único, inmutable y tiene una representación interna eficiente. Los Symbols 
se utilizan principalmente para representar nombres de métodos, variables o incluso mensajes."

"Un Symbol se crea mediante un prefijo # seguido de una secuencia de caracteres."

"Características:"

"- Al ser inmutables, una vez creados no pueden ser modificados."

"- Al ser únicos, dos Symbols con el mismo nombre comparten la misma representación interna en la memoria, lo que mejora la eficiencia al comparar o utilizar estos valores."

"b) Evaluar: "

	| x y |
	x := #pepe.
	y := #pepe.
	x = y.
	
"Como ambos x e y contienen el Symbol #pepe, Smalltalk los considera iguales, ya que los Symbols son únicos e inmutables, por lo que no hay duplicados con el mismo nombre."

"c) ¿Cuál es el resultado de concatenar símbolos?"

"Se concatenamos Symbols obtenemos un String"
	
	#Hello , #World, #!. "--> 'HelloWorld!'"


"-------------------------------------------------------"
"------------------------ Medidas -------------------------"
"-------------------------------------------------------"

"1) Sobre la importancia de las medidas en nuestra profesión y sobre las responsabilidades
de los desarrolladores de software en la industria:"

"● http://www-users.math.umn.edu/~arnold/disasters/ariane.html"
"●https://motherboard.vice.com/en_us/article/qkvzb5/the-time-nasa-lost-a-mars-orbiter-because-of-a-metric-system-mixup"
"● https://en.wikipedia.org/wiki/Gimli_Glider"

"Cohete Arianee 5 (1996): Era un cohete de la Agencia Espacial Europea (ESA); explotó poco después de su lanzamiento debido a un error en el software que trataba de convertir datos en una variable de tipo entero. Durante la conversión de un número mayor que el límite de la variable (lo que causó un desbordamiento), el sistema de control del cohete no pudo manejar el error, lo que llevó a la falla."

"NASA Mars Orbiter (1999): la nave espacial Mars Climate Orbiter (MCO) de la NASA se incendió en la atmósfera marciana después de un error de navegación. El error se debió a que el software que calculaba las trayectorias del orbiter utilizaba datos en unidades inglesas en lugar del sistema métrico,  lo que causó que la nave se desviara de su trayectoria."

"Gimli Glider (1983): Durante el vuelo de un avión Boeing 767 de Air Canada, el sistema de combustible no estaba correctamente configurado debido a una confusión entre el sistema métrico y el sistema inglés. El avión despegó con el tanque de combustible mal cargado y, finalmente, se quedó sin combustible, lo que llevó a un aterrizaje de emergencia sin víctimas. El error en la conversión de las unidades de combustible fue la causa principal de este incidente."

"¿Qué tienen en común los casos mencionados en las notas anteriores?"

"Tienen en común errores relacionados con las unidades de medida y las conversiones de escala, 
que en su momento resultaron en grandes fallos o desastres, muchos de los cuales pudieron haberse evitado con una correcta gestión de las medidas y la conversión de unidades."


"------------------------------------------------------"

 "2) Evalúe estas colaboraciones. ¿Qué resultado esperaba? ¿Cuál Obtuvo?"

10 * peso + 10 * dollar

"Se obtiene una excepción: MessageNotUnderstood: BaseUnit>>multiplyCompoundMeasure
Uno pensaría que esto se debe a que estamos sumando unidades distintas, pero no.
El tema es cómo están agrupados los mensajes. Así como están primero se hará 10 * peso, luego
a eso se le enviará el mensaje + 10 resultando en 10 * pesos+10, que finalmente recibirá el msj
* dollar, que no sabár responder."

"Entonces tenemos que hacer lo siguiente:"

(10 * peso) + (10 * dollar).  

"Retorna: 10 * dollars+10 * pesos. No está expresada ni en pesos ni en dólares, pero es una 
expresión válida y no da error.".

"------------------------------------------------------"

"3) Evalúe estas colaboraciones anotando previamente que resultado cree va a obtener"

10 * peso +( 10 * dollar).                                               "--> 10 * dollars+10 * pesos ."
10 * peso +( 10 * dollar) - (2 * dollar).                        "--> 10 * pesos+8 * dollars ."
10 * peso +( 10 * dollar) - (2 * dollar) - (8 * dollar). "--> 10 * pesos"

"------------------------------------------------------"

"4) ¿Qué es peso? Inspecciónelo:"

peso inspect. "--> De la clase BaseUnit".

"------------------------------------------------------"

"5) ¿Qué es 10 * peso? Evalúe:"

(10 * peso) amount. "--> 10."
(10 * peso) unit.       "--> peso "

"------------------------------------------------------"

"6) ¿Qué son los números en este contexto? ¿Qué unidad llevan?"

1 amount.  "--> 1"
1 unit.        "--> NullUnit"

"------------------------------------------------------"

"7) ¿Cuánto es (10 * peso) + 1 y 1 + (10 * peso)?"

(10 * peso) + 1.  "--> 10 * pesos+1 ."
1 + (10 * peso).  "--> 10 * pesos+1 ."
 
(10 * peso) * 5.                "--> 50 * pesos ."
(10 * peso) * (5 * peso). "--> 50 * pesos*pesos ."

"------------------------------------------------------"

"8) Cree el peso nuevamente:"

	peso := BaseUnit nameForOne: 'peso' nameForMany: 'pesos' sign: $$.

"En Smalltalk, $$ se utiliza para representar un carácter (char) y, en este caso, 
representa el símbolo del peso ($ seguido de la letra $)."


"------------------------------------------------------"

"9) Calcular: (10 * metros) + (500 * centimetros). Sugerencia: Crear los centímetros en función 
de los metros como una ProportionalDerivedUnit (ver los mensajes de creación de instancia)"
	
	metro := BaseUnit nameForOne: 'metro' nameForMany: 'metros'.
	centimetro := ProportionalDerivedUnit baseUnit: metro 
	                                                              conversionFactor: 1/100
	                                                              nameForOne: 'centimetro' 
	                                                              nameForMany: 'centimetros' 
	                                                              sign: 'NO SIGN'.
	
	(10 * metro) + (500 * centimetro). "--> 15 * metros"

"------------------------------------------------------"

"10) Resuelva el problema del cohete Arianne sobre el cual leyó
	
	metros := BaseUnit nameForOne: 'metro' nameForMany: 'metros'.
	diezMetros := 10 * metros.
	
	pulgadas := BaseUnit nameForOne: 'pulgada' nameForMany: 'pulgadas'.
	sesentaPulgadas := 60 * pulgadas.
	
	diezMetros + sesentaPulgadas.	"

Sugerencia:
	- Cambiar la creación de las pulgadas en función de los metros (como una ProportionalDerivedUnit)"

	metro := BaseUnit nameForOne: 'metro' nameForMany: 'metros'.
	diezMetros := 10 * metros.
	
	pulgada := ProportionalDerivedUnit baseUnit: metro 
	                                                         conversionFactor: 254/10000
	                                                         nameForOne: 'pulgada' 
	                                                         nameForMany: 'pulgadas' 
	                                                         sign: ''.	
	sesentaPulgadas := 60 * pulgada.
	
	diezMetros + sesentaPulgadas.  "--> 2881/250 * metros"

"------------------------------------------------------"

"11) Construir los Celsius y Fahrenheit en función de los Kelvin para poder realizar en un
método
	
	(30 * kelvin) + (20 * celsius) + (10 * fahrenheit)

Sugerencia:
	- Las conversiones ya no son directas, busque resolverlo con otra clase."

"Es lo mismo que con los ejercicios anteriores, utilizando ProportionalDerivedUnit y el factor de conversión."
	
	(30 * kelvin) + (20 * celsius) + (10 * fahrenheit).


"-------------------------------------------------------"
"------------------------- Fechas -------------------------"
"-------------------------------------------------------"

"1) Tiempo tradicional.
	
El tiempo basado en un punto fijo arbitrario y una distancia en segundo. Evaluar:"

	DateAndTime fromSeconds: 0. "--> 1901-01-01T00:00:00-03:00"
	(DateAndTime fromSeconds: 0) + (Duration days: 1). "--> 1901-01-02T00:00:00-03:00"
	
	Time now. "--> 10:34:00.463899 pm"
	Time hour: 1 minute: 2 second: 4. "--> 1:02:04 am"
	Time now + (Duration hours: 1). "FALLA porque no es un timespan"
	
	Date today. "--> 2 April 2025"
	Date newDay: 1 month: 2 year: 3. "--> 1 February 3"

"Estas clases están en Kernel-Chronology"

	
"------------------------------------------------------"

"2) Inspeccionar usando los objetos del paquete Aconcagua que ya viene preinstalado en
CuisUniversity."

	FixedGregorianDate today. "--> April 2, 2025"
	FixedGregorianDate today next next. "--> April 4, 2025"
	
	GregorianDateTime now. "--> April 2, 2025 at 22:50:19"
	GregorianDateTime now next. "-->El next agrega 1 segundo: April 2, 2025 at 23:28:39"
	GregorianDateTime now next distanceFrom: GregorianDateTime now. "--> " 1/86400 * days .
	(GregorianDateTime now next distanceFrom: GregorianDateTime now) convertTo: second /
	millisecond. " --> Error: It is not possible to convert (1/86400) * days to second/millisecond"
	
	TimeOfDay now. "--> 0:23:34"
	TimeOfDay now next: (30 * hour). "--> Tira error pero al dar Proceed da: 30:24:39

	FixedGregorianDate today year. "--> Year 2025"
	FixedGregorianDate today month. "--> April"
	FixedGregorianDate today monthOfYear. "--> April of Year 2025"

"3) Obtener el dia dentro de una semana: (FixedGregorianDate today)"

	FixedGregorianDate today day. "--> Thursday"
	
"4) Sumarle 24 segundos a la fecha de hoy y ver qué pasa."

	"No está el mensaje +, lo puedo hacer como sigue:"
	GregorianDateTime now next: (24 * second).
	
"5) Sumarle la cantidad de segundos que hay en un día a la fecha de hoy y ver qué pasa."

	GregorianDateTime now next: (24 * 60 * 60 *second).
	
"5 Evaluar por separado estas colaboraciones:

a) 2024 isLeap
b) (April, 2024) year isLeap

¿Qué ocurre?"

	2024 isLeap. "--> Error: infinite recursion in doesNotUnderstand:"
	
	(April, 2024) year isLeap. "--> true"

"6) Corrija la siguiente expresión para que funcione: TimeOfDay now next: 3600"

	TimeOfDay now next: 3600 * second.
