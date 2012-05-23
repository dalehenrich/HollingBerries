tests
testGenerator
	| csvCollection stream result |
	csvCollection := CSVParser parse: self produce readStream.
	stream := WriteStream on: String new.
	HBPriceListGenerator new generatePriceListFrom: csvCollection on: stream.
	result := stream contents.
	self assert: result = self pricefile