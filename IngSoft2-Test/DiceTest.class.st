Class {
	#name : #DiceTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Test'
}

{ #category : #tests }
DiceTest >> testRollDice [
	
	| result dice |
	dice:= LoadedDice withValue:1.
	result:= dice roll.
	self assert: result equals:1.
	
	
]

{ #category : #tests }
DiceTest >> testRollDiceTwo [
	
	| result dice |
	dice:= LoadedDice withValue:2.
	
	result:= dice roll.
	self assert: result equals:2.
	
	
]

{ #category : #tests }
DiceTest >> testRollRandomDice [
	
	| result dice|
	
	dice:= Dice withSides:6.
	1 to: 6 do: [ :i|
	result:= dice roll.
	self assert: (result between:1 and: 6)]
	
	
]
