Extension { #name : #Collection }

{ #category : #'*Grouper' }
Collection >> groupUsing: aGroupBuilder [
	^ aGroupBuilder group: self
]
