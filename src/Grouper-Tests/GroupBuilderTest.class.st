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
