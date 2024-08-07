Class {
	#name : #AnkiDeck,
	#superclass : #Object,
	#instVars : [
		'notes'
	],
	#category : #Anki
}

{ #category : #'instance creation' }
AnkiDeck class >> from: dicts [
	^self from: dicts as: AnkiBasicNote
]

{ #category : #'instance creation' }
AnkiDeck class >> from: dicts as: NoteClass [ 
	^self new from: dicts as:NoteClass
]

{ #category : #accessing }
AnkiDeck >> export [ 
	<gtExample>
	| deck |
	deck:= Anki new deck from: EbDictionary example entries as: AnkiEbNote.
deck export: (Path / 'home' / 'qeqpep' / 'anki.txt')
]

{ #category : #export }
AnkiDeck >> export: aPath [
	aPath asFileReference writeStreamDo: [:s|
		notes do: [:n| n ifNotNil: [n export: s]]]	
]

{ #category : #'instance creation' }
AnkiDeck >> from: dicts as: NoteClass [ 
	notes:= dicts collect: [:d| NoteClass from: d].
]
