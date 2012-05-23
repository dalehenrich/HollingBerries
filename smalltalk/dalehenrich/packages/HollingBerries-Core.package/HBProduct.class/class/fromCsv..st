instance creation
fromCsv: csvLine
	^ (self lookupProduct: (csvLine at: 2) asInteger) initializeFromCsv: csvLine