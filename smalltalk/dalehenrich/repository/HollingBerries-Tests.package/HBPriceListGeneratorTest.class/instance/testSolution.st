overall tests
testSolution
	| path |
	path := '/opt/git/HollingBerries/'.
	HBPriceListGenerator generatePriceListFromPath: path , 'produce.csv'.
	(FileDirectory on: path)
		oldFileNamed: 'pricefile.txt'
		do: [ :fileStream | self assert: fileStream contents = self pricefile ]