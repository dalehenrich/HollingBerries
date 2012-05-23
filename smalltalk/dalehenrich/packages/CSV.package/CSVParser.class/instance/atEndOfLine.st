as yet unclassified
atEndOfLine
	^ (stream atEnd or: [stream peek = Character cr]) or: [stream peek = Character lf]