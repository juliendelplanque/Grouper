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

{ #category : #accessing }
CompositeGroupBuilder >> collectBlock [
	^ self subGroupBuilder collectBlock
]

{ #category : #accessing }
CompositeGroupBuilder >> collectBlock: aBlock [
	^ self subGroupBuilder collectBlock: aBlock
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
	^ (aCollection groupedBy: self groupingBlock) collect: [ :subCollection |
		self subGroupBuilder group: subCollection ]
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
CompositeGroupBuilder >> subGroupBuilder [
	^ subGroupBuilder
]

{ #category : #accessing }
CompositeGroupBuilder >> subGroupBuilder: anObject [
	subGroupBuilder := anObject
]
