#!/usr/bin/env perl
# IMPORTANT: if you delete this file your app will not work as
# expected.  You have been warned.
use inc::Module::Install;

name 'ChainedProtocol';
all_from 'lib/ChainedProtocol.pm';

requires 'Catalyst::Runtime' => '5.80013';
requires 'Catalyst::Plugin::ConfigLoader';
requires 'Catalyst::Plugin::Static::Simple';
requires 'Catalyst::Action::RenderView';
requires 'Catalyst::Model::DBIC::Schema';
requires 'Catalyst::View::HTML::Zoom';
requires 'Config::General'; # This should reflect the config file format you've chosen
                 # See Catalyst::Plugin::ConfigLoader for supported formats
requires 'Moose';
requires 'MooseX::Types';
requires 'MooseX::Types::Common';
requires 'MooseX::Types::Structured';
requires 'MooseX::Lexical::Types';
requires 'MooseX::MethodAttributes::Role' => '0.18';
requires 'DBIx::Class' => '0.08112';
requires 'SQL::Translator' => '0.11002';
requires 'namespace::autoclean';

test_requires 'DBICx::TestDatabase';

catalyst;

if ($Module::Install::AUTHOR) {
    system("pod2text lib/ChainedProtocol.pm > README")
        and die;
}

install_script glob('script/*.pl');
auto_install;
WriteAll;
