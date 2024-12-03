#!/usr/bin/perl -l
use strict;
use warnings;

my $total = 0;

open(my $fh, "<", "input") or die("File 'input' not found!");
while (<$fh>) {
    chomp;

    while ($_ =~ /mul\((\d{1,3}),(\d{1,3})\)/g) {
        $total += $1 * $2;
    }
}
close($fh);

print($total);
