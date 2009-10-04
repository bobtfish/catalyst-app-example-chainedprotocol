package MusicDB::Result::Release;
use base qw/DBIx::Class/;

__PACKAGE__->load_components(qw/Core/);
__PACKAGE__->table('release');
__PACKAGE__->add_columns(qw/ release_id title upc /);
__PACKAGE__->set_primary_key('release_id');
__PACKAGE__->has_many(tracks => 'MusicDB::Result::Track' => 'release_id');

1;
