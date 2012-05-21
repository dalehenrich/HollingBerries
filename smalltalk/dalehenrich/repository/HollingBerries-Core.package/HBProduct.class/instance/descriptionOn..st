price list generation
descriptionOn: aStream
	aStream nextPutAll: (String streamContents: [ :s | s nextPutAll: self description ] limitedTo: 31)