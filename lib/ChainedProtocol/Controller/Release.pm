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
    my $item = $c->stash->{rs} = $c->stash->{rs}->search({ release_id => $id })->single;
    $c->detach('/error404') unless $item;
    $c->stash->{zoom} = { # FIXME - need deep selectors here..
        '.upc' => { -replace_content => $item->upc },
        '.title' => { -replace_content => $item->title },
        '#tracks' => {
            -repeat => {
                data => [
                    map { {
                        '.sequence' => { -replace_content => $_->sequence },
                        '.tracktitle' => { -replace_content => $_->title },
                    } } $item->tracks
                ],
            },
        },
    };
}

sub list : Chained('release') PathPart('') Args(0) {
    my ($self, $c) = @_;
    my $rs = $c->stash->{rs};
    $c->stash->{zoom} = {
        '#list' => {
            -repeat => {
                data => [
                    map { {
                        '.upc' => { -replace_content => $_->upc },
                        '.title' => { -replace_content => $_->title },
                    } } $rs->all
                ],
            },
        },
    };
}

__PACKAGE__->meta->make_immutable;
