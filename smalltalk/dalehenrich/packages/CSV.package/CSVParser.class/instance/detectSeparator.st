separator
detectSeparator
	"frst guess the seperator based on the first field "
	separator := self guessSeparatorUsingFirstField.
	"check the first few lines for consistent number of fields, if not guess again"
	"todo"
	"reposition the stream to the beginning of the stream"
	stream reset.
	