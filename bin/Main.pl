use strict;
use warnings;
use Connexion;

# Créer une instance de MaConnexion
my $connexion = MaConnexion->new();

# Récupérer les obstacles depuis la base de données
my $obstacles = $connexion->get_obstacles();

# Vérifier si la récupération a réussi
if ($obstacles) {
    foreach my $obstacle (@$obstacles) {
        print "ID: $obstacle->{id}, Points: $obstacle->{points}\n";
    }
} else {
    print "La récupération des obstacles a échoué.\n";
}
