Class {
	#name : #AnkiNote,
	#superclass : #Object,
	#instVars : [
		'dict'
	],
	#category : #Anki
}

{ #category : #'instance creation' }
AnkiNote class >> from: aDict [
	^self new from: aDict 
]

{ #category : #accessing }
AnkiNote >> export: aStream [
	dict valuesDo: [:v|
		aStream nextPutAll: (v ifNil: ['']  ifNotNil: [v]).
		aStream nextPut: Character tab].
	aStream nextPut: Character cr.
]

{ #category : #initiailize }
AnkiNote >> from: aDict [ 
	self from: aDict parser: [:i| [String streamContents: [:s |
		(XMLWriter on: s) lineBreak: '<br>'; string: i]]]
]

{ #category : #initiailize }
AnkiNote >> from: aDict parser: aParser [
	dict:= aDict collect: [:v| (v isString) ifTrue:
		[aParser parse: v]]
]
