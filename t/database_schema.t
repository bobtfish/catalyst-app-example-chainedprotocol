use strict;
use warnings;
use Test::More;

BEGIN { use_ok 'MusicDB'; }

use Test::DBIx::Class;

fixtures_ok 'basic'
  => 'installed the basic fixtures from configuration files';

done_testing;
