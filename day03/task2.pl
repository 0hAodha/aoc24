#!/usr/bin/perl -l
use strict;
use warnings;

my @instructions;
my $total = 0;

open(my $fh, "<", "input") or die("File 'input' not found!");
while (<$fh>) {
    chomp;

    # there's almost certainly a cleverer way to do this with one regular expression but i don't know how to do it and i should be studying for exams right now instead so i won't be spending time figuring out how
    push(@instructions, ($_ =~ /don\'t|do|mul\(\d{1,3},\d{1,3}\)/g))
}
close($fh);

my $do = 1;
foreach my $instruction (@instructions) {
    if ($instruction eq "don't") {
        $do = 0;
    }
    elsif ($instruction eq "do") {
        $do = 1;
    }
    elsif ($do && $instruction =~ /mul\((\d{1,3}),(\d{1,3})\)/g) {
        $total += $1 * $2;
    }
}

print($total);
