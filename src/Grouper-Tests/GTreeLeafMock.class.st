"
I am a mock object for a leaf of a tree datastructure.
"
Class {
	#name : #GTreeLeafMock,
	#superclass : #Object,
	#instVars : [
		'content'
	],
	#category : #'Grouper-Tests'
}

{ #category : #comparing }
GTreeLeafMock >> = anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	^ content = anObject content
]

{ #category : #accessing }
GTreeLeafMock >> content [
	^ content
]

{ #category : #accessing }
GTreeLeafMock >> content: anObject [
	content := anObject
]

{ #category : #comparing }
GTreeLeafMock >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ content hash
]
