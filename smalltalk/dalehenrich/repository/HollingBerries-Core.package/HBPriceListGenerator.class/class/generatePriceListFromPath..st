generator
generatePriceListFromPath: csvFilePath
	"self  generatePriceListFromPath: '/opt/git/HollingBerries/produce.csv'"

	| csvCollection directory |
	FileStream
		fileNamed: csvFilePath
		do: [ :fileStream | 
			csvCollection := CSVParser parse: fileStream.
			directory := fileStream directory ].
	directory
		forceNewFileNamed: 'pricefile.txt'
		do: [ :stream | 
			stream lineEndConvention: #lf.
			self generatePriceListFrom: csvCollection on: stream ]