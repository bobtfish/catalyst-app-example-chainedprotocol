package ChainedProtocol::Controller::Release;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller' }

sub root : Chained('/root') PathPart('') CaptureArgs(0) {}

sub release : Chained('root') PathPart('release') CaptureArgs(0) {}

sub item : Chained('release') PathPart('') Args(1) {
    my ($self, $c, $id) = @_;
    my $item = $c->stash->{item} = $c->model('DB::Release')->find($id);
    $c->detach('/error404') unless $item;
    $c->stash->{zoom} = { # FIXME - need deep selectors here..
        '.upc' => { -replace_content => $item->upc },
        '.title' => { -replace_content => $item->title },
    };
}

__PACKAGE__->meta->make_immutable;
