Class {
	#name : #LoadedDice,
	#superclass : #Object,
	#instVars : [
		'value'
	],
	#category : #'IngSoft2-Test'
}

{ #category : #'instance creation' }
LoadedDice class >> withValue: anInteger [ 
	^self new initializeWithValue:anInteger.
]

{ #category : #initialization }
LoadedDice >> initializeWithValue: anInteger [ 
	value:=anInteger.
	
]

{ #category : #'as yet unclassified' }
LoadedDice >> roll [
	^value.
]
