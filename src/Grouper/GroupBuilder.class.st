"
I model a group builder as first-class object.

The terminal group builder of a composition of builder is always of my kind.
"
Class {
	#name : #GroupBuilder,
	#superclass : #AbstractGroupBuilder,
	#instVars : [
		'leafCollect'
	],
	#category : #Grouper
}

{ #category : #'instance creation' }
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
		subGroupBuilder: aGroupBuilder grouper;
		yourself
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
