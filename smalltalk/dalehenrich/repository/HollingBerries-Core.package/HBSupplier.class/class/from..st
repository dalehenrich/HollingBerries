instance creation
from: supplierId
	^ (self suppliers at: supplierId ifAbsent: [ HBGenericSupplier ]) new supplierId: supplierId