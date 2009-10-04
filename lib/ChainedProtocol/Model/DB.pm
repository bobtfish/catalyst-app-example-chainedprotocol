package ChainedProtocol::Model::DB;
use Moose;
use namespace::autoclean;

extends 'Catalyst::Model::DBIC::Schema';

__PACKAGE__->config(
    schema_class => 'MusicDB',
    connect_info => {
        dsn => "DBI:SQLite:dbname=db.sqlite3", # FIXME - won't work if installed
        user => "username",
        password => "password",
    },
);

__PACKAGE__->meta->make_immutable;
