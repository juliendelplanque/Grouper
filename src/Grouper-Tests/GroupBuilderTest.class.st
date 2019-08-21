"
A GroupBuilderTest is a test class for testing the behavior of GroupBuilder
"
Class {
	#name : #GroupBuilderTest,
	#superclass : #TestCase,
	#category : #'Grouper-Tests'
}

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
