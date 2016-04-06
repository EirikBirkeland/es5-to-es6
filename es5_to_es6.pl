# WARNING: since the input is streamed, each line is is considered in isolation
# WARNING: will replace contents within comment blocks
# WARNING: always keep backups

use strict;
use warnings;

foreach (<>) {
   # Skip line if the line is a standard comment (/* */ not implemented)
   next if m{^\s*(?://)};

   # Change anonymous functions to arrow functions
   s/function\s*(\(.*?\))\s*\{/$1 => {/g;

   # Remove parenthesis around single argument in anonymous arrow functions
   s/\(([a-zA-Z\$-_]+)\)=>\{/$1 => {/g;

   # Cosmetic: Add spacing around any arrows lacking it
   s/\s*=>\s*(?=\{)/ => /g;

   # Change var to let, while preserving spacing. Note that switching from var to let WILL break some code (function scope <-> block scope).
   s/^(\s*)\bvar\b/$1let/;

   # change require lines from let to const
   s/^(\s*)\blet/$1const/ if m{=\s*require\(.*?\)};

   # Remove unnecessary semicolons ;)
   s/;(\s*)$/$1/;

   # Add semicolons where actually needed (in front of sentence-initial parentheses and brackets)
   s/^(?=[\(\{])/;/g;

   print;
}
