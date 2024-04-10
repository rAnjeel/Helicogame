use DBI;

# Paramètres de connexion
my $dbname = 'Helico';
my $host = 'localhost';
my $user = 'postgres';
my $password = 'posgres';

# Chaîne de connexion
my $dsn = "dbi:Pg:dbname=$dbname;host=$host";

# Tentative de connexion
my $dbh = DBI->connect($dsn, $user, $password, {PrintError => 0, RaiseError => 1});

if ($dbh) {
    print "Connexion à la base de données PostgreSQL réussie.\n";
    $dbh->disconnect();
} else {
    print "Échec de la connexion à la base de données PostgreSQL: $DBI::errstr\n";
}
