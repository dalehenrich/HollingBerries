price list generation
sellingPriceOn: aStream
	| price priceString |
	price := self sellingPriceInCents / 100 asScaledDecimal: 2.
	priceString := String streamContents: [ :s | price printOn: s showingDecimalPlaces: 2 ].
	8 - priceString size timesRepeat: [ aStream space ].
	aStream nextPutAll: priceString