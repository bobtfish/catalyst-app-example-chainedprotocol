package MusicDB::Result::Track;
use base qw/DBIx::Class/;

__PACKAGE__->load_components(qw/Core/);
__PACKAGE__->table('track');
__PACKAGE__->add_columns(
    track_id => {
		data_type => 'int',
		size => '8',
		is_nullable => 0,
    },
    release_id => {
		data_type => 'int',
		size => '8',
		is_nullable => 0,
    },
    title => {
		data_type => 'varchar',
		size => '200',
		is_nullable => 0,
    },
    sequence => {
		data_type => 'int',
		size => '4',
		is_nullable => 0,
    },
    volume_no => {
		data_type => 'int',
		size => '4',
		is_nullable => 0,
    },
);
__PACKAGE__->set_primary_key('track_id');

1;
