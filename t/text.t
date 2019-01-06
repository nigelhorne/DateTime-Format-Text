#!perl -wT

use strict;
use warnings;
use Test::Most tests => 30;
use Test::NoWarnings;

BEGIN {
	use_ok('DateTime::Format::Text');
}

TEXT: {
	my $dft = new_ok('DateTime::Format::Text');

	my $dt = $dft->parse('Today is 5/1/19');
	ok($dt->day() == 5);
	ok($dt->month() == 1);
	ok($dt->year() == 2019);
	$dt = $dft->parse(string => 'Today is 5/1/19');
	ok($dt->day() == 5);
	ok($dt->month() == 1);
	ok($dt->year() == 2019);
	$dt = $dft->parse({ string => 'Sunday 1st March 2015' });
	ok($dt->day() == 1);
	ok($dt->month() == 3);
	ok($dt->year == 2015);
	$dt = $dft->parse('Sunday, 1 March 2015');
	ok($dt->day() == 1);
	ok($dt->month() == 3);
	ok($dt->year == 2015);
	$dt = $dft->parse('Sun 1 Mar 2015');
	ok($dt->day() == 1);
	ok($dt->month() == 3);
	ok($dt->year == 2015);
	$dt = $dft->parse('Sun-1-March-2015');
	ok($dt->day() == 1);
	ok($dt->month() == 3);
	ok($dt->year == 2015);
	$dt = $dft->parse('March 1st 2015');
	ok($dt->day() == 1);
	ok($dt->month() == 3);
	ok($dt->year == 2015);
	$dt = DateTime::Format::Text->parse('March 1 2015');
	ok($dt->day() == 1);
	ok($dt->month() == 3);
	ok($dt->year == 2015);
	$dt = DateTime::Format::Text::parse('March-1st-2015');
	ok($dt->day() == 1);
	ok($dt->month() == 3);
	ok($dt->year == 2015);
}
