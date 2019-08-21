"
A CompositeGroupBuilderTest is a test class for testing the behavior of CompositeGroupBuilder
"
Class {
	#name : #CompositeGroupBuilderTest,
	#superclass : #TestCase,
	#category : #'Grouper-Tests'
}

{ #category : #test }
CompositeGroupBuilderTest >> test2LevelsGrouperWellBuilt [
	| firstGrouper secondGrouper compositeGrouper |
	firstGrouper := [ :x | x first ] grouper.
	secondGrouper :=  [ :x | x second ] grouper.
	
	compositeGrouper := firstGrouper , secondGrouper.
	
	self assert: compositeGrouper groupingBlock equals: firstGrouper groupingBlock.
	self assert: compositeGrouper subGroupBuilder groupingBlock equals: secondGrouper groupingBlock.
]

{ #category : #test }
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
CompositeGroupBuilderTest >> testAsCompositeGroupBuilder [
	| firstGrouper secondGrouper thirdGrouper compositeGrouper |
	firstGrouper := [ :x | x first ] grouper.
	secondGrouper :=  [ :x | x second ] grouper.
	thirdGrouper :=  [ :x | x third ] grouper.
	
	compositeGrouper := firstGrouper , secondGrouper , thirdGrouper.
	
	self assert: compositeGrouper asCompositeGroupBuilder equals: compositeGrouper
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

{ #category : #test }
CompositeGroupBuilderTest >> testIsComposite [
	self assert: ([ :x | x first ] grouper , [ :x | x second ] grouper) isComposite
]

{ #category : #test }
CompositeGroupBuilderTest >> testLastSubCompositeGroupBuilder [
	| firstGrouper secondGrouper thirdGrouper compositeGrouper |
	firstGrouper := [ :x | x first ] grouper.
	secondGrouper :=  [ :x | x second ] grouper.
	thirdGrouper :=  [ :x | x third ] grouper.
	
	compositeGrouper := firstGrouper , secondGrouper , thirdGrouper.
	
	self assert: compositeGrouper lastSubCompositeGroupBuilder equals: compositeGrouper subGroupBuilder.
	self assert: compositeGrouper lastSubCompositeGroupBuilder groupingBlock equals: secondGrouper groupingBlock
]
