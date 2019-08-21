"
A GroupBuilderTest is a test class for testing the behavior of GroupBuilder
"
Class {
	#name : #GroupBuilderTest,
	#superclass : #TestCase,
	#category : #'Grouper-Tests'
}

{ #category : #test }
GroupBuilderTest >> testAsCompositeGroupBuilder [
	| grouper composite |
	grouper := GroupBuilder groupingBlock: [ :x | x first ].
	composite := grouper asCompositeGroupBuilder.
	
	self assert: composite groupingBlock equals: grouper groupingBlock.
	self assert: composite subGroupBuilder isNil
]

{ #category : #test }
GroupBuilderTest >> testCollectBlock [
	| grouper expectedDictionary |
	grouper := GroupBuilder groupingBlock: [ :x | x first ].
	
	grouper collectBlock: [ :str | str size ].
	
	expectedDictionary := { 
		$a -> {'animal' size. 'alphabet' size}.
		$d -> {'demo' size. 'denial' size } } asOrderedDictionary.
	
	self
		assert: (grouper group:  #('animal' 'alphabet' 'demo' 'denial'))
		equals: expectedDictionary
]

{ #category : #test }
GroupBuilderTest >> testComposeWith [
	| firstGrouper secondGrouper composition |
	firstGrouper := [ :x | x first ] grouper.
	secondGrouper :=  [ :x | x second ] grouper.
	
	composition := firstGrouper composeWith: secondGrouper.
	
	self assert: composition isComposite.
	self deny: composition subGroupBuilder isComposite.
	
	self assert: composition groupingBlock equals: firstGrouper groupingBlock.
	self assert: composition subGroupBuilder groupingBlock equals: secondGrouper groupingBlock.
]

{ #category : #test }
GroupBuilderTest >> testGroup [
	| grouper expectedDictionary |
	grouper := GroupBuilder groupingBlock: [ :x | x first ].
	
	expectedDictionary := { 
		$a -> #('animal' 'alphabet').
		$d -> #('demo' 'denial') } asOrderedDictionary.
	
	self
		assert: (grouper group:  #('animal' 'alphabet' 'demo' 'denial'))
		equals: expectedDictionary
]

{ #category : #test }
GroupBuilderTest >> testIsComposite [
	self deny: [ :x | x first ] grouper isComposite
]
