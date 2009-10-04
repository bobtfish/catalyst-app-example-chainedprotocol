package MusicDB::Result::Release;
use base qw/DBIx::Class/;

__PACKAGE__->load_components(qw/Core/);
__PACKAGE__->table('release');
__PACKAGE__->add_columns(
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
    upc => {
        data_type => 'varchar',
		size => '36',
		is_nullable => 0,
    },
);
__PACKAGE__->set_primary_key('release_id');
__PACKAGE__->has_many(tracks => 'MusicDB::Result::Track' => 'release_id');

1;
