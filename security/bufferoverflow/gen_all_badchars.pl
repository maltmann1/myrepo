#!/usr/bin/perl

# Code to output all bad characters to check in exploit coding

use strict;
use warnings;


my @hex_base = ("0","1","2","3","4","5","6","7","8","9","a","b","c","d","e","f");

for (@hex_base) {
        my $ten = $_;
	for (@hex_base) {
                print '\x';
	        print "$ten";
       		print $_;
	}
}   

