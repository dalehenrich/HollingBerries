generator
generatePriceListFrom: csvCollection on: aStream
	2 to: csvCollection size do: [ :index | 
		| product |
		product := HBProduct fromCsv: (csvCollection at: index).
		product unitCount
			timesRepeat: [ 
				self
					formatSellingPrice: product sellingPrice on: aStream;
					formatSellByDate: product sellByDate on: aStream;
					formatDescription: product description on: aStream.
				aStream cr ] ]