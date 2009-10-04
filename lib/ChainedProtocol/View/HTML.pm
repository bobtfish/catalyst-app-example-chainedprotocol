package ChainedProtocol::View::HTML;
use Moose;
use namespace::autoclean;

extends 'Catalyst::View::HTML::Zoom';

__PACKAGE__->config( template_extension => 'html' );

__PACKAGE__->meta->make_immutable;
