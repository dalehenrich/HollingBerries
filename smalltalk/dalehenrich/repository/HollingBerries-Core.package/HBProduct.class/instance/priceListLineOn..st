price list generation
priceListLineOn: aStream
	self unitCount
		timesRepeat: [ 
			aStream nextPut: $R.
			self
				sellingPriceOn: aStream;
				sellByDateOn: aStream;
				descriptionOn: aStream.
			aStream cr ]