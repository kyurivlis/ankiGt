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
	dict:= aDict collect: [:v| v ifNotNil:
		[String streamContents: [:s |
			(XMLWriter on: s) lineBreak: '<br>'; tag: 'p' with: v]]]
]
