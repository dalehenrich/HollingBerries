busines rules
sellingPriceFor: product
	^ product costPrice * (product markup + self markup) roundUpTo: 100