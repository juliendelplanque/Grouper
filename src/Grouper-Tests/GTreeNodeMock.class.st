"
I am a mock object for a node of a tree datastructure.
"
Class {
	#name : #GTreeNodeMock,
	#superclass : #GTreeLeafMock,
	#instVars : [
		'children'
	],
	#category : #'Grouper-Tests'
}

{ #category : #comparing }
GTreeNodeMock >> = anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	^ super = anObject and: [ children = anObject children ]
]

{ #category : #accessing }
GTreeNodeMock >> children [
	^ children
]

{ #category : #accessing }
GTreeNodeMock >> children: anObject [
	children := anObject
]

{ #category : #comparing }
GTreeNodeMock >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ super hash bitXor: children hash
]
