use 5.00503;
use strict;
BEGIN { $|=1; print "1..2\n"; my $testno=1; sub ok { print $_[0]?'ok ':'not ok ',$testno++,$_[1]?" - $_[1]\n":"\n" }}

use FindBin;
use lib "$FindBin::Bin/../lib";
use Perl7::Handy;

close(STDERR);

my $rc = 0;

eval { $rc = opendir(DIR,'.'); };
ok($@, q{opendir(DIR,'.')});
if ($rc) {
    local $_ = fileno(DIR);
    closedir(DIR);
}

$rc = opendir(my $dir,'.');
ok($rc, q{opendir(my $dir,'.')});
if ($rc) {
    closedir($dir);
}

__END__
