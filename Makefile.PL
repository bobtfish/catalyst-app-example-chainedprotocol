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
requires 'Config::General'; # This should reflect the config file format you've chosen
                 # See Catalyst::Plugin::ConfigLoader for supported formats
requires 'Moose';
requires 'MooseX::Types';
requires 'MooseX::Types::Common';
requires 'MooseX::Types::Structured';
requires 'MooseX::Lexical::Types';
requires 'namespace::autoclean';
catalyst;

install_script glob('script/*.pl');
auto_install;
WriteAll;
