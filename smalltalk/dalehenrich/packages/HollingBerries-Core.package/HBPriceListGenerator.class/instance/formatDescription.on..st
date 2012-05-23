generator
formatDescription: description on: aStream
	aStream nextPutAll: (String streamContents: [ :s | s nextPutAll: description ] limitedTo: 31)