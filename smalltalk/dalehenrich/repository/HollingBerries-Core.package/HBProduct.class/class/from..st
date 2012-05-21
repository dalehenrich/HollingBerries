instance creation
from: productCode
	^ (self allSubclasses reversed
		detect: [ :productClass | productClass acceptsProductId: productCode ]
		ifNone: [ self error: 'Product id out of range' ]) new