as yet unclassified
nextValue
	| next |
	stream peek = $" ifTrue: [stream next. ^ self nextQuotedValue].
	^ String streamContents:
		[:s |
		[(next := self nextInLine) notNil and: [next ~= separator] ]
			whileTrue: [s nextPut: next]]