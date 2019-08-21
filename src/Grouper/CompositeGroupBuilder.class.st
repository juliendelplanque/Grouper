Class {
	#name : #CompositeGroupBuilder,
	#superclass : #GroupBuilder,
	#instVars : [
		'subGroupBuilder'
	],
	#category : #Grouper
}

{ #category : #copying }
CompositeGroupBuilder >> , aGroupBuilder [
	| composite |
	composite := self lastSubCompositeGroupBuilder subGroupBuilder asCompositeGroupBuilder.
	self lastSubCompositeGroupBuilder
		subGroupBuilder: composite.
	
	composite subGroupBuilder: aGroupBuilder.
	
	^ self
]

{ #category : #converting }
CompositeGroupBuilder >> asCompositeGroupBuilder [
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

{ #category : #accessing }
CompositeGroupBuilder >> lastSubCompositeGroupBuilder [
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
