!classDefinition: #I category: 'Números de Peano'!
DenotativeObject subclass: #I
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Números de Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'I class' category: 'Números de Peano'!
I class
	instanceVariableNames: ''!

!I class methodsFor: 'next - prev' stamp: 'SAR 3/23/2025 01:58:22'!
next

	^self createChildNamed: self name , 'I'.! !

!I class methodsFor: 'next - prev' stamp: 'SAR 3/23/2025 05:36:14'!
prev

	^self error: self errorCannotSubtractFromOne.
! !


!I class methodsFor: 'comparison operations' stamp: 'SAR 3/24/2025 00:14:55'!
> aPeanoNumber

	^ false.! !


!I class methodsFor: 'arithmetic operations' stamp: 'SAR 3/23/2025 22:18:38'!
* aMultiplier
	
	^aMultiplier.
! !

!I class methodsFor: 'arithmetic operations' stamp: 'SAR 3/23/2025 22:22:19'!
+ anAddend
	
	^anAddend next.
! !

!I class methodsFor: 'arithmetic operations' stamp: 'SAR 3/23/2025 22:23:58'!
- aSustrahend

	^ self error: self errorNaturalsNotClosedUnderSubtraction.
! !

!I class methodsFor: 'arithmetic operations' stamp: 'SAR 3/23/2025 23:54:17'!
/ aDivisor

	self = aDivisor
		ifTrue: [^self].
	
	^self error: self errorNaturalsNotClosedUnderDivision.! !


!I class methodsFor: 'errors' stamp: 'SAR 3/23/2025 05:37:59'!
errorCannotSubtractFromOne

	^'Subtraction is not defined for the number one'.! !

!I class methodsFor: 'errors' stamp: 'SAR 3/23/2025 23:19:29'!
errorNaturalsNotClosedUnderDivision
	
	^'Natural numbers are not closed under division.'.! !

!I class methodsFor: 'errors' stamp: 'SAR 3/23/2025 23:19:57'!
errorNaturalsNotClosedUnderSubtraction
	
	^'Natural numbers are not closed under subtraction.'.! !


!I class methodsFor: 'aux' stamp: 'SAR 3/23/2025 16:40:29'!
subtractFrom: aPeanoNumber

	"Caso base: no seguimos restando y retornamos el previo del número."
	^aPeanoNumber prev.
! !


!classDefinition: #II category: 'Números de Peano'!
I subclass: #II
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Números de Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'II class' category: 'Números de Peano'!
II class
	instanceVariableNames: ''!

!II class methodsFor: 'comparison operations' stamp: 'SAR 3/23/2025 19:49:18'!
> aPeanoNumber

	aPeanoNumber = I ifTrue: [^true].

	^self prev > aPeanoNumber prev.
! !


!II class methodsFor: 'arithmetic operations' stamp: 'SAR 3/23/2025 23:47:10'!
* aMultiplier
	
	^ (self prev * aMultiplier) + aMultiplier.
! !

!II class methodsFor: 'arithmetic operations' stamp: 'SAR 3/23/2025 22:22:01'!
+ anAddend

	^self prev + anAddend next.! !

!II class methodsFor: 'arithmetic operations' stamp: 'SAR 3/23/2025 22:24:09'!
- aSustrahend

	^aSustrahend subtractFrom: self.! !

!II class methodsFor: 'arithmetic operations' stamp: 'SAR 3/24/2025 00:56:48'!
/ aDivisor
    
    | diff |

   "Si el divisor es I, entonces retorno self (dividendo)"
    aDivisor = I
       ifTrue: [^self]	.

    "Si el divisor es más grande que el dividendo, retorno error."    
    aDivisor > self
        ifTrue: [self error:  self errorNaturalsNotClosedUnderDivision].

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


!II class methodsFor: 'next - prev' stamp: 'SAR 3/23/2025 01:51:27'!
next

	^self createChildNamed: self name , 'I'.! !

!II class methodsFor: 'next - prev' stamp: 'SAR 3/23/2025 01:59:12'!
prev

	^self parent.! !


!II class methodsFor: 'aux' stamp: 'SAR 3/23/2025 16:36:24'!
subtractFrom: aPeanoNumber

	^aPeanoNumber prev - self prev.
! !


!classDefinition: #III category: 'Números de Peano'!
II subclass: #III
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Números de Peano'!


!classDefinition: #IIII category: 'Números de Peano'!
III subclass: #IIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Números de Peano'!


!classDefinition: #IIIII category: 'Números de Peano'!
IIII subclass: #IIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Números de Peano'!


!classDefinition: #IIIIII category: 'Números de Peano'!
IIIII subclass: #IIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Números de Peano'!
