use strict;
use warnings;
use Test::More;

use DBICx::TestDatabase;
my $schema = DBICx::TestDatabase->new('MusicDB');
ok $schema;

done_testing;
