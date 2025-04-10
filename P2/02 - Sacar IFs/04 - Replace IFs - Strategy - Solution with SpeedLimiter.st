!classDefinition: #VehicleTests category: '04 - Replace IFs - Strategy'!
TestCase subclass: #VehicleTests
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '04 - Replace IFs - Strategy'!

!VehicleTests methodsFor: 'testing' stamp: 'SAR 4/10/2025 01:39:28'!
test01LandVehicleCannotAccelerateWhileTurnedOff

	| landVehicle |

	landVehicle := self electricMotorcycle.
	
	self should: [ landVehicle accelerate ] 
	raise: Error 
	withExceptionDo: [ :error | error messageText = 'Can not run when turned off'.
		self assert: (landVehicle speedAt: (0 * kilometer / hour)) ]! !

!VehicleTests methodsFor: 'testing' stamp: 'SAR 4/10/2025 01:49:00'!
test02AirVehicleCannotAccelerateWhileTurnedOff

	| airVehicle |
	
	airVehicle := self helicopter.
	
	self should: [ airVehicle accelerate ] 
	raise: Error 
	withExceptionDo: [ :error | error messageText = 'Can not fly when turned off'.
		self assert: (airVehicle speedAt: (0 * kilometer / hour)).
		self assert: (airVehicle altitudeAt: (0 * meter)) ]
	
	
	! !

!VehicleTests methodsFor: 'testing' stamp: 'SAR 4/10/2025 01:48:32'!
test03ElectricVehicleAccelerateAsIntended

	| electricVehicle |
	
	electricVehicle := self electricMotorcycle.
	
	electricVehicle turnOn.
	self assert: (electricVehicle speedAt: 0 * kilometer / hour).
	
	electricVehicle accelerate.
	self assert: (electricVehicle speedAt: 10 * kilometer / hour).
	
	electricVehicle accelerate.
	self assert: (electricVehicle speedAt: 40 * kilometer / hour)
! !

!VehicleTests methodsFor: 'testing' stamp: 'SAR 4/10/2025 02:07:04'!
test04GasolineVehicleAccelerateAsIntended

	| gasolineVehicle |

	gasolineVehicle := self gasolineMotorcycle.
	
	gasolineVehicle turnOn.
	self assert: (gasolineVehicle speedAt: 0 * kilometer / hour).
	
	gasolineVehicle accelerate.
	self assert: (gasolineVehicle speedAt: 10 * kilometer / hour).
	
	gasolineVehicle accelerate.
	self assert: (gasolineVehicle speedAt: 20 * kilometer / hour).

	! !

!VehicleTests methodsFor: 'testing' stamp: 'SAR 4/8/2025 16:45:25'!
test05JetFueledVehicleAccelerateAsIntended

	| jetFueledVehicle |
	
	jetFueledVehicle := self helicopter.
	
	jetFueledVehicle turnOn.
	self assert: (jetFueledVehicle speedAt: 0 * kilometer / hour).
	
	jetFueledVehicle accelerate.
	self assert: (jetFueledVehicle speedAt: 1 * kilometer / hour).
	
	jetFueledVehicle accelerate.
	self assert: (jetFueledVehicle speedAt: 5 * kilometer / hour).
	
	jetFueledVehicle accelerate.
	self assert: (jetFueledVehicle speedAt: 41 * kilometer / hour)
	
	
	
	
	! !

!VehicleTests methodsFor: 'testing' stamp: 'SAR 4/10/2025 00:25:34'!
test06AirVehicleGoesUpAsItAcceleratesAsExpected

	| airVehicle |
	
	airVehicle := self helicopter.
	
	airVehicle turnOn.
	self assert: (airVehicle altitudeAt: 0 * meter).
	
	airVehicle accelerate.
	self assert: (airVehicle altitudeAt: 5 * meter).
	
	airVehicle accelerate.
	self assert: (airVehicle altitudeAt: 10 * meter)
	
	! !

!VehicleTests methodsFor: 'testing' stamp: 'SAR 4/10/2025 00:37:17'!
test07SpeedLimiterForCityLimitsSpeedAt70Kmh

	| cityVehicle |
	
	cityVehicle :=  self electricMotorcycle.
	
	cityVehicle turnOn.
	self assert: (cityVehicle speedAt: 0 * kilometer / hour).
	
	20 timesRepeat: [ cityVehicle accelerate ].
	
	self assert: (cityVehicle speedAt: 70 * kilometer / hour)
	
	
	! !

!VehicleTests methodsFor: 'testing' stamp: 'SAR 4/10/2025 00:52:10'!
test08SpeedLimiterForOpenRoadLimitsSpeedAt130Kmh

	| openRoadVehicle |
	
	openRoadVehicle := self gasolineMotorcycle.
	
	openRoadVehicle turnOn.
	self assert: (openRoadVehicle speedAt: 0 * kilometer / hour).
	
	20 timesRepeat: [ openRoadVehicle accelerate ].
	
	self assert: (openRoadVehicle speedAt: 130 * kilometer / hour)
	
	
	! !

!VehicleTests methodsFor: 'testing' stamp: 'SAR 4/10/2025 00:53:32'!
test09SpeedLimiterForAirTrafficLimitsSpeedAt500Kmh

	| vehicleInAir |
	
	vehicleInAir := self helicopter.
	
	vehicleInAir turnOn.
	self assert: (vehicleInAir speedAt: 0 * kilometer / hour).
	
	20 timesRepeat: [ vehicleInAir accelerate ].
	
	self assert: (vehicleInAir speedAt: 500 * kilometer / hour)
	
	
	! !


!VehicleTests methodsFor: 'initialization' stamp: 'SAR 4/10/2025 02:09:44'!
electricMotorcycle

	^Motorcycle withEngine: ElectricEngine new 
	                       andSpeedLimiter: (SpeedLimiter withLimit: 70 * kilometer / hour).! !

!VehicleTests methodsFor: 'initialization' stamp: 'SAR 4/10/2025 02:09:53'!
gasolineMotorcycle
	
	^Motorcycle withEngine: GasolineEngine new 
	                       andSpeedLimiter: (SpeedLimiter withLimit: 130 * kilometer / hour).! !

!VehicleTests methodsFor: 'initialization' stamp: 'SAR 4/10/2025 02:10:02'!
helicopter
	
	^Helicopter withEngine: JetFueledEngine new 
	                      andSpeedLimiter: (SpeedLimiter withLimit: 500 * kilometer / hour).! !


!classDefinition: #Engine category: '04 - Replace IFs - Strategy'!
Object subclass: #Engine
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '04 - Replace IFs - Strategy'!

!Engine methodsFor: 'move' stamp: 'SAR 4/8/2025 16:37:09'!
accelerateWithSpeed: aCurrentSpeed

	self subclassResponsibility.! !


!classDefinition: #ElectricEngine category: '04 - Replace IFs - Strategy'!
Engine subclass: #ElectricEngine
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '04 - Replace IFs - Strategy'!

!ElectricEngine methodsFor: 'move' stamp: 'SAR 4/8/2025 16:34:18'!
accelerateWithSpeed: aCurrentSpeed

	^(aCurrentSpeed + (5 * kilometer / hour)) * 2.

	! !


!classDefinition: #GasolineEngine category: '04 - Replace IFs - Strategy'!
Engine subclass: #GasolineEngine
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '04 - Replace IFs - Strategy'!

!GasolineEngine methodsFor: 'move' stamp: 'SAR 4/8/2025 16:43:44'!
accelerateWithSpeed: aCurrentSpeed
 
	^10 * kilometer / hour.! !


!classDefinition: #JetFueledEngine category: '04 - Replace IFs - Strategy'!
Engine subclass: #JetFueledEngine
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '04 - Replace IFs - Strategy'!

!JetFueledEngine methodsFor: 'move' stamp: 'SAR 4/8/2025 16:39:28'!
accelerateWithSpeed: aCurrentSpeed
 
	^( (aCurrentSpeed amount + 1) ^2 ) * kilometer / hour.! !


!classDefinition: #EngineState category: '04 - Replace IFs - Strategy'!
Object subclass: #EngineState
	instanceVariableNames: 'vehicle'
	classVariableNames: ''
	poolDictionaries: ''
	category: '04 - Replace IFs - Strategy'!

!EngineState methodsFor: 'initialization' stamp: 'SAR 4/8/2025 05:24:07'!
initializeStateOf: aVehicle 

	vehicle := aVehicle.! !


!EngineState methodsFor: 'move' stamp: 'SAR 4/8/2025 02:52:02'!
accelerate

	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EngineState class' category: '04 - Replace IFs - Strategy'!
EngineState class
	instanceVariableNames: ''!

!EngineState class methodsFor: 'instance creation' stamp: 'SAR 4/8/2025 05:24:07'!
of: aVehicle

	^self new initializeStateOf: aVehicle.! !


!classDefinition: #EngineOff category: '04 - Replace IFs - Strategy'!
EngineState subclass: #EngineOff
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '04 - Replace IFs - Strategy'!

!EngineOff methodsFor: 'move' stamp: 'SAR 4/8/2025 02:57:20'!
accelerate

	^self error: vehicle cannotMoveWhenEngineIsOffErrorMessage.! !


!classDefinition: #EngineOn category: '04 - Replace IFs - Strategy'!
EngineState subclass: #EngineOn
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '04 - Replace IFs - Strategy'!

!EngineOn methodsFor: 'move' stamp: 'SAR 4/8/2025 05:11:26'!
accelerate

	vehicle accelerateWhenEngineIsOn.! !


!classDefinition: #SpeedLimiter category: '04 - Replace IFs - Strategy'!
Object subclass: #SpeedLimiter
	instanceVariableNames: 'speedLimit'
	classVariableNames: ''
	poolDictionaries: ''
	category: '04 - Replace IFs - Strategy'!

!SpeedLimiter methodsFor: 'initialization' stamp: 'SAR 4/10/2025 01:42:24'!
initializeWithLimit: aSpeedLimit 

	speedLimit := aSpeedLimit.! !


!SpeedLimiter methodsFor: 'private' stamp: 'SAR 4/10/2025 02:06:09'!
speedLimit

	^speedLimit.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SpeedLimiter class' category: '04 - Replace IFs - Strategy'!
SpeedLimiter class
	instanceVariableNames: 'limit'!

!SpeedLimiter class methodsFor: 'instance creation' stamp: 'SAR 4/10/2025 01:41:46'!
withLimit: aSpeedLimit 
	
	^self new initializeWithLimit: aSpeedLimit.! !


!classDefinition: #Vehicle category: '04 - Replace IFs - Strategy'!
Object subclass: #Vehicle
	instanceVariableNames: 'engine engineState speed speedLimiter'
	classVariableNames: ''
	poolDictionaries: ''
	category: '04 - Replace IFs - Strategy'!

!Vehicle methodsFor: 'initialization' stamp: 'SAR 4/10/2025 01:47:07'!
initializeWithEngine: anEngine andSpeedLimiter: aSpeedLimiter 

	engine := anEngine.
	speedLimiter := aSpeedLimiter.
	engineState := EngineOff of: self.
	speed := 0 * kilometer / hour.! !


!Vehicle methodsFor: 'move' stamp: 'SAR 4/10/2025 01:27:12'!
accelerate

	engineState accelerate.! !

!Vehicle methodsFor: 'move' stamp: 'SAR 4/10/2025 02:05:39'!
accelerateWhenEngineIsOn

	speed := speedLimiter speedLimit min: self accelerateWithSpeed.! !

!Vehicle methodsFor: 'move' stamp: 'SAR 4/10/2025 01:27:24'!
accelerateWithSpeed

	^speed + (engine accelerateWithSpeed: speed).! !

!Vehicle methodsFor: 'move' stamp: 'SAR 4/10/2025 01:27:32'!
speedAt: aSpeed

	^speed = aSpeed.! !


!Vehicle methodsFor: 'on/off' stamp: 'SAR 4/10/2025 01:27:46'!
turnOff

	speed := 0 * kilometer / hour.! !

!Vehicle methodsFor: 'on/off' stamp: 'SAR 4/10/2025 00:53:56'!
turnOn

	engineState := EngineOn of: self.! !


!Vehicle methodsFor: 'error messages' stamp: 'SAR 4/8/2025 02:59:55'!
cannotMoveWhenEngineIsOffErrorMessage

	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Vehicle class' category: '04 - Replace IFs - Strategy'!
Vehicle class
	instanceVariableNames: ''!

!Vehicle class methodsFor: 'instance creation' stamp: 'SAR 4/10/2025 01:46:02'!
withEngine: anEngine andSpeedLimiter: aSpeedLimiter
 
	^self new initializeWithEngine: anEngine andSpeedLimiter: aSpeedLimiter.! !


!classDefinition: #Helicopter category: '04 - Replace IFs - Strategy'!
Vehicle subclass: #Helicopter
	instanceVariableNames: 'altitude'
	classVariableNames: ''
	poolDictionaries: ''
	category: '04 - Replace IFs - Strategy'!

!Helicopter methodsFor: 'error messages' stamp: 'SAR 4/10/2025 00:13:45'!
cannotMoveWhenEngineIsOffErrorMessage

	^'Can not fly when turned off'.! !


!Helicopter methodsFor: 'move' stamp: 'SAR 4/10/2025 00:26:58'!
accelerateWhenEngineIsOn
	
	super accelerateWhenEngineIsOn.
	altitude := altitude + (5 * meter).! !


!Helicopter methodsFor: 'altitude' stamp: 'SAR 4/10/2025 00:09:01'!
altitudeAt: anAltitude

	^altitude = anAltitude.! !


!Helicopter methodsFor: 'initialization' stamp: 'SAR 4/10/2025 00:10:03'!
initializeWithEngine: anEngine andSpeedLimitOf: aSpeedLimit 

	super initializeWithEngine: anEngine andSpeedLimitOf: aSpeedLimit.
	altitude := 0 * meter.! !

!Helicopter methodsFor: 'initialization' stamp: 'SAR 4/10/2025 01:58:16'!
initializeWithEngine: anEngine andSpeedLimiter: aSpeedLimiter

	super initializeWithEngine: anEngine andSpeedLimiter: aSpeedLimiter.
	altitude := 0 * meter.! !


!classDefinition: #Motorcycle category: '04 - Replace IFs - Strategy'!
Vehicle subclass: #Motorcycle
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '04 - Replace IFs - Strategy'!

!Motorcycle methodsFor: 'error messages' stamp: 'SAR 4/8/2025 03:01:12'!
cannotMoveWhenEngineIsOffErrorMessage

	^'Can not run when turned off'.! !


!Motorcycle methodsFor: 'move' stamp: 'SAR 4/8/2025 02:26:54'!
accelerate

	engineState accelerate.! !
