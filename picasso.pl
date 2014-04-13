#!/usr/bin/env perl
use warnings;
use strict;
use Term::ANSIColor;

my $matchCount = 5;
my $reset      = color('reset');

while(<>) {

    my (@matches) = ($_ =~ m/(<(black|red|green|yellow|blue|magenta|cyan|white)>)(.*?)(<\/(black|red|green|yellow|blue|magenta|cyan|white)>)/g);

    if( !@matches )
    {
      print $_;
      next;
    }


    my $loops = scalar @matches / $matchCount;

    my $start = 0;
    my $end   = 4;

    while($loops--) {
        # print $loops, "\n";
        my @slice   = @matches[$start..$end];
        my $opening = $slice[0];
        my $color   = color($slice[1]);
        my $closing = $slice[3];

        $_ =~ s/$opening/$color/g;
        $_ =~ s/$closing/$reset/g;


        $start += $matchCount;
        $end   += $matchCount;
    }

    print $_;

}


__END__
