Class {
	#name : #GroupBuilder,
	#superclass : #Object,
	#instVars : [
		'groupingBlock'
	],
	#category : #Grouper
}

{ #category : #'as yet unclassified' }
GroupBuilder class >> groupingBlock: aBlockClosure [ 
	^ self new
		groupingBlock: aBlockClosure;
		yourself
]

{ #category : #composing }
GroupBuilder >> , aGroupBuilder [
	"I am an alias for #composeWith: allowing to exploit the power of binary messages."
	^ self composeWith: aGroupBuilder
]

{ #category : #converting }
GroupBuilder >> asCompositeGroupBuilder [
	^ CompositeGroupBuilder new
		groupingBlock: self groupingBlock;
		yourself
]

{ #category : #composing }
GroupBuilder >> composeWith: aGroupBuilder [
	^ self asCompositeGroupBuilder
		groupingBlock: self groupingBlock;
		subGroupBuilder: aGroupBuilder yourself
]

{ #category : #grouping }
GroupBuilder >> group: aCollection [
	^ (aCollection groupedBy: self groupingBlock)
]

{ #category : #accessing }
GroupBuilder >> groupingBlock [
	^ groupingBlock
]

{ #category : #accessing }
GroupBuilder >> groupingBlock: anObject [
	groupingBlock := anObject
]

{ #category : #testing }
GroupBuilder >> isComposite [
	^ false
]
