# Test Connexion dataBase

use strict;

use Connexion;

my $connexion = Connexion->new('helico', 'localhost', 'postgres', 'postgres');
my $dbh = $connexion->get_dbh();
my $sth = $dbh->prepare('SELECT * FROM Obstacle');
$sth->execute();
while (my $row = $sth->fetchrow_hashref()) {
    print "id: $row->{id}, name: $row->{name}\n";
}
$connexion->disconnect();