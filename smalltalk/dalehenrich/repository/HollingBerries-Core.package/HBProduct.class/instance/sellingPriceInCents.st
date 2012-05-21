business rules
sellingPriceInCents
	^ (self supplier sellingPriceFor: self) max: 0