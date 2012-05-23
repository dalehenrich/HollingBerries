instance creation
lookupProduct: productCode
	| productClasses |
	productClasses := OrderedCollection new.
	self subclasses do: [ :productCategory | productClasses addAll: productCategory subclasses ].
	productClasses addAll: self subclasses.
	^ (productClasses
		detect: [ :productClass | productClass acceptsProductId: productCode ]
		ifNone: [ self error: 'Product id out of range' ]) new productCode: productCode