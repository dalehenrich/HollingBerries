TestCase subclass: #HBPriceListGeneratorTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'HollingBerries-Tests'!

!HBPriceListGeneratorTest methodsFor: 'overall tests' stamp: 'dkh 5/20/2012 18:10'!
testGenerator
	| csvCollection stream result |
	csvCollection := CSVParser parse: self produce readStream.
	stream := WriteStream on: String new.
	HBPriceListGenerator generatePriceListFrom: csvCollection on: stream.
	result := stream contents.
	self assert: result = self pricefile! !

!HBPriceListGeneratorTest methodsFor: 'overall tests' stamp: 'dkh 5/20/2012 15:29'!
testSolution
	| path |
	path := '/opt/git/HollingBerries/'.
	HBPriceListGenerator generatePriceListFromPath: path , 'produce.csv'.
	(FileDirectory on: path)
		oldFileNamed: 'pricefile.txt'
		do: [ :fileStream | self assert: fileStream contents = self pricefile ]! !


!HBPriceListGeneratorTest methodsFor: 'private' stamp: 'dkh 5/20/2012 18:11'!
pricefile
	^ 'R   21.072012/02/29Apples 1kg Golden Delicious. Th
R   21.072012/02/29Apples 1kg Golden Delicious. Th
R   21.072012/02/29Apples 1kg Golden Delicious. Th
R   21.072012/02/29Apples 1kg Golden Delicious. Th
R   21.072012/02/29Apples 1kg Golden Delicious. Th
R   19.922012/03/01Apples 1kg Green. They are very
R   19.922012/03/01Apples 1kg Green. They are very
R   18.032012/02/27Apples 1kg Red. Less crunchy th
R   18.032012/02/27Apples 1kg Red. Less crunchy th
R   18.032012/02/27Apples 1kg Red. Less crunchy th
R   11.282012/02/29Bananas 1kg. Just the other day
R   11.282012/02/29Bananas 1kg. Just the other day
R   11.282012/02/29Bananas 1kg. Just the other day
R   11.282012/02/29Bananas 1kg. Just the other day
R   29.792012/03/07Gooseberries 500g. Mr Hollingbe
R   29.792012/03/07Gooseberries 500g. Mr Hollingbe
R   29.792012/03/07Gooseberries 500g. Mr Hollingbe
R   29.792012/03/07Gooseberries 500g. Mr Hollingbe
R   29.792012/03/07Gooseberries 500g. Mr Hollingbe
R   29.792012/03/07Gooseberries 500g. Mr Hollingbe
R   29.792012/03/07Gooseberries 500g. Mr Hollingbe
R   34.602012/03/01Strawberries 500g. You really s
R   34.602012/03/01Strawberries 500g. You really s
R   34.602012/03/01Strawberries 500g. You really s
R   34.602012/03/01Strawberries 500g. You really s
R   38.802012/03/02Blueberries 500g. I have so man
R   38.802012/03/02Blueberries 500g. I have so man
R   38.802012/03/02Blueberries 500g. I have so man
R   38.802012/03/02Blueberries 500g. I have so man
R   38.802012/03/02Blueberries 500g. I have so man
R   23.032012/03/04Raspberries - Red. 500g. I stil
R   23.032012/03/04Raspberries - Red. 500g. I stil
R    0.002012/03/02Bananas 500g. Please take one f
R    0.002012/03/02Bananas 500g. Please take one f
R   25.002012/02/29Apples 1kg Pink Lady. Perfect f
R   25.002012/02/29Apples 1kg Pink Lady. Perfect f
R   25.002012/02/29Apples 1kg Pink Lady. Perfect f
R   25.002012/02/29Apples 1kg Pink Lady. Perfect f
R   48.002012/03/03Miracle Berry 500g. This is sim
R   48.002012/03/03Miracle Berry 500g. This is sim
R   48.002012/03/03Miracle Berry 500g. This is sim
'! !

!HBPriceListGeneratorTest methodsFor: 'private' stamp: 'dkh 5/20/2012 15:29'!
produce
	^ '"Supplier ID","Product Code","Product Description","Delivery Date","Unit Price","Number of Units"
15,1101,"Apples 1kg Golden Delicious. The sweetest Apples!! Always a favourite. Love, Mrs. Hollingberry","2012/02/15",1505,5
15,1102,"Apples 1kg Green. They are very crunchy!! Once my teeth got stuck in one of these apples and I didn''t notice until a little girl pointed at the counter where I left the apple. She started crying, shame... Love, Mrs. Hollingberry","2012/02/16",1423,2
32,1103,"Apples 1kg Red. Less crunchy than the green ones, that''s for sure. I prefer these myself nowadays. Love, Mrs. Hollingberry","2012/02/16",1431,3
32,1201,"Bananas 1kg. Just the other day I heard that some tribes in Africa cook green bananas like potatoes!! Our bananas are yellow, so don''t worry about that. Love, Mrs. Hollingberry","2012/02/27",984,4
23,1328,"Gooseberries 500g. Mr Hollingberry once ate so much Gooseberries, his tummy rumbled for 3 days!! My, was he grumpy then... Love, Mrs. Hollingberry","2012/02/29",1922,7
54,1342,"Strawberries 500g. You really should taste this, it has been imported from the Paarl region. So lovely!! Love, Mrs. Hollingberry","2012/02/23",2232,4
22,1357,"Blueberries 500g. I have so many blueberry recipes, come ask me anytime. Also, I know exactly how to get those stains out of your clothes. Love, Mrs. Hollingberry","2012/02/24",2503,5
999,1399,"Jaboca Berries. My grandson keeps asking me to get these, but we really have difficulty getting stock. Do you know where I can order some? Love, Mrs. Hollingberry","2012/02/23",0,0
101,1320,"Raspberries - Red. 500g. I still remember the days when I climbed Raspberry trees. But deary me, I won''t try it now!! Love, Mrs. Hollingberry","2012/02/29",1615,2
101,1208,"Bananas 500g. Please take one for free!! Togetherness was kind enough to share some extras he had. Love, Mrs. Hollingberry","2012/02/29",0,2
219,1106,"Apples 1kg Pink Lady. Perfect for a warm summer day. Love, Mrs. Hollingberry","2012/02/15",1609,4
204,1381,"Miracle Berry 500g. This is simply amazing!! If you eat one of these berries before eating a lemon, the lemon tastes sweet!! Try it if you don''t believe me!! Love, Mrs. Hollingberry","2012/02/25",2894,3'! !


!HBPriceListGeneratorTest methodsFor: 'tests' stamp: 'dkh 5/20/2012 17:49'!
testAppleGeneric
	| fruit stream line |
	stream := WriteStream on: String new.
	fruit := (HBProduct from: 1100)
		description: 'yadayada';
		deliveryDate: (Date year: 2012 month: 2 day: 1);
		costPrice: 1505;
		unitCount: 1;
		supplierId: 0.
	fruit priceListLineOn: stream.
	line := stream contents trimRight.
	self assert: line = 'R   21.072012/02/15yadayada'.
	self assert: line size <= 50! !

!HBPriceListGeneratorTest methodsFor: 'tests' stamp: 'dkh 5/20/2012 17:49'!
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
	self assert: line size <= 50! !

!HBPriceListGeneratorTest methodsFor: 'tests' stamp: 'dkh 5/20/2012 17:49'!
testAppleGenericVeryLongDescription
	| fruit stream line |
	stream := WriteStream on: String new.
	51 timesRepeat: [ stream nextPut: $d ].
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
	self assert: line size <= 50! !

!HBPriceListGeneratorTest methodsFor: 'tests' stamp: 'dkh 5/20/2012 18:43'!
testApplePremium
	| fruit stream line |
	stream := WriteStream on: String new.
	fruit := (HBProduct from: 1100)
		description: 'yadayada';
		deliveryDate: (Date year: 2012 month: 2 day: 1);
		costPrice: 1505;
		unitCount: 1;
		supplierId: 204.
	fruit priceListLineOn: stream.
	line := stream contents trimRight.
	self assert: line = 'R   23.002012/02/15yadayada'.
	self assert: line size <= 50! !

!HBPriceListGeneratorTest methodsFor: 'tests' stamp: 'dkh 5/20/2012 18:25'!
testAppleTrouble
	| fruit stream line |
	stream := WriteStream on: String new.
	fruit := (HBProduct from: 1100)
		description: 'yadayada';
		deliveryDate: (Date year: 2012 month: 2 day: 1);
		costPrice: 1505;
		unitCount: 1;
		supplierId: 32.
	fruit priceListLineOn: stream.
	line := stream contents trimRight.
	self assert: line = 'R   19.072012/02/12yadayada'.
	self assert: line size <= 50! !

!HBPriceListGeneratorTest methodsFor: 'tests' stamp: 'dkh 5/20/2012 17:50'!
testBananaGeneric
	| fruit stream line |
	stream := WriteStream on: String new.
	fruit := (HBProduct from: 1201)
		description: 'yadayada';
		deliveryDate: (Date year: 2012 month: 2 day: 1);
		costPrice: 1505;
		unitCount: 1;
		supplierId: 0.
	fruit priceListLineOn: stream.
	line := stream contents trimRight.
	self assert: line = 'R   20.322012/02/06yadayada'.
	self assert: line size <= 50! !

!HBPriceListGeneratorTest methodsFor: 'tests' stamp: 'dkh 5/20/2012 18:43'!
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
	self assert: line size <= 50! !

!HBPriceListGeneratorTest methodsFor: 'tests' stamp: 'dkh 5/20/2012 18:25'!
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
	self assert: line size <= 50! !

!HBPriceListGeneratorTest methodsFor: 'tests' stamp: 'dkh 5/20/2012 17:39'!
testBerryGeneric
	| fruit stream line |
	stream := WriteStream on: String new.
	fruit := (HBProduct from: 1328)
		description: 'yadayada';
		deliveryDate: (Date year: 2012 month: 2 day: 1);
		costPrice: 1505;
		unitCount: 1;
		supplierId: 0.
	fruit priceListLineOn: stream.
	line := stream contents trimRight.
	self assert: line = 'R   23.332012/02/08yadayada'.
	self assert: line size <= 50! !

!HBPriceListGeneratorTest methodsFor: 'tests' stamp: 'dkh 5/20/2012 18:42'!
testBerryPremium
	| fruit stream line |
	stream := WriteStream on: String new.
	fruit := (HBProduct from: 1328)
		description: 'yadayada';
		deliveryDate: (Date year: 2012 month: 2 day: 1);
		costPrice: 1505;
		unitCount: 1;
		supplierId: 204.
	fruit priceListLineOn: stream.
	line := stream contents trimRight.
	self assert: line = 'R   25.002012/02/08yadayada'.
	self assert: line size <= 50! !

!HBPriceListGeneratorTest methodsFor: 'tests' stamp: 'dkh 5/20/2012 18:26'!
testBerryTrouble
	| fruit stream line |
	stream := WriteStream on: String new.
	fruit := (HBProduct from: 1328)
		description: 'yadayada';
		deliveryDate: (Date year: 2012 month: 2 day: 1);
		costPrice: 1505;
		unitCount: 1;
		supplierId: 32.
	fruit priceListLineOn: stream.
	line := stream contents trimRight.
	self assert: line = 'R   21.332012/02/05yadayada'.
	self assert: line size <= 50! !

!HBPriceListGeneratorTest methodsFor: 'tests' stamp: 'dkh 5/20/2012 18:02'!
testCsvParser
	| csvCollection headingCollection |
	headingCollection := CSVParser
		parseString: '"Supplier ID","Product Code","Product Description","Delivery Date","Unit Price","Number of Units"'.
	csvCollection := CSVParser
		parseString:
			'15,1101,"Apples 1kg Golden Delicious. The sweetest Apples!! Always a favourite. Love, Mrs. Hollingberry","2012/02/15",1505,5'.
	self assert: headingCollection first size = csvCollection first size! !

!HBPriceListGeneratorTest methodsFor: 'tests' stamp: 'dkh 5/20/2012 15:44'!
testDateParsing
	self
		assert:
			(Date readFrom: '2012/02/15' readStream pattern: HBPriceListGenerator datePattern) = (Date year: 2012 month: 2 day: 15)! !

