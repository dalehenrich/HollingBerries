tests
testSolution
	| path results |
	path := '/opt/git/HollingBerries/'.
	HBPriceListGenerator generatePriceList: path , 'smalltalk_pricefile.txt' from: path , 'produce.csv'.
	(FileDirectory on: path)
		oldFileNamed: 'smalltalk_pricefile.txt'
		do: [ :fileStream | 
			fileStream lineEndConvention: #lf.
			self assert: (results := fileStream contents) = self pricefile ]