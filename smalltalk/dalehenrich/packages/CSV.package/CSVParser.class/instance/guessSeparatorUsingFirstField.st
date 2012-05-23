private
guessSeparatorUsingFirstField
	| luckyseperator |
	(stream peek = $")
		"seek separator after double quote "
		ifTrue: [ stream next. 
				stream upTo:$".
				self atEndOfLine  
					ifFalse: [ luckyseperator := stream next.   ]  ]
		"search for the first charactor "
		ifFalse: [ [(self atEndOfLine or: [ luckyseperator = $, ]) or: [ luckyseperator = $; ] ] whileFalse: [ luckyseperator := stream next ] ].
	^luckyseperator.