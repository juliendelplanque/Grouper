Class {
	#name : #BaselineOfGrouper,
	#superclass : #BaselineOf,
	#category : #BaselineOfGrouper
}

{ #category : #baselines }
BaselineOfGrouper >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [
			"Packages"
			spec
				package: 'Grouper';
				package: 'Grouper-Tests' with: [ spec requires: #('Grouper') ] ]
]
