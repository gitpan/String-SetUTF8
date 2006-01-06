#! perl -w

use warnings;
use strict;

use Test;
BEGIN { plan tests => 3 }

use ExtUtils::testlib;
ok eval "use String::SetUTF8; 1";

my $string = 1;
ok !eval 'setUTF8($string); 1';

ok !eval 'setUTF8(1); 1';
