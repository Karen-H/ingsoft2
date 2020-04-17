Class {
	#name : #GameTest,
	#superclass : #TestCase,
	#category : #'IS2-Dice-Tests'
}

{ #category : #tests }
GameTest >> testAddPlayers [

	| player1 player2 players |
	player1 := Player startingPosition: 1.
	player2 := Player startingPosition: 5.
	players := OrderedCollection new.
	players add: player1.
	players add: player2.
	self assert: players size equals: 2.
	self assert: players first equals: player1.
]

{ #category : #tests }
GameTest >> testGameCreation [

	| game player1 player2 players |
	player1 := Player startingPosition: 1.
	player2 := Player startingPosition: 1.
	players := OrderedCollection with: player1 with: player2.
	game := Game createWith: 20 players: players.
	self assert: game returnBoardSquares equals: 20.
	self assert: game returnNumberOfPlayers equals: 2.
]

{ #category : #tests }
GameTest >> testOnePlayerRollsUntilGameOver [

	| game player d4 players |
	player := Player startingPosition: 1.
	players := OrderedCollection with: player.
	game := Game createWith: 20 players: players.
	d4 := Die of: 4.
	game play: d4.
	self assert: player returnPosition equals: game returnBoardSquares.
]

{ #category : #tests }
GameTest >> testPlayUntilGameOver [

	| game player1 player2 d4 d8 dice players |
	player1 := Player startingPosition: 1.
	player2 := Player startingPosition: 1.
	players := OrderedCollection with: player1 with: player2.
	game := Game createWith: 20 players: players.
	d4 := Die of: 4 rolling: #(1 2 3 4). "player1: 7 17"
	d8 := Die of: 8 rolling: #(5 6 7 8). "player2: 9 21 (20)"
	dice := d4 + d8.	
	game play: dice.
	self assert: player1 returnPosition equals: 17.
	self assert: player2 returnPosition equals: 20.
	self assert: (game whoWon: players) equals: player2.
	game eachPlayerPosition.
]

{ #category : #tests }
GameTest >> testPlayerMaxPosition [

	| game player |
	player := Player startingPosition: 5.
	game := Game createWith: 20 players: player.
	player move: 30 limit: game returnBoardSquares.
	self assert: player returnPosition equals: 20.
]

{ #category : #tests }
GameTest >> testPlayersPosition [

	| player1 player2 players positions|
	player1 := Player startingPosition: 1.
	player2 := Player startingPosition: 5.
	players := OrderedCollection new.
	positions := OrderedCollection new.
	positions add: 1. 
	positions add: 5.
	players add: player1.
	players add: player2.
	self assert: (players collect: [ :player | player returnPosition ]) equals: positions.

]
