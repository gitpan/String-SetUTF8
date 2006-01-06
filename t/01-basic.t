#! perl -w

use warnings;
use strict;

use Test;
BEGIN { plan tests => 1 }

use ExtUtils::testlib;
ok eval "use String::SetUTF8; 1";
