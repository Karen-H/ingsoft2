Class {
	#name : #Game,
	#superclass : #Object,
	#instVars : [
		'position',
		'players',
		'board'
	],
	#category : #'IS2-Dice'
}

{ #category : #validating }
Game class >> assertBoardSquaresGreaterThanOne: numberOfSquares [

	numberOfSquares > 1
		ifFalse: [ InstanceCreationFailed signal: 'The board must have at least 2 squares' ]
]

{ #category : #'instance creation' }
Game class >> createWith: numberOfSquares players: playersList [

	self assertBoardSquaresGreaterThanOne: numberOfSquares.

	^ self new
		initializeWithBoard: numberOfSquares
		players: playersList.
]

{ #category : #testing }
Game >> eachPlayerPosition [

	| positions |
	positions := OrderedCollection new.

	Transcript
		show: 'Positions: ';
		show: positions;
		cr.
]

{ #category : #initialization }
Game >> initializeWithBoard: numberOfSquares [

	board := numberOfSquares.
		
		
]

{ #category : #initialization }
Game >> initializeWithBoard: numberOfSquares players: playersList [

	board := numberOfSquares.
	players := playersList.
		
]

{ #category : #testing }
Game >> isOver: playersList [

	^ playersList anySatisfy: [ :player | player returnPosition == board ].
]

{ #category : #'as yet unclassified' }
Game >> play: dice [

	[ self isOver: players ] 
		whileFalse: [ players do: [ :player | player move: dice roll limit: board ] ].
]

{ #category : #'as yet unclassified' }
Game >> returnBoardSquares [

	^ board.
]

{ #category : #'as yet unclassified' }
Game >> returnNumberOfPlayers [

	^ players size.
]

{ #category : #testing }
Game >> whoWon: playersList [

	| winner |
	winner := playersList detect: [ :player | player returnPosition == board ].
	^ winner.
]
