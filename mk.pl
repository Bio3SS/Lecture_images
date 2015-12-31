use 5.10.0;
use strict;

my $recipe = 'wget -O $@ "URL"';
my @images;
my @thumbs;

while (<>){
	chomp;
	next if /^\s*$/;
	next if /^#/;

	my ($name, $url) = split /\s+/;
	$name = "files/$name";
	my $ext = $url;
	$ext =~ s/.*\.//;
	$ext =~ tr/[A-Z]/[a-z]/;

	my $fn = "$name.$ext";
	push @images, $fn;
	push @thumbs, "$name.thumb.png";

	my $rline = $recipe;
	$url =~ s|^|http://| unless $url =~/^http/;
	$rline =~ s/URL/$url/;

	say "$fn:";
	say "\t$rline";
}

say "images = " . join " ", @images;
say "thumbs = " . join " ", @thumbs;
