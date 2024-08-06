Class {
	#name : #BaselineOfAnki,
	#superclass : #BaselineOf,
	#category : #BaselineOfAnki
}

{ #category : #loading }
BaselineOfAnki class >> loadLepiter [
	IceRepository registry  
		detect: [ :aRepository |
			aRepository name = 'ankiGt' ]
		ifFound: [ :aRepository | 
			| defaultDatabase currentProperties |
			defaultDatabase := LeDatabasesRegistry defaultLogicalDatabase.
			currentProperties := defaultDatabase properties.
			currentProperties addRegisteredDirectory: aRepository repositoryDirectory / 'lepiter'.
			defaultDatabase reload ]
		ifNone: [
			self inform: 'Repository not found.' ]
]

{ #category : #baseline }
BaselineOfAnki >> baseline: spec [
	<baseline>
		^ spec for: #common do: [
			spec package: 'Anki'
		]
]
