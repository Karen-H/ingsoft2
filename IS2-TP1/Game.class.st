Class {
	#name : #Game,
	#superclass : #Object,
	#instVars : [
		'position',
		'players',
		'board'
	],
	#category : #'IS2-TP1'
}

{ #category : #validating }
Game class >> assertBoardSquaresGreaterThanOne: numberOfSquares [

	numberOfSquares > 1
		ifFalse: [ InstanceCreationFailed signal: 'The board must have at least 2 squares' ]
]

{ #category : #validating }
Game class >> assertPlayersGreaterThanZero: players [

	players isEmpty
		ifTrue: [ InstanceCreationFailed signal: 'There must be at least 1 player' ]
]

{ #category : #'instance creation' }
Game class >> createWithBoard: numberOfSquares allPlayers: players [

	self 
		assertBoardSquaresGreaterThanOne: numberOfSquares;
		assertPlayersGreaterThanZero: players.

	^ self new
		initializeWithBoard: numberOfSquares
		players: players.
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
