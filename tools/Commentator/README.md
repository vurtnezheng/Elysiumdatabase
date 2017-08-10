# Commentator
Creates a markdown document from SQL comments.

## Syntax
`Commentator <source file> <destination file> [-noformat]`

* source file = Source SQL file
* destination file = Destination file (a new file will be created; existing file will be removed)

### OPTIONAL
* -noformat = saves the comments without any formatting

## Format
* All normal SQL comments `-- ` will create a bullet point. 
* For plain text, use `-- ^ `.
* `|` can be used for optional data, which will be formatted separately.
* `-- * ` will make a header.
* `-- - ` will make a link to a header. Example: `-- - 1. NEW ITEMS` => `1. [NEW ITEMS](#new-items)`