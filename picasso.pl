#!/usr/bin/env perl
use warnings;
use strict;
use Term::ANSIColor;

my $reset = color('reset');

while(<>) {

    my (@matches) = ($_ =~ m/(<(black|red|green|yellow|blue|magenta|cyan|white)>)(.*?)(<\/(black|red|green|yellow|blue|magenta|cyan|white)>)/);

    if( !@matches )
    {
      print $_;
      next;
    }

    my $opening = $matches[0];
    my $color   = color($matches[1]);
    my $closing = $matches[3];


    $_ =~ s/$opening/$color/g;
    $_ =~ s/$closing/$reset/g;
    print $_;
}


__END__
