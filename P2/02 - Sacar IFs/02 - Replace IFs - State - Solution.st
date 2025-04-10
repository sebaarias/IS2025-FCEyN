!classDefinition: #AutomobileTest category: '02 - Replace IFs State - Solution'!
TestCase subclass: #AutomobileTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '02 - Replace IFs State - Solution'!

!AutomobileTest methodsFor: 'assertions' stamp: 'SAR 4/6/2025 20:19:32'!
assertSpeedAndEngineStatusOf: anAutomobile shouldBe: anAutomobilesSpeed and: anAutomobilesEngineStatus 

	self assert: anAutomobile speed equals: anAutomobilesSpeed.
	self assert: (anAutomobile engineStatus isKindOf: anAutomobilesEngineStatus) equals: true.! !


!AutomobileTest methodsFor: 'testing' stamp: 'SAR 4/6/2025 20:21:02'!
test01WhenNewCarIsCreatedSpeedEqualsZeroAndEngineIsOff

	| auto |
	auto := Automobile new.

	self assertSpeedAndEngineStatusOf: auto shouldBe: 0 * kilometer / hour and: EngineOff.! !

!AutomobileTest methodsFor: 'testing' stamp: 'SAR 4/6/2025 20:19:32'!
test02WhenCarIsTurnedOnSpeedIsZeroAndEngineIsOn

	| auto |
	auto := Automobile new.
	
	auto turnOn.

	self assertSpeedAndEngineStatusOf: auto shouldBe: 0 and: EngineOn.! !

!AutomobileTest methodsFor: 'testing' stamp: 'SAR 4/6/2025 20:19:32'!
test03WhenCarIsOnAndAcceleratesSpeedIncreasesByTenKmh

	| auto |
	auto := Automobile new.
	
	auto turnOn.
	auto accelerate.

	self assertSpeedAndEngineStatusOf: auto shouldBe: 10 * kilometer / hour and: EngineOn.! !

!AutomobileTest methodsFor: 'testing' stamp: 'SAR 4/6/2025 20:19:32'!
test04MultipleCarAccelerationsCorrectlyIncreaseSpeed

	| auto |
	auto := Automobile new.
	
	auto turnOn.
	5 timesRepeat: [ auto accelerate. ].

	self assertSpeedAndEngineStatusOf: auto shouldBe: 50 * kilometer / hour and: EngineOn.! !

!AutomobileTest methodsFor: 'testing' stamp: 'SAR 4/6/2025 20:28:56'!
test05WhenCarIsOffCannotAccelerate

	| auto |
	auto := Automobile new.	
	
	self  should: [ auto accelerate. ]
		 raise: Error - MessageNotUnderstood
		 withExceptionDo: [ :anError |
			self assert: anError messageText = self cannotAccelerateWhenEngineIsOffErrorMessage ].! !

!AutomobileTest methodsFor: 'testing' stamp: 'SAR 4/6/2025 20:20:50'!
test06WhenCarSwitchesFromOnToOffSpeedIsZeroAndEngineIsOff

	| auto |
	auto := Automobile new.
	
	auto turnOn.
	auto accelerate.
	auto turnOff. 

	self assertSpeedAndEngineStatusOf: auto shouldBe: 0 * kilometer / hour and: EngineOff.! !


!AutomobileTest methodsFor: 'error messages' stamp: 'SAR 4/6/2025 20:29:04'!
cannotAccelerateWhenEngineIsOffErrorMessage

	^'Can not accelerate when turned off'.! !


!classDefinition: #Automobile category: '02 - Replace IFs State - Solution'!
Object subclass: #Automobile
	instanceVariableNames: 'speed engineStatus'
	classVariableNames: ''
	poolDictionaries: ''
	category: '02 - Replace IFs State - Solution'!

!Automobile methodsFor: 'initialization' stamp: 'SAR 4/6/2025 14:35:06'!
initialize

	engineStatus := EngineOff new.
	speed := 0 * kilometer / hour! !


!Automobile methodsFor: 'turn on/off' stamp: 'SAR 4/6/2025 19:39:41'!
turnOff

	engineStatus := EngineOff new.
	speed := 0.! !

!Automobile methodsFor: 'turn on/off' stamp: 'SAR 4/6/2025 17:38:57'!
turnOn

	engineStatus := EngineOn new.! !


!Automobile methodsFor: 'move' stamp: 'SAR 4/6/2025 20:34:54'!
accelerate

	engineStatus accelerate: self.! !

!Automobile methodsFor: 'move' stamp: 'SAR 4/6/2025 17:11:37'!
accelerateWhenEngineIsOff

	self error: 'Can not accelerate when turned off'.! !

!Automobile methodsFor: 'move' stamp: 'SAR 4/6/2025 17:42:31'!
accelerateWhenEngineIsOn

	speed := speed + (10 * kilometer / hour).! !


!Automobile methodsFor: 'private' stamp: 'SAR 4/6/2025 18:45:41'!
engineStatus

	^engineStatus.! !

!Automobile methodsFor: 'private' stamp: 'SAR 4/6/2025 18:36:49'!
speed
	
	^speed.! !


!classDefinition: #EngineStatus category: '02 - Replace IFs State - Solution'!
Object subclass: #EngineStatus
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '02 - Replace IFs State - Solution'!

!EngineStatus methodsFor: 'move' stamp: 'SAR 4/6/2025 20:33:32'!
accelerate: anAutomobile

	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EngineStatus class' category: '02 - Replace IFs State - Solution'!
EngineStatus class
	instanceVariableNames: ''!

!EngineStatus class methodsFor: 'move' stamp: 'SAR 4/6/2025 14:15:05'!
accelerate

	self subclassResponsibility.! !

!EngineStatus class methodsFor: 'move' stamp: 'SAR 4/6/2025 20:33:32'!
accelerate: anAutomobile 
	
	self subclassResponsibility. ! !


!classDefinition: #EngineOff category: '02 - Replace IFs State - Solution'!
EngineStatus subclass: #EngineOff
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '02 - Replace IFs State - Solution'!

!EngineOff methodsFor: 'move' stamp: 'SAR 4/6/2025 20:34:40'!
accelerate: anAutomobile

	anAutomobile accelerateWhenEngineIsOff.! !


!classDefinition: #EngineOn category: '02 - Replace IFs State - Solution'!
EngineStatus subclass: #EngineOn
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '02 - Replace IFs State - Solution'!

!EngineOn methodsFor: 'move' stamp: 'SAR 4/6/2025 20:34:15'!
accelerate: anAutomobile

	anAutomobile accelerateWhenEngineIsOn.! !
