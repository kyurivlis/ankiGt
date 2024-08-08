Class {
	#name : #AnkiEbNote,
	#superclass : #AnkiNote,
	#category : #Anki
}

{ #category : #initiailize }
AnkiEbNote >> from: d [
	|p|
	p:= EbDictionaryParser.
	self from: d parser: p.
	dict at: #short put: ((dict at: #short) copyReplaceAll: (dict at: #gloss) with: ('<span class="gloss">',(dict at: #gloss), '</span>')).
	dict at: #gloss put: (p new gloss parse: (dict at: #gloss))
]
