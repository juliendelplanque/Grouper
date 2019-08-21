Class {
	#name : #CompositeGroupBuilder,
	#superclass : #GroupBuilder,
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
	^ (super group: aCollection) collect: [ :subCollection |
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
