tests
testAppleGenericLongDescription
	| fruit stream line |
	stream := WriteStream on: String new.
	31 timesRepeat: [ stream nextPut: $d ].
	fruit := (HBProduct from: 1100)
		description: stream contents;
		deliveryDate: (Date year: 2012 month: 2 day: 1);
		costPrice: 1505;
		unitCount: 1;
		supplierId: 0.
	stream := WriteStream on: String new.
	fruit priceListLineOn: stream.
	line := stream contents trimRight.
	self assert: line = 'R   21.072012/02/15ddddddddddddddddddddddddddddddd'.
	self assert: line size <= 50