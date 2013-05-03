use strict;
use Plack::Test;
use Test::More;
use HTTP::Request::Common;
use Plack::App::File::CaseInsensitive;

my $app = Plack::App::File::CaseInsensitive->new();

test_psgi $app, sub {
    my $cb = shift;

    my $res = $cb->(GET "/cHanGeS");
    is $res->code, 200;
    like $res->content, qr/Plack/;
};

die "test for warnings";

done_testing;
