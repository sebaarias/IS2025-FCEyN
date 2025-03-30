!classDefinition: #AlgebraDeBooleTest category: 'Álgebra de Boole'!
DenotativeObject subclass: #AlgebraDeBooleTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Álgebra de Boole'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AlgebraDeBooleTest class' category: 'Álgebra de Boole'!
AlgebraDeBooleTest class
	instanceVariableNames: ''!

!AlgebraDeBooleTest class methodsFor: 'tests condicionales' stamp: 'SAR 3/23/2025 00:31:05'!
test07SiVerdaderoCuandoEsVerdaderoEjecutaLaAccionARealizar

	| unaAccionARealizarUIgnorar |

	unaAccionARealizarUIgnorar := [2+2].

	Assert that: (Verdadero siVerdadero: unaAccionARealizarUIgnorar) isEqualTo: 4.! !

!AlgebraDeBooleTest class methodsFor: 'tests condicionales' stamp: 'SAR 3/23/2025 00:35:46'!
test08SiVerdaderoCuandoEsFalsoIgnoraLaAccionARealizar

	| unaAccionARealizarUIgnorar |

	unaAccionARealizarUIgnorar := [2+2].

	Assert that: (Falso siVerdadero: unaAccionARealizarUIgnorar) isEqualTo: nil.! !

!AlgebraDeBooleTest class methodsFor: 'tests condicionales' stamp: 'SAR 3/23/2025 00:40:05'!
test09SiFalsoCuandoEsVerdaderoIgnoraLaAccionARealizar

	| unaAccionARealizarUIgnorar |

	unaAccionARealizarUIgnorar := [2+2].

	Assert that: (Falso siVerdadero: unaAccionARealizarUIgnorar) isEqualTo: nil.! !

!AlgebraDeBooleTest class methodsFor: 'tests condicionales' stamp: 'SAR 3/23/2025 00:41:03'!
test10SiFalsoCuandoEsFalsoEjecutaLaAccionARealizar

	| unaAccionARealizarUIgnorar |

	unaAccionARealizarUIgnorar := [2+2].

	Assert that: (Falso siFalso: unaAccionARealizarUIgnorar) isEqualTo: 4.! !


!AlgebraDeBooleTest class methodsFor: 'tests operadores lógicos' stamp: 'SAR 3/23/2025 00:22:08'!
test01VerdaderoNegadoEsFalso

	Assert that: Verdadero negado isEqualTo: Falso.! !

!AlgebraDeBooleTest class methodsFor: 'tests operadores lógicos' stamp: 'SAR 3/23/2025 00:23:27'!
test02FalsoNegadoEsVerdadero

	Assert that: Verdadero negado isEqualTo: Falso.! !

!AlgebraDeBooleTest class methodsFor: 'tests operadores lógicos' stamp: 'SAR 3/23/2025 00:26:47'!
test04VerdaderoYFalsoEsFalso

	Assert that: (Verdadero y: Falso) isEqualTo: Falso.! !

!AlgebraDeBooleTest class methodsFor: 'tests operadores lógicos' stamp: 'SAR 3/23/2025 00:27:05'!
test05FalsoYFalsoEsFalso

	Assert that: (Falso y: Falso) isEqualTo: Falso.! !

!AlgebraDeBooleTest class methodsFor: 'tests operadores lógicos' stamp: 'SAR 3/23/2025 00:27:31'!
test06FalsoYVerdaderoEsFalso

	Assert that: (Falso y: Falso) isEqualTo: Falso.! !


!classDefinition: #Falso category: 'Álgebra de Boole'!
DenotativeObject subclass: #Falso
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Álgebra de Boole'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Falso class' category: 'Álgebra de Boole'!
Falso class
	instanceVariableNames: ''!

!Falso class methodsFor: 'condicionales' stamp: 'SAR 3/23/2025 00:05:48'!
siFalso: unaAccionARealizarUIgnorar

	^(unaAccionARealizarUIgnorar value).! !

!Falso class methodsFor: 'condicionales' stamp: 'SAR 3/23/2025 00:04:05'!
siVerdadero: unaAccionARealizarUIgnorar

	^nil.! !


!Falso class methodsFor: 'operadores lógicos' stamp: 'SAR 3/23/2025 00:21:40'!
negado

	^Verdadero.! !

!Falso class methodsFor: 'operadores lógicos' stamp: 'SAR 3/23/2025 05:40:18'!
o: unBooleano

	^unBooleano.! !

!Falso class methodsFor: 'operadores lógicos' stamp: 'SAR 3/23/2025 05:39:44'!
y: aBoolean

	^self.! !


!classDefinition: #Verdadero category: 'Álgebra de Boole'!
DenotativeObject subclass: #Verdadero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Álgebra de Boole'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Verdadero class' category: 'Álgebra de Boole'!
Verdadero class
	instanceVariableNames: ''!

!Verdadero class methodsFor: 'condicionales' stamp: 'SAR 3/23/2025 00:12:21'!
siFalso: unaAccionARealizarUIgnorar

	^nil.! !

!Verdadero class methodsFor: 'condicionales' stamp: 'SAR 3/23/2025 00:11:44'!
siVerdadero: unaAccionARealizarUIgnorar

	^(unaAccionARealizarUIgnorar value).! !


!Verdadero class methodsFor: 'operadores lógicos' stamp: 'SAR 3/23/2025 00:21:40'!
negado

	^Falso.! !

!Verdadero class methodsFor: 'operadores lógicos' stamp: 'SAR 3/23/2025 00:06:45'!
o

	^self.! !

!Verdadero class methodsFor: 'operadores lógicos' stamp: 'SAR 3/23/2025 00:10:14'!
y: unBooleano

	^unBooleano.! !
