private
generatePriceListFrom: csvCollection on: stream
	| csvLine product productCode |
	2 to: csvCollection size do: [ :index | 
		csvLine := csvCollection at: index.
		productCode := (csvLine at: 2) asInteger.
		product := (HBProduct from: productCode)
			productCode: productCode;
			description: (csvLine at: 3);
			deliveryDate: (Date readFrom: (csvLine at: 4) readStream pattern: self datePattern);
			costPrice: (csvLine at: 5) asInteger;
			unitCount: (csvLine at: 6) asInteger;
			supplierId: (csvLine at: 1) asInteger.
		product priceListLineOn: stream ]