Class {
	#name : #AnkiEbNote,
	#superclass : #AnkiNote,
	#category : #Anki
}

{ #category : #initiailize }
AnkiEbNote >> from: d [
	super from: d.
	dict at: #short put: (EbDictionary parse: (d at: #short)).
]
