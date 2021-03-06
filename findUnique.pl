#!/usr/bin/env perl

#Given a file of clusters with counts for each sample 
#Find Clusters that only appear in 1 sample where counts for all replicates are >=50 
#and counts for all other samples are <= 10
##Format is clusterid followed columns containing counts for each sample
#A header row is present in the file

my %colhash = ();
my $infile = shift;
$infile = "gunzip -c $infile |" if ($infile =~ /\.gz$/);
open(IN,$infile) or die "Cannot open $infile\n";
my $rownum = 0;
my @cols;
my @head;

while(<IN>){
    chomp;
    if ($rownum == 0){
       @cols = split();
       @head = @row[1..$#cols];
       foreach my $elm(@head){
         $colhash{$elm}=1;
       }
      $rownum++;
    }
    else{
      my @row = split(/\t/);
      my @vals = @row[1..$#row];
      my $contig = $row[0];
      my $uncount = 0;
      my $colcount = 0;
      my $readcount = 0;
      my $foundcount = 0;
      foreach my $count(@vals){
         $colcount++;
         my @reps = split(/\s+/,$count);
         my $repcount = 0;
         #if (@reps == grep {$_ >= 10} @reps){
            my $numbers =  @reps;
          foreach (@reps){
           $repcount++ if ($_ >= 10);
          }
          if ($repcount){
            #print "$count\t$numbers\n";
            $readcount = $count;
            $uncount = $colcount;
            $foundcount++;
         }
      }
      if($foundcount == 1){
         my @rcounts = split(/\s+/,$readcount); 
         my $pass = 1;
         foreach (@rcounts){
           $pass++ if($_>50);
         }
         if ($pass == scalar @rcounts){         
           my $colname = @cols[$uncount];
           $colhash{$colname}{$contig}=$readcount;
           print "$colname\t$contig\t$readcount\n";
         }
      }
   }
}
close(IN);
exit;
foreach my $key (keys %colhash){
   foreach my $elm (keys %{$colhash{$key}}){
        print "$key\t$elm\t$colhash{$key}{$elm}\n";
   }
}
          
           
      
