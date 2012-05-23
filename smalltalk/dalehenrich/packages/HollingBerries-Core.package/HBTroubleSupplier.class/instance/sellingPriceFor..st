busines rules
sellingPriceFor: product
	^ (super sellingPriceFor: product) - 200 max: 0