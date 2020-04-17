Class {
	#name : #Player,
	#superclass : #Object,
	#instVars : [
		'position'
	],
	#category : #'IS2-TP1'
}

{ #category : #validating }
Player class >> assertPositionGreaterThanZero: aPosition [

	aPosition > 0
		ifFalse: [ InstanceCreationFailed signal: 'A player must start at least in position 1' ]
]

{ #category : #constants }
Player class >> blue [
	
	^ self startingPosition: 1.
]

{ #category : #constants }
Player class >> green [
	
	^ self startingPosition: 1.
]

{ #category : #constants }
Player class >> orange [
	
	^ self startingPosition: 1.
]

{ #category : #constants }
Player class >> red [
	
	^ self startingPosition: 1.
]

{ #category : #'instance creation' }
Player class >> startingPosition: aPositionOnBoard [

	self assertPositionGreaterThanZero: aPositionOnBoard.

	^ self new
		initializeWithPosition: aPositionOnBoard.
		
	
]

{ #category : #'as yet unclassified' }
Player >> canMoveToPosition: diceSum max: boardSquares [

	^ self returnPosition + diceSum <= boardSquares.
]

{ #category : #initialization }
Player >> initializeWithPosition: positionOnBoard [

	position := positionOnBoard.
]

{ #category : #accessing }
Player >> move: diceSum limit: boardSquares [

	position := (self canMoveToPosition: diceSum max: boardSquares)
		ifTrue: [ self returnPosition + diceSum ]
		ifFalse: [ boardSquares ]
]

{ #category : #'as yet unclassified' }
Player >> returnPosition [

	^ position.
]
