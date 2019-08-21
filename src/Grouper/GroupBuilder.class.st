Class {
	#name : #GroupBuilder,
	#superclass : #AbstractGroupBuilder,
	#instVars : [
		'collectBlock'
	],
	#category : #Grouper
}

{ #category : #'as yet unclassified' }
GroupBuilder class >> groupingBlock: aBlockClosure [ 
	^ self new
		groupingBlock: aBlockClosure;
		yourself
]

{ #category : #converting }
GroupBuilder >> asCompositeGroupBuilder [
	^ CompositeGroupBuilder new
		groupingBlock: self groupingBlock;
		yourself
]

{ #category : #accessing }
GroupBuilder >> collectBlock [
	^ collectBlock
]

{ #category : #accessing }
GroupBuilder >> collectBlock: anObject [
	collectBlock := anObject
]

{ #category : #composing }
GroupBuilder >> composeWith: aGroupBuilder [
	^ self asCompositeGroupBuilder
		groupingBlock: self groupingBlock;
		subGroupBuilder: aGroupBuilder yourself
]

{ #category : #grouping }
GroupBuilder >> group: aCollection [
	^ (aCollection groupedBy: self groupingBlock) collect: [ :collection |
		collection collect: self collectBlock ]
]

{ #category : #initialization }
GroupBuilder >> initialize [
	super initialize.
	self collectBlock: [ :object | object ]
]
