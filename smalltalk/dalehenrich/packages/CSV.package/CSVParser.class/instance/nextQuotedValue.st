as yet unclassified
nextQuotedValue
	^ String streamContents:
		[:s |
		s nextPutAll: (stream upTo: $").
		self nextInLine = $" ifTrue:
			[s nextPut: $".
			s nextPutAll: self nextQuotedValue]]