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

{ #category : #copying }
GroupBuilder >> , aGroupBuilder [
	^ self asCompositeGroupBuilder
		groupingBlock: self groupingBlock;
		subGroupBuilder: aGroupBuilder
		yourself
]

{ #category : #converting }
GroupBuilder >> asCompositeGroupBuilder [
	^ CompositeGroupBuilder new
		groupingBlock: self groupingBlock;
		yourself
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
