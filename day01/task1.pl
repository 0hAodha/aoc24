#!/usr/bin/perl -l

my (@list1, @list2);

open(my $fh, "<", "input") or die("File 'input' not found!");
while (<$fh>) {
    chomp;

    my ($location1, $location2) = split(/\s+/);
    push(@list1, $location1);
    push(@list2, $location2);
}
close($fh);

@list1 = sort(@list1);
@list2 = sort(@list2);

my $sum = 0;
for (my $i = 0; $i < @list1; $i++) {
    $sum += abs($list1[$i] - $list2[$i]);
}

print($sum);
