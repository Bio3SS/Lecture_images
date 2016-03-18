use strict;
use 5.10.0;

$/ = "";

while(<>){
	next unless /wget/;
	s/.[^.]*:\s*\n[^"]*"/ /s;
	s/"\s*$//;
	print "$_\n\n";
}
