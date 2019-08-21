Class {
	#name : #AbstractGroupBuilder,
	#superclass : #Object,
	#instVars : [
		'groupingBlock'
	],
	#category : #Grouper
}

{ #category : #composing }
AbstractGroupBuilder >> , aGroupBuilder [
	"I am an alias for #composeWith: allowing to exploit the power of binary messages."
	^ self composeWith: aGroupBuilder
]

{ #category : #composing }
AbstractGroupBuilder >> composeWith: aGroupBuilder [
	^ self subclassResponsibility
]

{ #category : #grouping }
AbstractGroupBuilder >> group: aCollection [
	^ self subclassResponsibility
]

{ #category : #accessing }
AbstractGroupBuilder >> groupingBlock [
	^ groupingBlock
]

{ #category : #accessing }
AbstractGroupBuilder >> groupingBlock: anObject [
	groupingBlock := anObject
]

{ #category : #testing }
AbstractGroupBuilder >> isComposite [
	^ false
]
