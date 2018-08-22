#!/usr/bin/env perl

#Input is file containg 2 columns contig_id cluster_id
#and a fasta file of contigs (ids must match between files).
#Finds the longest contig for each cluster.

use Bio::SeqIO;

my %clusterhash = ();
my $format = "FASTA";
my $infile = shift;
my $fastafile = shift;
my $outfile = shift;
$infile = "gunzip -c $infile |" if ($infile =~ /\.gz$/);
open(IN,$infile) or die "Cannot open $infile\n";

while(<IN>){
    chomp;
    my ($contig,$cluster) = split();
    push (@{ $clusterhash{$cluster}},$contig);
}
close(IN);

my $seq_in = Bio::SeqIO->new(-format=>$format, -file=>$fastafile, -alphabet=>'dna');
my $seq_out = Bio::SeqIO->new(-format=>$format, -file => ">$outfile");
my %contighash = ();
my %annothash = ();
my %longhash = ();
while ($seq = $seq_in->next_seq()){
   my $seqid = $seq->id();
   my $length = $seq->length();
   my $annot = $seq->desc();
   #next if ($annot =~ m/-NA-/);
   #warn "$seqid\t$annot\n";
   $contighash{$seqid}=$length;
   $annothash{$seqid}=$annot;
}
foreach my $key (keys %clusterhash){
   print "$key";
   my $longest = 0;
   my $longcont = '';
   my $longannot = '---NA---';
   foreach my $elm (@{$clusterhash{$key}}){
       if($contighash{$elm} > $longest){
         $longest = $contighash{$elm};
         $longcont = $elm;
         $longannot = $annothash{$elm};
      }
   }
   print "\t$longcont\t$longest\t$annothash{$longcont}\n";
   $longhash{$longcont}=$key;
}

$seq_in = Bio::SeqIO->new(-format=>$format, -file=>$fastafile, -alphabet=>'dna');

while ($seq = $seq_in->next_seq()){
   my $seqid = $seq->id();
   if ($longhash{$seqid}){
     my $display = $longhash{$seqid}.":".$seqid;
     $seq->display_id($display);
     $seq_out->write_seq($seq);
  }
}


          
           
      
