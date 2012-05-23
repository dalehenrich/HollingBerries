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
		forceNewFileNamed: 'smalltalk_pricefile.txt'
		do: [ :fileStream | 
			fileStream lineEndConvention: #lf.
			self new generatePriceListFrom: csvCollection on: fileStream ]