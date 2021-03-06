package ChainedProtocol::Controller::Root;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller' }

#
# Sets the actions in this controller to be registered with no prefix
# so they function identically to actions created in MyApp.pm
#
__PACKAGE__->config->{namespace} = '';

=head1 NAME

ChainedProtocol::Controller::Root - Root Controller for ChainedProtocol

=head1 DESCRIPTION

[enter your description here]

=head1 METHODS

=head1 root

Chain start point

=cut

sub root : Chained('/') PathPart('') CaptureArgs(0) {}

=head2 index

=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

}

=head2 default

Renders a default 404 error page.

=cut

sub default :Path {
    my ( $self, $c ) = @_;
    $c->detach('/error404');
}

sub error404 : Action {
    my ( $self, $c ) = @_;
    $c->response->body( 'Page not found' );
    $c->response->status(404);
}

=head2 end

Attempt to render a view, if needed.

=cut

sub end : ActionClass('RenderView') {}

=head1 AUTHOR

Tomas Doran

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable