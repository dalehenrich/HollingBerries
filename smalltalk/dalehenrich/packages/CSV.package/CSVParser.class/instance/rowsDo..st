as yet unclassified
rowsDo: aBlock
	| row |
	[stream atEnd] whileFalse:
		[row := self nextRow.
		row isEmpty ifFalse: [aBlock value: row]]