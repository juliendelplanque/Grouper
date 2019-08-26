Extension { #name : #Collection }

{ #category : #'*Grouper' }
Collection >> groupUsing: aGroupBuilder [
	^ aGroupBuilder grouper group: self
]
