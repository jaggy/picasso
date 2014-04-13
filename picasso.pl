#!/usr/bin/env perl
use warnings;
use strict;
use Term::ANSIColor;

while(<>) {


  my (@matches) = ($_ =~ m/(.*?)(<(black|red|green|yellow|blue|magenta|cyan|white)>)(.*?)(<\/(black|red|green|yellow|blue|magenta|cyan|white)>)(.*)/);

  if( !@matches )
  {
    print $_;
    next;
  }

  my $pretext   = $matches[0];
  my $color     = $matches[2];
  my $colorized = $matches[3];
  my $posttext  = $matches[6];

  print $pretext, color( $color ), $colorized, color( 'reset' ), $posttext, "\n";
}


__END__
