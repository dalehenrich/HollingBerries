tests
testBananaPremium
	| fruit stream line |
	stream := WriteStream on: String new.
	fruit := (HBProduct from: 1201)
		description: 'yadayada';
		deliveryDate: (Date year: 2012 month: 2 day: 1);
		costPrice: 1505;
		unitCount: 1;
		supplierId: 204.
	fruit priceListLineOn: stream.
	line := stream contents trimRight.
	self assert: line = 'R   22.002012/02/06yadayada'.
	self assert: line size <= 50