"
I am a group builder that has a subgroup builder.

The resulting structure will be built top to bottom.
"
Class {
	#name : #CompositeGroupBuilder,
	#superclass : #AbstractGroupBuilder,
	#instVars : [
		'subGroupBuilder'
	],
	#category : #Grouper
}

{ #category : #converting }
CompositeGroupBuilder >> asCompositeGroupBuilder [
	^ self
]

{ #category : #composing }
CompositeGroupBuilder >> composeWith: aGroupBuilder [
	| composite |
	composite := self lastSubCompositeGroupBuilder subGroupBuilder
		asCompositeGroupBuilder.
	self lastSubCompositeGroupBuilder subGroupBuilder: composite.
	composite subGroupBuilder: aGroupBuilder.
	^ self
]

{ #category : #grouping }
CompositeGroupBuilder >> group: aCollection [
	| dictionary |
	dictionary := (aCollection groupedBy: self groupingBlock) collect: [ :subCollection |
		self subGroupBuilder group: subCollection ].
	
	^ self nodeCollect value: dictionary
]

{ #category : #testing }
CompositeGroupBuilder >> isComposite [
	^ true
]

{ #category : #private }
CompositeGroupBuilder >> lastSubCompositeGroupBuilder [
	"Recursively go through the subGroupBuilders until finding the last composite one.
	
	In the example below,
	
	([ :x | x asString first ] grouper ,
		[ :x | x asString second ] grouper , <-- This grouper is returned.
			[ :x | x asString third ] grouper) lastSubCompositeGroupBuilder
	"
	self subGroupBuilder isComposite
		ifFalse: [ ^ self ].
		
	^ self subGroupBuilder
]

{ #category : #accessing }
CompositeGroupBuilder >> leafCollect [
	^ self subGroupBuilder leafCollect
]

{ #category : #accessing }
CompositeGroupBuilder >> leafCollect: aBlock [
	^ self subGroupBuilder leafCollect: aBlock
]

{ #category : #accessing }
CompositeGroupBuilder >> nodeCollect: aBlock [
	super nodeCollect: aBlock.
	self subGroupBuilder ifNotNil: [ 
		self subGroupBuilder nodeCollect: aBlock ]
]

{ #category : #accessing }
CompositeGroupBuilder >> subGroupBuilder [
	^ subGroupBuilder
]

{ #category : #accessing }
CompositeGroupBuilder >> subGroupBuilder: anObject [
	subGroupBuilder := anObject.
	"self subGroupBuilder nodeCollect: self nodeCollect"
]
