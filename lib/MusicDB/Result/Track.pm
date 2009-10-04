package MusicDB::Result::Track;
use base qw/DBIx::Class/;

__PACKAGE__->load_components(qw/Core/);
__PACKAGE__->table('track');
__PACKAGE__->add_columns(qw/ track_id release_id title sequence volume_no /);
__PACKAGE__->set_primary_key('track_id');

1;
