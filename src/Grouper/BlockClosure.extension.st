Extension { #name : #BlockClosure }

{ #category : #'*Grouper' }
BlockClosure >> grouper [
	^ GroupBuilder new
		groupingBlock: self;
		yourself
]
