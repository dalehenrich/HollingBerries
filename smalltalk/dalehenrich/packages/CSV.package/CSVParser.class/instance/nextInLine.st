as yet unclassified
nextInLine
	| next |
	stream atEnd 
		ifTrue: [ ^nil ]
		ifFalse: [
			next := stream next.
			(next = Character cr or: [next = Character lf])
				ifTrue:	[stream skip: -1. next := nil].
			^ next  ]