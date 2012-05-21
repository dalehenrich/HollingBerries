tests
testCsvParser
	| csvCollection headingCollection |
	headingCollection := CSVParser
		parseString: '"Supplier ID","Product Code","Product Description","Delivery Date","Unit Price","Number of Units"'.
	csvCollection := CSVParser
		parseString:
			'15,1101,"Apples 1kg Golden Delicious. The sweetest Apples! Always a favourite. Love, Mrs. Hollingberry","2012/02/15",1505,5'.
	self assert: headingCollection first size = csvCollection first size