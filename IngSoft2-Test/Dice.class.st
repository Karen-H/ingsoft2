Class {
	#name : #Dice,
	#superclass : #Object,
	#instVars : [
		'sides'
	],
	#category : #'IngSoft2-Test'
}

{ #category : #'instance creation' }
Dice class >> withSides: anInteger [ 
	
	^self  new initializeWithSide:anInteger.
]

{ #category : #initialization }
Dice >> initializeWithSide: anInteger [ 
	sides:=anInteger.
	
]

{ #category : #rolling }
Dice >> roll [
	^Random new nextInt:sides.
]
