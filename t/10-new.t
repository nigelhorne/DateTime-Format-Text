#!perl -wT

use strict;

use lib 'lib';
use Test::Most tests => 2;
use DateTime::Format::Text;

isa_ok(DateTime::Format::Text->new(), 'DateTime::Format::Text', 'Creating DateTime::Format::Text object');
ok(!defined(DateTime::Format::Text::new()));
