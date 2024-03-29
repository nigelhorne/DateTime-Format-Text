#!perl -wT

use strict;
use warnings;
use Test::Most;
use DateTime::Format::Text;

eval 'use Test::Carp';

ERROR: {
	if($@) {
		plan(skip_all => 'Test::Carp needed to check error messages');
	} else {
		plan(tests => 12);
		my $dft = new_ok('DateTime::Format::Text');
		ok(!defined($dft->parse('29 SepX 1939')));
		ok(!defined($dft->parse('Foo in November 2009 Bar. XYZZY 45th PLUGH 7th TULIP')));
		does_croak_that_matches(sub { $dft->parse({ date => '30 Sep 1939' }) }, qr/^Usage:/);
		does_croak_that_matches(sub { $dft->parse(\"25 Dec 2022") }, qr/^Usage:/);
		does_croak_that_matches(sub { $dft->parse(string => undef) }, qr/^Usage:/);
		does_croak_that_matches(sub { $dft->parse(plugh => 'xyzzy') }, qr/^Usage:/);
		does_croak_that_matches(sub { $dft->parse(['30 Sep 1939']) }, qr/^Usage:/);
		does_croak_that_matches(sub { $dft->parse() }, qr/^Usage:/);
		does_croak_that_matches(sub { $dft->parse_datetime() }, qr/^Usage:/);
		does_croak_that_matches(sub { DateTime::Format::Text->parse() }, qr/^Usage:/);
		does_croak_that_matches(sub { DateTime::Format::Text::parse() }, qr/^Usage:/);
	}
}
