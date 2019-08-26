Class {
	#name : #RootGroupBuilder,
	#superclass : #CompositeGroupBuilder,
	#instVars : [
		'rootWrap'
	],
	#category : #Grouper
}

{ #category : #grouping }
RootGroupBuilder >> group: aCollection [
	^ self rootWrap value: (super group: aCollection)
]

{ #category : #initialization }
RootGroupBuilder >> initialize [
	super initialize.
	self rootWrap: [ :object | object ]
]

{ #category : #testing }
RootGroupBuilder >> isRoot [
	^ true
]

{ #category : #accessing }
RootGroupBuilder >> rootWrap [
	^ rootWrap
]

{ #category : #accessing }
RootGroupBuilder >> rootWrap: anObject [
	rootWrap := anObject
]
