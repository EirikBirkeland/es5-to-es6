# WARNING: This will affect any example code in comments as well!
# WARNING 2: This requires a properly formatted file

use strict;
use warnings;

foreach (<>) {
   # Skip if the line is a standard comment (/* */ not implemented)
   next if m{^\s*(?://};

   # Change anonymous functions to arrow functions
   s/function\s*(\(.*?\))\s*\{/$1 => {/g;

   # Remove parenthesis around single argument in anonymous arrow functions
   s/\(([a-zA-Z\$-_]+)\)=>\{/$1 => {/g;

   # Change var to let, while preserving spacing. Note that witching from var to let WILL break some code (function scope <-> block scope).
   s/^(\s*)\bvar\b/$1let/;

   # Remove unnecessary semicolons ;)
   s/;(\s*)$/$1/;

   # Add semicolons where actually needed (in front of sentence-initial parentheses and brackets)
   s/^(?=[\(\{])/;/g;

   print;
}
