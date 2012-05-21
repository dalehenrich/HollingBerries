tests
testDateParsing
	self
		assert:
			(Date readFrom: '2012/02/15' readStream pattern: HBPriceListGenerator datePattern) = (Date year: 2012 month: 2 day: 15)