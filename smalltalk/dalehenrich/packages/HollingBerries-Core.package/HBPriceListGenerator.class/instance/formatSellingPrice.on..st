generator
formatSellingPrice: sellingPrice on: aStream
	| priceString |
	aStream nextPut: $R.
	priceString := String streamContents: [ :s | sellingPrice / 100 printOn: s showingDecimalPlaces: 2 ].
	8 - priceString size timesRepeat: [ aStream space ].
	aStream nextPutAll: priceString