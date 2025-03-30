!classDefinition: #I category: 'Números Romanos'!
DenotativeObject subclass: #I
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Números Romanos'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'I class' category: 'Números Romanos'!
I class
	instanceVariableNames: 'next'!

!I class methodsFor: 'next - prev' stamp: 'SAR 3/28/2025 05:17:52'!
next
	
	next :=  II.

	^next.! !

!I class methodsFor: 'next - prev' stamp: 'SAR 3/29/2025 01:45:30'!
prev

	^self error: self subtrahendCannotBeGreaterOrEqualToTheMinuendErrorDescription.
! !


!I class methodsFor: 'comparison operations'!
> aPeanoNumber

	^ false.! !


!I class methodsFor: 'arithmetic operations'!
* aMultiplier
	
	^aMultiplier.
! !

!I class methodsFor: 'arithmetic operations'!
+ anAddend
	
	^anAddend next.
! !

!I class methodsFor: 'arithmetic operations' stamp: 'SAR 3/29/2025 01:45:30'!
- aSustrahend

	^ self error: self subtrahendCannotBeGreaterOrEqualToTheMinuendErrorDescription.
! !

!I class methodsFor: 'arithmetic operations' stamp: 'SAR 3/29/2025 01:28:35'!
/ aDivisor

	self = aDivisor
		ifTrue: [^self].
	
	^self error: self numberOneCanOnlyBeDividedByItselfErrorDescription.! !


!I class methodsFor: 'errors' stamp: 'SAR 3/29/2025 01:28:35'!
numberOneCanOnlyBeDividedByItselfErrorDescription
	
	^'In natural numbers, the number one can only be divided by itself.'! !

!I class methodsFor: 'errors' stamp: 'SAR 3/29/2025 01:45:30'!
subtrahendCannotBeGreaterOrEqualToTheMinuendErrorDescription

	^'In natural numbers, the subtrahend cannot be greater than or equal to the minuend.'.! !


!I class methodsFor: 'aux'!
subtractFrom: aPeanoNumber

	"Caso base: no seguimos restando y retornamos el previo del número."
	^aPeanoNumber prev.
! !


!I class methodsFor: '--** private fileout/in **--' stamp: 'SAR 3/29/2025 20:02:09'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := II.! !


!classDefinition: #II category: 'Números Romanos'!
DenotativeObject subclass: #II
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Números Romanos'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'II class' category: 'Números Romanos'!
II class
	instanceVariableNames: 'next prev'!

!II class methodsFor: 'aux' stamp: 'SAR 3/28/2025 05:16:06'!
subtractFrom: aPeanoNumber

	^aPeanoNumber prev - self prev.! !


!II class methodsFor: 'next - prev' stamp: 'SAR 3/28/2025 16:27:02'!
nameOfNext: aName

	"El orden en que se evaluan los nombres es importante. Por ej., si al querer ver si aName termina 
	en VIII y antes tengo aName endsWith: 'III', me va retornar IV en vez de IX que es lo correcto."

	(self name endsWith: 'CMXCIX') ifTrue:[^(self name withoutSuffix: 'CMXCIX'), 'M'].           "999 --> 1000"
	(self name endsWith: 'DCCCXCIX') ifTrue:[^(self name withoutSuffix: 'DCCCXCIX'), 'CM']. "899 --> 900"
	(self name endsWith: 'CDXCIX') ifTrue:[^(self name withoutSuffix: 'CDXCIX'), 'D'].            "499 --> 500"
	(self name endsWith: 'CCCXCIX') ifTrue:[^(self name withoutSuffix: 'CCCXCIX'), 'CD'].      "399 --> 400"
	(self name endsWith: 'XCIX') ifTrue:[^(self name withoutSuffix: 'XCIX'), 'C'].                        "99 --> 100"
	(self name endsWith: 'LXXXIX') ifTrue:[^(self name withoutSuffix: 'LXXXIX'), 'XC'].              "89 --> 90"
	(self name endsWith: 'XLIX') ifTrue:[^(self name withoutSuffix: 'XLIX'), 'L'].                         "49 --> 50"
	(self name endsWith: 'XXXIX') ifTrue:[^(self name withoutSuffix: 'XXXIX'), 'XL'].                  "39 --> 40"
	(self name endsWith: 'IX') ifTrue:[^(self name withoutSuffix: 'IX'), 'X'].                                   "9 --> 10"
	(self name endsWith: 'VIII') ifTrue:[^(self name withoutSuffix: 'VIII'), 'IX'].                               "8 --> 9"
	(self name endsWith: 'III') ifTrue:[^(self name withoutSuffix: 'III'), 'IV'].                                   "3 --> 4"
	(self name endsWith: 'IV') ifTrue:[^(self name withoutSuffix: 'IV'), 'V'].                                   "4 --> 5"
	^self name, 'I'.! !

!II class methodsFor: 'next - prev' stamp: 'SAR 3/28/2025 05:20:48'!
next

	next := self createChildNamed: (self nameOfNext: self name).
	next prev: self.
	
	^next.! !

!II class methodsFor: 'next - prev' stamp: 'SAR 3/28/2025 05:15:51'!
prev

	^prev ifNil: [prev := I].! !

!II class methodsFor: 'next - prev' stamp: 'SAR 3/28/2025 05:21:33'!
prev: itsPreviousNumber

	prev := itsPreviousNumber.
! !


!II class methodsFor: 'comparison operations' stamp: 'SAR 3/28/2025 05:14:34'!
> aPeanoNumber

	aPeanoNumber = I ifTrue: [^true].

	^self prev > aPeanoNumber prev.! !


!II class methodsFor: 'remove childs' stamp: 'SAR 3/28/2025 16:31:39'!
removeAllNext

	"Para borrar la cadena de objetos creados desde un objeto particular"

	next ifNotNil:
	[
		next removeAllNext.
		next removeFromSystem.
		next := nil.
	]! !


!II class methodsFor: 'arithmetic operations' stamp: 'SAR 3/28/2025 05:13:31'!
* aMultiplier
	
	^ (self prev * aMultiplier) + aMultiplier.! !

!II class methodsFor: 'arithmetic operations' stamp: 'SAR 3/28/2025 05:13:39'!
+ anAddend

	^self prev + anAddend next.! !

!II class methodsFor: 'arithmetic operations' stamp: 'SAR 3/28/2025 05:13:49'!
- aSustrahend

	^aSustrahend subtractFrom: self.! !

!II class methodsFor: 'arithmetic operations' stamp: 'SAR 3/29/2025 01:44:08'!
/ aDivisor
    
    | diff |

   "Si el divisor es I, entonces retorno self (dividendo)"
    aDivisor = I
       ifTrue: [^self]	.

    "Si el divisor es más grande que el dividendo, retorno error."    
    aDivisor > self
        ifTrue: [self error:  self divisorCannotBeGreaterThanDividendErrorDescription].

    "Si divisor y dividendo son iguales, retorno I"
    aDivisor = self
        ifTrue: [^I].

    diff := self - aDivisor.
    
    "Si el divisor cabe al menos una vez en el dividendo, entonces sumo I 
     y vuelvo a dividir sobre la diferencia entre dividendo y divisor. Hay 2 casos"

    "Caso 1: cabe al menos una  vez."
    diff > aDivisor
	 ifTrue: [^I + (diff / aDivisor) ].

    "Caso 2: cabe exactamente una vez."
    diff = aDivisor
	ifTrue: [^II].
     
     "Acá llego cuando, luego de hacer una división, lo que me queda para dividir es menor que el divisor"
     ^I.
! !


!II class methodsFor: 'errors' stamp: 'SAR 3/29/2025 01:44:08'!
divisorCannotBeGreaterThanDividendErrorDescription
	
	^'In natural numbers, the divisor cannot be greater than the dividend.'! !


!II class methodsFor: '--** private fileout/in **--' stamp: 'SAR 3/29/2025 20:02:09'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := AnObsoleteIII.
	prev := I.! !


!classDefinition: #RomanNumbersTest category: 'Números Romanos'!
DenotativeObject subclass: #RomanNumbersTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Números Romanos'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'RomanNumbersTest class' category: 'Números Romanos'!
RomanNumbersTest class
	instanceVariableNames: ''!

!RomanNumbersTest class methodsFor: 'division tests' stamp: 'SAR 3/29/2025 19:36:08'!
test12OneDividedByOneEqualsOne

	Assert that: I / I isEqualTo: I.! !

!RomanNumbersTest class methodsFor: 'division tests' stamp: 'SAR 3/29/2025 19:37:51'!
test13NumberDividedByOneEqualtself

	Assert that: II / I isEqualTo: II.! !

!RomanNumbersTest class methodsFor: 'division tests' stamp: 'SAR 3/29/2025 19:42:08'!
test14CanDivideBetweenNonBaseNumbers
	
	| nine three |
	three := II next.
	nine := three * three.

	Assert that: nine / three isEqualTo: three.! !

!RomanNumbersTest class methodsFor: 'division tests' stamp: 'SAR 3/29/2025 19:44:43'!
test15NonBaseNumbersCanbBeDividedWithANonZeroRemainder
	
	| three four |
	three := II next.
	four := three next.

	Assert that: four / three isEqualTo: I.! !

!RomanNumbersTest class methodsFor: 'division tests' stamp: 'SAR 3/29/2025 19:51:28'!
test16DividingByOneReturnsTheDividend

	Assert that: II / I isEqualTo: II.! !


!RomanNumbersTest class methodsFor: 'addition tests' stamp: 'SAR 3/29/2025 01:55:38'!
test01OnePlusOneEqualsTwo

	Assert that: I + I isEqualTo: II.! !

!RomanNumbersTest class methodsFor: 'addition tests' stamp: 'SAR 3/29/2025 01:59:57'!
test02OnePlusTwoEqualsThree

	Assert that: I + II isEqualTo: II next.! !

!RomanNumbersTest class methodsFor: 'addition tests' stamp: 'SAR 3/29/2025 02:00:05'!
test03TwoPlusOneEqualsThree

	Assert that: II + I isEqualTo: II next.! !

!RomanNumbersTest class methodsFor: 'addition tests' stamp: 'SAR 3/29/2025 02:00:57'!
test04TwoPlusTwoEqualsFour

	Assert that: II + II isEqualTo: II next next.! !

!RomanNumbersTest class methodsFor: 'addition tests' stamp: 'SAR 3/29/2025 20:00:31'!
test05NonBaseNumberCanBeAdded

	| three |

	three := II next.

	Assert that: II + three isEqualTo: (3 timesRepeat: [^II next]) .! !


!RomanNumbersTest class methodsFor: 'subtraction tests' stamp: 'SAR 3/29/2025 18:32:51'!
test06TwoMinusOneEqualsOne

	Assert that: II - I isEqualTo: I.! !

!RomanNumbersTest class methodsFor: 'subtraction tests' stamp: 'SAR 3/29/2025 19:29:20'!
test07CanSubstractFromNonBaseNumbers

	| three five |
	three := II next.
	five := (2 timesRepeat: [^three next]).

	Assert that: five - three isEqualTo: II.! !

!RomanNumbersTest class methodsFor: 'subtraction tests' stamp: 'SAR 3/29/2025 18:10:55'!
test08subtrahendCannotBeGreaterOrEqualToTheMinuend
	
	Assert should: [ I - II ] 
	            signal: Error 
	            withDescription: I subtrahendCannotBeGreaterOrEqualToTheMinuendErrorDescription	.! !


!RomanNumbersTest class methodsFor: 'multiplication tests' stamp: 'SAR 3/29/2025 19:15:49'!
test09OneMultipliedByOneEqualsOne

	Assert that: I * I isEqualTo: I.! !

!RomanNumbersTest class methodsFor: 'multiplication tests' stamp: 'SAR 3/29/2025 19:21:26'!
test10MultipingByOneReturnsSameNumber

	| three |
	three := II next.	

	Assert that: I * three isEqualTo: three.! !

!RomanNumbersTest class methodsFor: 'multiplication tests' stamp: 'SAR 3/29/2025 19:34:44'!
test11NonBaseNumbersCanBeMultiplied

	| three nine|
	three := II next.	
	nine := 6 timesRepeat: [^three next].

	Assert that: three * three isEqualTo: nine.! !

I initializeAfterFileIn!
II initializeAfterFileIn!