!classDefinition: #Vehicle category: '01 - Replace IFs -Type - Solution'!
Object subclass: #Vehicle
	instanceVariableNames: 'speed'
	classVariableNames: ''
	poolDictionaries: ''
	category: '01 - Replace IFs -Type - Solution'!

!Vehicle methodsFor: 'initialization' stamp: 'SAR 4/6/2025 13:34:06'!
initialize

	speed := 0 * kilometer / hour.! !


!Vehicle methodsFor: 'move' stamp: 'SAR 4/6/2025 13:34:45'!
accelerate

	self subclassResponsibility.! !


!classDefinition: #Helicopter category: '01 - Replace IFs -Type - Solution'!
Vehicle subclass: #Helicopter
	instanceVariableNames: 'altitude'
	classVariableNames: ''
	poolDictionaries: ''
	category: '01 - Replace IFs -Type - Solution'!

!Helicopter methodsFor: 'initialization' stamp: 'SAR 4/6/2025 13:28:49'!
initialize

	super initialize.
	altitude := 0 * meter.! !


!Helicopter methodsFor: 'move' stamp: 'SAR 4/6/2025 13:22:05'!
acelerate

	speed := speed + (10 * kilometer / hour).
	altitude := altitude + (5 * meter).! !


!classDefinition: #Motorcycle category: '01 - Replace IFs -Type - Solution'!
Vehicle subclass: #Motorcycle
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '01 - Replace IFs -Type - Solution'!

!Motorcycle methodsFor: 'move' stamp: 'SAR 4/6/2025 13:22:58'!
acelerate

	speed := speed + (20 * kilometer / hour).! !
