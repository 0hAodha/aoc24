#!/usr/bin/perl -l
use strict;
use warnings;

my $num_safe_reports = 0;

open(my $fh, "<", "input") or die("File 'input' not found!");
while (<$fh>) {
    chomp;

    my $unsafe_diffs = 0;

    my @differences;
    my @levels = split(/\s+/);

    for (my $i = 1; $i < @levels; $i++) {
        push(@differences, ($levels[$i-1] - $levels[$i]));
    }

    my $is_increasing = $differences[0] > 0;

    foreach my $diff (@differences) {
        if (($diff > 0) != $is_increasing || abs($diff) < 1 || abs($diff) > 3) {
            $unsafe_diffs++;
        }
    }

    $num_safe_reports = ($unsafe_diffs <= 1) ? $num_safe_reports + 1 : $num_safe_reports;
}
close($fh);
print($num_safe_reports);
