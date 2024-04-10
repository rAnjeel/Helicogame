package Connexion;
use DBI;

sub new {
    my $class = shift;

    my $self = {
        dbname   => 'helico',
        host     => 'localhost',
        user     => 'pilote',
        password => 'postgres',
    };

    bless $self, $class;
    return $self;
}

sub connect_db {
    my ($self) = @_;

    my $dsn = "dbi:Pg:dbname=$self->{dbname};host=$self->{host}";
    my $dbh = DBI->connect($dsn, $self->{user}, $self->{password}, {PrintError => 0, RaiseError => 1});

    if ($dbh) {
        print "Connexion à la base de données PostgreSQL réussie.\n";
        return $dbh;
    } else {
        print "Échec de la connexion à la base de données PostgreSQL: $DBI::errstr\n";
        return;
    }
}

sub get_obstacles {
    my ($self) = @_;

    my $dbh = $self->connect_db();
    unless ($dbh) {
        print "Impossible de récupérer les obstacles - connexion échouée.\n";
        return;
    }

    my $query = "SELECT * FROM Obstacles";
    my $sth = $dbh->prepare($query);
    $sth->execute();

    my @obstacles;
    while (my $row = $sth->fetchrow_hashref()) {
        push @obstacles, $row;
    }

    $dbh->disconnect();
    return \@obstacles;
}

1;