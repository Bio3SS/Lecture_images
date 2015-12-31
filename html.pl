use 5.10.0;
use strict;

my $rec = '<p><a href = "IMG">IMG:</a></p> <img src=THUMB></li><hr>';

my $name = shift(@ARGV);

say "<h2>$name</h2>";
while (<>){
	chomp;
	my $curr = $rec;
	next unless my ($image) = /^([^\s]*):$/;
	my $thumb = $image;
	$thumb =~ s/jpg$/png/;
	$thumb =~ s/png$/thumb.png/;
	$curr =~ s/IMG/$image/g;
	$curr =~ s/THUMB/$thumb/;
	say $curr;
}
