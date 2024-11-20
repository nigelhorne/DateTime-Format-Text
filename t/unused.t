#!perl -w

use strict;
use warnings;

use Test::DescribeMe qw(author);
use Test::Most;
use Test::Needs { 'warnings::unused' => '0.04' };

use_ok('DateTime::Format::Text');
new_ok('DateTime::Format::Text');
plan(tests => 2);
