as yet unclassified
nextRow
	| row lastchar |
	row := OrderedCollection new.
	stream skipSeparators.
	[self atEndOfLine]
		whileFalse: [row add: self nextValue].
	stream skip: -1.
	lastchar := stream next.
	(lastchar= separator) ifTrue: [row add: ''].
	^ row