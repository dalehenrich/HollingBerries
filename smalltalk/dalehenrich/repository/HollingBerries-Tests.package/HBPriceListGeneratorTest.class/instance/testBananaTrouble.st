tests
testBananaTrouble
	| fruit stream line |
	stream := WriteStream on: String new.
	fruit := (HBProduct from: 1201)
		description: 'yadayada';
		deliveryDate: (Date year: 2012 month: 2 day: 1);
		costPrice: 1505;
		unitCount: 1;
		supplierId: 32.
	fruit priceListLineOn: stream.
	line := stream contents trimRight.
	self assert: line = 'R   18.322012/02/03yadayada'.
	self assert: line size <= 50