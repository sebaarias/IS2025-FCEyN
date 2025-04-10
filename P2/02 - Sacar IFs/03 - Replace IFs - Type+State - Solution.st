!classDefinition: #VehicleTest category: #'03 - Replace IFs Type+State - Solution'!
TestCase subclass: #VehicleTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '03 - Replace IFs Type+State - Solution'!

!VehicleTest methodsFor: 'error messages' stamp: 'SAR 4/6/2025 23:05:16'!
cannotAccelerateWhenEngineIsOffErrorMessage

	^'Can not accelerate when turned off'.! !


!VehicleTest methodsFor: 'assertions' stamp: 'SAR 4/6/2025 22:46:34'!
assertSpeedAndEngineStatusOf: aVehicule shouldBe: aVehiculeSpeed and: aVehiculeEngineStatus
 
	self assert: aVehicule speed equals: aVehiculeSpeed .
	self assert: (aVehicule engineStatus isKindOf: aVehiculeEngineStatus ) equals: true.! !


!VehicleTest methodsFor: 'testing' stamp: 'SAR 4/6/2025 22:06:18'!
test01WhenNewHelicopterIsCreatedSpeedAndAltitudeEqualsZeroAndEngineIsOff

	| helicopter |
	helicopter := Helicopter new.
	
	self assertSpeedAndEngineStatusOf: helicopter shouldBe: 0 * kilometer / hour and: EngineOff.
	self assert: helicopter altitude equals: 0 * meter.
! !

!VehicleTest methodsFor: 'testing' stamp: 'SAR 4/6/2025 22:24:11'!
test02WhenMotorcycleIsOffSpeedAndAltitudeShouldEqualZero

	| moto |
	moto := Motorcycle new.

	self assertSpeedAndEngineStatusOf: moto shouldBe: 0 * kilometer / hour and: EngineOff.! !

!VehicleTest methodsFor: 'testing' stamp: 'SAR 4/6/2025 22:36:29'!
test03WhenHelicoptereIsOnAndAcceleratesSpeedIncreasesByTenKmhAndAltitudeByFiveMeters

	| helicopter |
	helicopter := Helicopter new.
	
	helicopter turnOn.
	helicopter accelerate. 

	self assertSpeedAndEngineStatusOf: helicopter shouldBe: 10* kilometer / hour and: EngineOn.
	self assert: helicopter altitude equals: 5 * meter.! !

!VehicleTest methodsFor: 'testing' stamp: 'SAR 4/6/2025 22:38:07'!
test04WhenMotorcycleIsOnAndAcceleratesSpeedIncreasesByTenKmh

	| moto |
	moto := Motorcycle new.
	
	moto turnOn.
	moto accelerate. 

	self assertSpeedAndEngineStatusOf: moto shouldBe: 20* kilometer / hour and: EngineOn..! !

!VehicleTest methodsFor: 'testing' stamp: 'SAR 4/6/2025 22:42:38'!
test05MultipleHelicopterAccelerationsCorrectlyIncreaseSpeedAndAltitude

	| helicopter |
	helicopter := Helicopter new.
	
	helicopter turnOn.
	5 timesRepeat: [ helicopter accelerate. ].

	self assertSpeedAndEngineStatusOf: helicopter shouldBe: 50 * kilometer / hour and: EngineOn.
	self assert: helicopter altitude equals: 25 * meter.! !

!VehicleTest methodsFor: 'testing' stamp: 'SAR 4/6/2025 22:51:55'!
test06MultipleMotorcycleAccelerationsCorrectlyIncreaseSpeed

	| moto |
	moto := Motorcycle new.
	
	moto turnOn.
	5 timesRepeat: [ moto accelerate. ].

	self assertSpeedAndEngineStatusOf: moto shouldBe: 100 * kilometer / hour and: EngineOn.! !

!VehicleTest methodsFor: 'testing' stamp: 'SAR 4/7/2025 00:47:03'!
test07WhenHelicopterIsOffCannotAccelerate

	| helicopter |
	helicopter := Helicopter new.
	
	self should: [ helicopter accelerate. ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = helicopter canNotAccelerateErrorMessage ].! !

!VehicleTest methodsFor: 'testing' stamp: 'SAR 4/7/2025 00:47:17'!
test08WhenMotorcyleIsOffCannotAccelerate

	| moto |
	moto := Motorcycle new.
	
	self should: [ moto accelerate. ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = moto canNotAccelerateErrorMessage ].! !

!VehicleTest methodsFor: 'testing' stamp: 'SAR 4/7/2025 01:40:54'!
test09WhenHelicopterSwitchesFromOnToOffSpeedAndAltitudeEqualsZeroAndEngineIsOff

	| helicopter |
	helicopter := Helicopter new.
	
	helicopter turnOn.
	helicopter accelerate.
	helicopter turnOff.
	
	self assertSpeedAndEngineStatusOf: helicopter shouldBe: 0 * kilometer / hour and: EngineOff.
	self assert: helicopter altitude equals: 0 * meter.! !

!VehicleTest methodsFor: 'testing' stamp: 'SAR 4/7/2025 01:47:02'!
test10WhenMotorcycleSwitchesFromOnToOffSpeedEqualsZeroAndEngineIsOff

	| moto |
	moto := Helicopter new.
	
	moto turnOn.
	moto accelerate.
	moto turnOff.
	
	self assertSpeedAndEngineStatusOf: moto shouldBe: 0 * kilometer / hour and: EngineOff.! !


!classDefinition: #EngineStatus category: #'03 - Replace IFs Type+State - Solution'!
Object subclass: #EngineStatus
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '03 - Replace IFs Type+State - Solution'!

!EngineStatus methodsFor: 'move' stamp: 'SAR 4/7/2025 00:27:07'!
accelerate: aVehicule
	
	self subclassResponsibility.! !


!classDefinition: #EngineOff category: #'03 - Replace IFs Type+State - Solution'!
EngineStatus subclass: #EngineOff
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '03 - Replace IFs Type+State - Solution'!

!EngineOff methodsFor: 'move' stamp: 'SAR 4/7/2025 00:28:15'!
accelerate: aVehicule 
	
	aVehicule accelerateWhenEngineIsOff.! !


!classDefinition: #EngineOn category: #'03 - Replace IFs Type+State - Solution'!
EngineStatus subclass: #EngineOn
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '03 - Replace IFs Type+State - Solution'!

!EngineOn methodsFor: 'move' stamp: 'SAR 4/7/2025 00:28:01'!
accelerate: aVehicule 
	
	aVehicule accelerateWhenEngineIsOn.! !


!classDefinition: #Vehicle category: #'03 - Replace IFs Type+State - Solution'!
Object subclass: #Vehicle
	instanceVariableNames: 'speed engineStatus'
	classVariableNames: ''
	poolDictionaries: ''
	category: '03 - Replace IFs Type+State - Solution'!

!Vehicle methodsFor: 'initialization' stamp: 'SAR 4/6/2025 23:07:31'!
initialize

	engineStatus := EngineOff new. 
	speed := 0 * kilometer / hour.! !


!Vehicle methodsFor: 'move' stamp: 'SAR 4/6/2025 23:06:53'!
accelerate
	
	self subclassResponsibility. 
! !

!Vehicle methodsFor: 'move' stamp: 'SAR 4/7/2025 00:28:44'!
accelerateWhenEngineIsOff
	
	self subclassResponsibility. 
! !

!Vehicle methodsFor: 'move' stamp: 'SAR 4/7/2025 00:28:49'!
accelerateWhenEngineIsOn
	
	self subclassResponsibility. 
! !


!Vehicle methodsFor: 'on/off' stamp: 'SAR 4/7/2025 01:42:29'!
turnOff

	engineStatus := EngineOff new.
	speed := 0 * kilometer / hour. ! !

!Vehicle methodsFor: 'on/off' stamp: 'SAR 4/6/2025 23:07:03'!
turnOn

	engineStatus := EngineOn new.! !


!Vehicle methodsFor: 'error messages' stamp: 'SAR 4/7/2025 00:49:18'!
canNotAccelerateErrorMessage

	self subclassResponsibility.! !


!Vehicle methodsFor: 'private' stamp: 'SAR 4/6/2025 22:22:54'!
engineStatus

	^engineStatus! !

!Vehicle methodsFor: 'private' stamp: 'SAR 4/6/2025 22:10:26'!
speed

	^speed! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Vehicle class' category: #'03 - Replace IFs Type+State - Solution'!
Vehicle class
	instanceVariableNames: ''!

!Vehicle class methodsFor: 'instance creation' stamp: 'ARM 4/29/2024 11:00:51'!
helicopter

	^self new initializeWithType: #Helicopter! !

!Vehicle class methodsFor: 'instance creation' stamp: 'ARM 4/29/2024 11:00:51'!
motorcycle

	^self new initializeWithType: #Motorcycle! !


!classDefinition: #Helicopter category: #'03 - Replace IFs Type+State - Solution'!
Vehicle subclass: #Helicopter
	instanceVariableNames: 'altitude'
	classVariableNames: ''
	poolDictionaries: ''
	category: '03 - Replace IFs Type+State - Solution'!

!Helicopter methodsFor: 'initialization' stamp: 'SAR 4/6/2025 22:21:59'!
initialize

	super initialize.
	altitude := 0 * meter.! !

!Helicopter methodsFor: 'initialization' stamp: 'SAR 4/7/2025 01:44:01'!
turnOff

	super turnOff .
	altitude := 0 * meter.! !


!Helicopter methodsFor: 'error messages' stamp: 'SAR 4/7/2025 00:59:20'!
canNotAccelerateErrorMessage

	^'Can not fly when turned off'.! !


!Helicopter methodsFor: 'move' stamp: 'SAR 4/6/2025 23:18:56'!
accelerate

	engineStatus accelerate: self.

	"speed := speed + (10 * kilometer / hour).
	altitude := altitude + (5 * meter)."! !

!Helicopter methodsFor: 'move' stamp: 'SAR 4/7/2025 00:54:25'!
accelerateWhenEngineIsOff

	self error: 'Can not fly when turned off'.! !

!Helicopter methodsFor: 'move' stamp: 'SAR 4/7/2025 00:29:19'!
accelerateWhenEngineIsOn

	speed := speed + (10 * kilometer / hour).
	altitude := altitude + (5 * meter).! !


!Helicopter methodsFor: 'private' stamp: 'SAR 4/6/2025 22:23:09'!
altitude

	^altitude! !


!classDefinition: #Motorcycle category: #'03 - Replace IFs Type+State - Solution'!
Vehicle subclass: #Motorcycle
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '03 - Replace IFs Type+State - Solution'!

!Motorcycle methodsFor: 'move' stamp: 'SAR 4/7/2025 00:48:28'!
accelerate

	self engineStatus accelerate: self.
	"speed := speed + (20 * kilometer / hour)."! !

!Motorcycle methodsFor: 'move' stamp: 'SAR 4/7/2025 01:00:27'!
accelerateWhenEngineIsOff

	self error: 'Can not run when turned off'.! !

!Motorcycle methodsFor: 'move' stamp: 'SAR 4/7/2025 00:32:26'!
accelerateWhenEngineIsOn

	speed := speed + (20 * kilometer / hour).! !


!Motorcycle methodsFor: 'error messages' stamp: 'SAR 4/7/2025 00:49:47'!
canNotAccelerateErrorMessage

	^'Can not run when turned off'.! !
