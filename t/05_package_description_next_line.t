#!/usr/bin/perl

package MyNewPackage;
# description of this package is on the next line, however, it's seen

use lib 'lib','../lib';

use strict;
use warnings;

use Test;

BEGIN { plan tests => 1 }

use Pod::Autopod;
# comment line following an import is not treated as import's description

# This is a test sub
sub test_case_1 { # $output ($param)
}

my $ap = new Pod::Autopod();
$ap->readFile(__FILE__);

ok($ap->getPod(), <<'ORIG');
=head1 NAME

MyNewPackage - description of this package is on the next line, however, it's seen


=head1 DESCRIPTION

!/usr/bin/perl


=head1 REQUIRES

L<lib> 

L<Test> 

L<Pod::Autopod> 


=head1 METHODS

=head2 test_case_1

 my $output = test_case_1($param);

This is a test sub



=cut

ORIG

1;
