my $filename = $ARGV[0];

sub readFile {
    my ($filename) = @_;
    open(my $fh, '<', $filename) or die "Could not open file '$filename' $!";
    my @lines = <$fh>;
    close($fh);
    return join("", @lines);
}

my $content = readFile($filename);
chomp($content);

my @lines = split(/\n/, $content);

my $emptyLineIndex = -1;
for (my $i = 0; $i < scalar(@lines); $i++) {
    if ($lines[$i] =~ /^\s*$/) {
        $emptyLineIndex = $i;
        last;
    }
}

my @ranges = @lines[0 .. ($emptyLineIndex - 1)];

my @parsedRanges = ();
foreach my $range (@ranges) {
    chomp($range);
    if ($range =~ /(\d+)-(\d+)/) {
        push @parsedRanges, [$1, $2];
    }
}

@parsedRanges = sort { $a->[0] <=> $b->[0] } @parsedRanges;

my @mergedRanges = ();
my $currentMin = $parsedRanges[0]->[0];
my $currentMax = $parsedRanges[0]->[1];

for (my $i = 1; $i < scalar(@parsedRanges); $i++) {
    my $min = $parsedRanges[$i]->[0];
    my $max = $parsedRanges[$i]->[1];
    
    if ($min <= $currentMax + 1) {
        if ($max > $currentMax) {
            $currentMax = $max;
        }
    } else {
        push @mergedRanges, [$currentMin, $currentMax];
        $currentMin = $min;
        $currentMax = $max;
    }
}

push @mergedRanges, [$currentMin, $currentMax];

my $totalIds = 0;
foreach my $range (@mergedRanges) {
    my $count = $range->[1] - $range->[0] + 1;
    $totalIds += $count;
}

print "$totalIds\n";