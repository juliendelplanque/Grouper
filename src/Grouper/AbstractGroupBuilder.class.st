Class {
	#name : #AbstractGroupBuilder,
	#superclass : #Object,
	#instVars : [
		'groupingBlock',
		'nodeCollect'
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

{ #category : #initialization }
AbstractGroupBuilder >> initialize [
	super initialize.
	self nodeCollect: [ :dictionary | dictionary ]
]

{ #category : #testing }
AbstractGroupBuilder >> isComposite [
	^ false
]

{ #category : #testing }
AbstractGroupBuilder >> isRoot [
	^ false
]

{ #category : #accessing }
AbstractGroupBuilder >> leafCollect [
	^ self subclassResponsibility
]

{ #category : #accessing }
AbstractGroupBuilder >> leafCollect: aBlock [
	^ self subclassResponsibility
]

{ #category : #accessing }
AbstractGroupBuilder >> nodeCollect [
	^ nodeCollect
]

{ #category : #accessing }
AbstractGroupBuilder >> nodeCollect: anObject [
	nodeCollect := anObject
]
