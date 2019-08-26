Class {
	#name : #GroupBuilder,
	#superclass : #AbstractGroupBuilder,
	#instVars : [
		'leafCollect'
	],
	#category : #Grouper
}

{ #category : #'as yet unclassified' }
GroupBuilder class >> groupingBlock: aBlockClosure [ 
	^ self new
		groupingBlock: aBlockClosure;
		yourself
]

{ #category : #testing }
GroupBuilder class >> isTypeCheckingEnabled [
	^ true
]

{ #category : #converting }
GroupBuilder >> asCompositeGroupBuilder [
	^ CompositeGroupBuilder new
		groupingBlock: self groupingBlock;
		yourself
]

{ #category : #converting }
GroupBuilder >> asRootGroupBuilder [
	^ RootGroupBuilder new
		groupingBlock: self groupingBlock;
		yourself
]

{ #category : #composing }
GroupBuilder >> composeWith: aGroupBuilder [
	^ self asRootGroupBuilder
		groupingBlock: self groupingBlock;
		subGroupBuilder: aGroupBuilder yourself
]

{ #category : #grouping }
GroupBuilder >> group: aCollection [
	| dictionary |
	dictionary := ((aCollection groupedBy: self groupingBlock) collect: [ :collection |
		collection collect: self leafCollect ]).
	
	^ self nodeCollect value: dictionary
]

{ #category : #initialization }
GroupBuilder >> initialize [
	super initialize.
	self leafCollect: [ :object | object ]
]

{ #category : #accessing }
GroupBuilder >> leafCollect [
	^ leafCollect
]

{ #category : #accessing }
GroupBuilder >> leafCollect: anObject [
	leafCollect := anObject
]
