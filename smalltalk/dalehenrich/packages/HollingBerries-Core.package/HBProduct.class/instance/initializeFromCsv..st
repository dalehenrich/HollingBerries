initialization
initializeFromCsv: csvLine
	description := csvLine at: 3.
	deliveryDate := Date readFrom: (csvLine at: 4) readStream pattern: 'yyyy/mm/dd'.
	costPrice := (csvLine at: 5) asInteger.
	unitCount := (csvLine at: 6) asInteger.
	supplierId := (csvLine at: 1) asInteger