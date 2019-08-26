"
A RootGroupBuilderTest is a test class for testing the behavior of RootGroupBuilder
"
Class {
	#name : #RootGroupBuilderTest,
	#superclass : #TestCase,
	#category : #'Grouper-Tests'
}

{ #category : #test }
RootGroupBuilderTest >> testGroup [
	| grouper expectedDictionary grouped |
	grouper := [ :x | x first ] grouper , [ :x | x second ] grouper.
	
	grouper rootWrap: [ :dict |
		GTreeRoot new
			children: dict;
			yourself. ].
	
	expectedDictionary := GTreeRoot new
		children: { 
		$a -> { 
			$n -> #('animal').
			$l -> #('alphabet')
			} asOrderedDictionary.
		$d -> {
			$e -> #('demo' 'denial')
			} asOrderedDictionary } asOrderedDictionary.
	
	grouped := grouper group:  #('animal' 'alphabet' 'demo' 'denial').
	
	self assert: grouped equals: expectedDictionary.
	self assert: grouped content isNil
]
