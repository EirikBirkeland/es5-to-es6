# WARNING: This will affect any example code in comments as well!
# WARNING 2: This requires a properly formatted file

foreach (<>) {
   # Change anonymous functions style
   s/function\s*(\(.*?\))\s*\{/$1=>{/g;
   # Remove parenthesis around single argument in anonymous functions
   s/\(([a-zA-Z\$-_]+)\)=>\{/$1=>{/g;
   # change var to let
   s/^\bvar\b/let/;
   # Remove unnecessary semicolons ;)
   s/;$//;
   # Add semicolons where actually needed!
   s/^(?=[\(\{])/;/g;
   
   print;
}
