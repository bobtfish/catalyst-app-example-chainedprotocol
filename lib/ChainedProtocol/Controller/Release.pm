package ChainedProtocol::Controller::Release;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller' }

sub root : Chained('/root') PathPart('') CaptureArgs(0) {}

sub release : Chained('root') PathPart('release') CaptureArgs(0) {
    my ($self, $c) = @_;
    my $rs = $c->stash->{rs} = $c->model('DB::Release')->search;
}

sub item : Chained('release') PathPart('') Args(1) {
    my ($self, $c, $id) = @_;
    my $item = $c->stash->{rs} = $c->stash->{rs}->find({ release_id => $id })->first;
    $c->detach('/error404') unless $item;
    $c->stash->{zoom} = { # FIXME - need deep selectors here..
        '.upc' => { -replace_content => $item->upc },
        '.title' => { -replace_content => $item->title },
    };
}

sub list : Chained('release') PathPart('') Args(0) {
    my ($self, $c) = @_;
    my $rs = $c->stash->{rs};
    $c->stash->{zoom} = {
        '.list' => [
            map { {
                '.upc' => { -replace_content => $_->upc },
                '.title' => { -replace_content => $_->title },
            } } $rs->all
        ],
    };
}

__PACKAGE__->meta->make_immutable;
