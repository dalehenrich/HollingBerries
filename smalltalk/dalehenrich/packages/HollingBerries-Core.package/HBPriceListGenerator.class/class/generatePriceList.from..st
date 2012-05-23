generator
generatePriceList: priceFilePath from: csvFilePath
	"self  generatePriceList: '/opt/git/HollingBerries/smalltalk_pricelist.txt' from: '/opt/git/HollingBerries/produce.csv'"

	| csvCollection directory |
	FileStream
		fileNamed: csvFilePath
		do: [ :fileStream | 
			csvCollection := CSVParser parse: fileStream.
			directory := fileStream directory ].
	FileStream
		forceNewFileNamed: priceFilePath
		do: [ :fileStream | 
			fileStream lineEndConvention: #lf.
			self new generatePriceListFrom: csvCollection on: fileStream ]