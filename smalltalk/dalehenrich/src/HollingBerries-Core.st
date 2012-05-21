Object subclass: #HBPriceListGenerator
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'HollingBerries-Core'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

HBPriceListGenerator class
	instanceVariableNames: ''!

!HBPriceListGenerator class methodsFor: 'private' stamp: 'dkh 5/20/2012 15:43'!
datePattern
	^ 'yyyy/mm/dd'! !

!HBPriceListGenerator class methodsFor: 'private' stamp: 'dkh 5/20/2012 18:28'!
generatePriceListFrom: csvCollection on: stream
	| csvLine product productCode |
	2 to: csvCollection size do: [ :index | 
		csvLine := csvCollection at: index.
		productCode := (csvLine at: 2) asInteger.
		product := (HBProduct from: productCode)
			productCode: productCode;
			description: (csvLine at: 3);
			deliveryDate: (Date readFrom: (csvLine at: 4) readStream pattern: self datePattern);
			costPrice: (csvLine at: 5) asInteger;
			unitCount: (csvLine at: 6) asInteger;
			supplierId: (csvLine at: 1) asInteger.
		product priceListLineOn: stream ]! !


!HBPriceListGenerator class methodsFor: 'generator' stamp: 'dkh 5/20/2012 18:57'!
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
			self generatePriceListFrom: csvCollection on: stream ]! !


Object subclass: #HBProduct
	instanceVariableNames: 'supplierId productCode description deliveryDate costPrice unitCount'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'HollingBerries-Core'!

!HBProduct methodsFor: 'price list generation' stamp: 'dkh 5/20/2012 16:17'!
descriptionOn: aStream
	aStream nextPutAll: (String streamContents: [ :s | s nextPutAll: self description ] limitedTo: 31)! !

!HBProduct methodsFor: 'price list generation' stamp: 'dkh 5/20/2012 17:19'!
priceListLineOn: aStream
	self unitCount
		timesRepeat: [ 
			aStream nextPut: $R.
			self
				sellingPriceOn: aStream;
				sellByDateOn: aStream;
				descriptionOn: aStream.
			aStream cr ]! !

!HBProduct methodsFor: 'price list generation' stamp: 'dkh 5/20/2012 17:29'!
sellByDateOn: aStream
	self sellByDate printOn: aStream format: #(3 2 1 $/ 1 1 2)! !

!HBProduct methodsFor: 'price list generation' stamp: 'dkh 5/20/2012 17:25'!
sellingPriceOn: aStream
	| price priceString |
	price := self sellingPriceInCents / 100 asScaledDecimal: 2.
	priceString := String streamContents: [ :s | price printOn: s showingDecimalPlaces: 2 ].
	8 - priceString size timesRepeat: [ aStream space ].
	aStream nextPutAll: priceString! !


!HBProduct methodsFor: 'business rules' stamp: 'dkh 5/20/2012 17:10'!
markup
	^ 1.50! !

!HBProduct methodsFor: 'business rules' stamp: 'dkh 5/20/2012 18:39'!
sellByDate
	^ self supplier sellByDateFor: self! !

!HBProduct methodsFor: 'business rules' stamp: 'dkh 5/20/2012 17:48'!
sellByDuration
	^ 1 weeks! !

!HBProduct methodsFor: 'business rules' stamp: 'dkh 5/20/2012 18:32'!
sellingPriceInCents
	^ (self supplier sellingPriceFor: self) max: 0! !


!HBProduct methodsFor: 'accessing' stamp: 'dkh 5/20/2012 16:07'!
costPrice
	^ costPrice! !

!HBProduct methodsFor: 'accessing' stamp: 'dkh 5/20/2012 16:07'!
costPrice: anObject
	costPrice := anObject! !

!HBProduct methodsFor: 'accessing' stamp: 'dkh 5/20/2012 16:07'!
deliveryDate
	^ deliveryDate! !

!HBProduct methodsFor: 'accessing' stamp: 'dkh 5/20/2012 16:07'!
deliveryDate: anObject
	deliveryDate := anObject! !

!HBProduct methodsFor: 'accessing' stamp: 'dkh 5/20/2012 16:07'!
description
	^ description! !

!HBProduct methodsFor: 'accessing' stamp: 'dkh 5/20/2012 16:07'!
description: anObject
	description := anObject! !

!HBProduct methodsFor: 'accessing' stamp: 'dkh 5/20/2012 16:08'!
productCode
	^ productCode! !

!HBProduct methodsFor: 'accessing' stamp: 'dkh 5/20/2012 16:08'!
productCode: anObject
	productCode := anObject! !

!HBProduct methodsFor: 'accessing' stamp: 'dkh 5/20/2012 16:09'!
supplier
	^ HBSupplier from: self supplierId! !

!HBProduct methodsFor: 'accessing' stamp: 'dkh 5/20/2012 16:08'!
supplierId
	^ supplierId! !

!HBProduct methodsFor: 'accessing' stamp: 'dkh 5/20/2012 16:08'!
supplierId: anObject
	supplierId := anObject! !

!HBProduct methodsFor: 'accessing' stamp: 'dkh 5/20/2012 16:08'!
unitCount
	^ unitCount! !

!HBProduct methodsFor: 'accessing' stamp: 'dkh 5/20/2012 16:08'!
unitCount: anObject
	unitCount := anObject! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

HBProduct class
	instanceVariableNames: ''!

!HBProduct class methodsFor: 'instance creation' stamp: 'dkh 5/20/2012 18:28'!
from: productCode
	^ (self allSubclasses reversed
		detect: [ :productClass | productClass acceptsProductId: productCode ]
		ifNone: [ self error: 'Product id out of range' ]) new! !


HBProduct subclass: #HBFruit
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'HollingBerries-Core'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

HBFruit class
	instanceVariableNames: ''!

!HBFruit class methodsFor: 'testing' stamp: 'dkh 5/20/2012 18:28'!
acceptsProductId: productCode
	^ 1000 <= productCode and: [ productCode <= 1999 ]! !


HBFruit subclass: #HBApple
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'HollingBerries-Core'!

!HBApple methodsFor: 'business rules' stamp: 'dkh 5/20/2012 17:11'!
markup
	^ 1.40! !

!HBApple methodsFor: 'business rules' stamp: 'dkh 5/20/2012 17:48'!
sellByDuration
	^ 2 weeks! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

HBApple class
	instanceVariableNames: ''!

!HBApple class methodsFor: 'testing' stamp: 'dkh 5/20/2012 18:29'!
acceptsProductId: productCode
	^ 1100 <= productCode and: [ productCode <= 1199 ]! !


HBFruit subclass: #HBBerry
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'HollingBerries-Core'!

!HBBerry methodsFor: 'business rules' stamp: 'dkh 5/20/2012 17:11'!
markup
	^ 1.55! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

HBBerry class
	instanceVariableNames: ''!

!HBBerry class methodsFor: 'testing' stamp: 'dkh 5/20/2012 18:29'!
acceptsProductId: productCode
	^ 1300 <= productCode and: [ productCode <= 1399 ]! !


HBFruit subclass: #HBBanana
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'HollingBerries-Core'!

!HBBanana methodsFor: 'business rules' stamp: 'dkh 5/20/2012 17:11'!
markup
	^ 1.35! !

!HBBanana methodsFor: 'business rules' stamp: 'dkh 5/20/2012 17:48'!
sellByDuration
	^ 5 days! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

HBBanana class
	instanceVariableNames: ''!

!HBBanana class methodsFor: 'testing' stamp: 'dkh 5/20/2012 18:29'!
acceptsProductId: productCode
	^ 1200 <= productCode and: [ productCode <= 1299 ]! !


Object subclass: #HBSupplier
	instanceVariableNames: 'supplierId'
	classVariableNames: 'Suppliers'
	poolDictionaries: ''
	category: 'HollingBerries-Core'!

!HBSupplier methodsFor: 'busines rules' stamp: 'dkh 5/20/2012 18:42'!
sellByDateFor: product
	^ product deliveryDate + product sellByDuration + self sellByDuration! !

!HBSupplier methodsFor: 'busines rules' stamp: 'dkh 5/20/2012 18:35'!
sellingPriceFor: product
	^ product costPrice * (product markup + self markup)! !


!HBSupplier methodsFor: 'accessing' stamp: 'dkh 5/20/2012 18:41'!
markup
	^ 0! !

!HBSupplier methodsFor: 'accessing' stamp: 'dkh 5/20/2012 18:38'!
sellByDuration
	^ 0 day! !

!HBSupplier methodsFor: 'accessing' stamp: 'dkh 5/20/2012 15:57'!
supplierId
	^ supplierId! !

!HBSupplier methodsFor: 'accessing' stamp: 'dkh 5/20/2012 15:57'!
supplierId: anObject
	supplierId := anObject! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

HBSupplier class
	instanceVariableNames: ''!

!HBSupplier class methodsFor: 'instance creation' stamp: 'dkh 5/20/2012 17:25'!
from: supplierId
	^ (self suppliers at: supplierId ifAbsent: [ HBGenericSupplier ]) new supplierId: supplierId! !



!HBSupplier class methodsFor: 'registration' stamp: 'dkh 5/20/2012 15:55'!
register
	self suppliers at: self supplierId put: self! !


!HBSupplier class methodsFor: 'accessing' stamp: 'dkh 5/20/2012 15:55'!
suppliers
	Suppliers ifNil: [ Suppliers := Dictionary new ].
	^ Suppliers! !


HBSupplier subclass: #HBTroubleSupplier
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'HollingBerries-Core'!

!HBTroubleSupplier methodsFor: 'busines rules' stamp: 'dkh 5/20/2012 18:33'!
sellingPriceFor: product
	^ (super sellingPriceFor: product) - 200! !


!HBTroubleSupplier methodsFor: 'accessing' stamp: 'dkh 5/20/2012 18:39'!
sellByDuration
	^ -3 days! !


HBSupplier subclass: #HBPremiumSupplier
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'HollingBerries-Core'!

!HBPremiumSupplier methodsFor: 'busines rules' stamp: 'dkh 5/20/2012 18:35'!
sellingPriceFor: product
	^ (super sellingPriceFor: product) roundUpTo: 100! !


!HBPremiumSupplier methodsFor: 'accessing' stamp: 'dkh 5/20/2012 18:41'!
markup
	^ 0.10! !


HBPremiumSupplier subclass: #HBKarelVisserSupplier
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'HollingBerries-Core'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

HBKarelVisserSupplier class
	instanceVariableNames: ''!

!HBKarelVisserSupplier class methodsFor: 'accessing' stamp: 'dkh 5/20/2012 16:01'!
supplierId
	^ 204! !


!HBKarelVisserSupplier class methodsFor: 'initialization' stamp: 'dkh 5/20/2012 16:01'!
initialize
	"self initialize"

	self register! !


HBTroubleSupplier subclass: #HBTogethernessTshabalalaSupplier
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'HollingBerries-Core'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

HBTogethernessTshabalalaSupplier class
	instanceVariableNames: ''!

!HBTogethernessTshabalalaSupplier class methodsFor: 'accessing' stamp: 'dkh 5/20/2012 15:58'!
supplierId
	^ 101! !


!HBTogethernessTshabalalaSupplier class methodsFor: 'initialization' stamp: 'dkh 5/20/2012 15:58'!
initialize
	"self initialize"

	self register! !


HBTroubleSupplier subclass: #HBSusanWindlerSupplier
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'HollingBerries-Core'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

HBSusanWindlerSupplier class
	instanceVariableNames: ''!

!HBSusanWindlerSupplier class methodsFor: 'accessing' stamp: 'dkh 5/20/2012 15:53'!
supplierId
	^ 32! !


!HBSusanWindlerSupplier class methodsFor: 'initialization' stamp: 'dkh 5/20/2012 15:56'!
initialize
	"self initialize"

	self register! !


HBSupplier subclass: #HBGenericSupplier
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'HollingBerries-Core'!


HBPremiumSupplier subclass: #HBPromiseMashanguSupplier
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'HollingBerries-Core'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

HBPromiseMashanguSupplier class
	instanceVariableNames: ''!

!HBPromiseMashanguSupplier class methodsFor: 'accessing' stamp: 'dkh 5/20/2012 16:00'!
supplierId
	^ 219! !


!HBPromiseMashanguSupplier class methodsFor: 'initialization' stamp: 'dkh 5/20/2012 16:00'!
initialize
	"self initialize"

	self register! !

HBKarelVisserSupplier initialize!
HBTogethernessTshabalalaSupplier initialize!
HBSusanWindlerSupplier initialize!
HBPromiseMashanguSupplier initialize!
