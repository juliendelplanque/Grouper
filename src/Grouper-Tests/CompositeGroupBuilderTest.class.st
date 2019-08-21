"
A CompositeGroupBuilderTest is a test class for testing the behavior of CompositeGroupBuilder
"
Class {
	#name : #CompositeGroupBuilderTest,
	#superclass : #TestCase,
	#category : #'Grouper-Tests'
}

{ #category : #tests }
CompositeGroupBuilderTest >> test2LevelsGrouperWellBuilt [
	| firstGrouper secondGrouper compositeGrouper |
	firstGrouper := [ :x | x first ] grouper.
	secondGrouper :=  [ :x | x second ] grouper.
	
	compositeGrouper := firstGrouper , secondGrouper.
	
	self assert: compositeGrouper groupingBlock equals: firstGrouper groupingBlock.
	self assert: compositeGrouper subGroupBuilder groupingBlock equals: secondGrouper groupingBlock.
]

{ #category : #tests }
CompositeGroupBuilderTest >> test3LevelsGrouperWellBuilt [
	| firstGrouper secondGrouper thirdGrouper compositeGrouper |
	firstGrouper := [ :x | x first ] grouper.
	secondGrouper :=  [ :x | x second ] grouper.
	thirdGrouper :=  [ :x | x third ] grouper.
	
	compositeGrouper := firstGrouper , secondGrouper , thirdGrouper.
	
	self assert: compositeGrouper groupingBlock equals: firstGrouper groupingBlock.
	self assert: compositeGrouper subGroupBuilder groupingBlock equals: secondGrouper groupingBlock.
	self assert: compositeGrouper subGroupBuilder subGroupBuilder groupingBlock equals: thirdGrouper groupingBlock.
]

{ #category : #test }
CompositeGroupBuilderTest >> testGroup [
	| grouper expectedDictionary |
	grouper := [ :x | x first ] grouper , [ :x | x second ] grouper.
	
	expectedDictionary := { 
		$a -> { 
			$n -> #('animal').
			$l -> #('alphabet')
			} asOrderedDictionary.
		$d -> {
			$e -> #('demo' 'denial')
			} asOrderedDictionary } asOrderedDictionary.
	
	self
		assert: (grouper group:  #('animal' 'alphabet' 'demo' 'denial'))
		equals: expectedDictionary
]
