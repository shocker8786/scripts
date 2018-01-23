#!/usr/bin/perl 
use strict;
use Getopt::Long;
use File::Temp qw/ tempfile unlink0 /;
use File::Basename qw / fileparse /;
use FileHandle;
use POSIX qw/ ceil floor /;
use Data::Dumper;

##@todos
##Add plot condition to all plot subroutines
##Add adaptive ref to non-ref filter to all ASE subroutines
##Add readme and help

##GLOBALS
my $ENSEMBL_VERSION = 63;
my $ENSEMBL_USER = "anonymous";
my $ENSEMBL_HOST = "ensembldb.ensembl.org";
my $ENSEMBL_PORT = "5306";
my $ENSEMBL_PASS = "";
my $PLOT = 0;
my $RLOC = "/cm/shared/apps/R3/bin/R";
chomp $RLOC;
my $REXE = $RLOC;

##MAIN PROGRAM
my $cmd_plot_mqs = 0;
my $sam_file = undef;

my $cmd_generate_vcf = 0;
my $genotype_location_file = undef;

my $cmd_parse_pileup = 0;
my $sam_pileup_file = undef;
my $vcf_file = undef;

my $cmd_plot_refnonref = 0;
my $parsed_pileup_file = undef;
my $included_sites_vcf_file = undef;
my $filter_base_quality = 0;
my $require_both_alleles_seen = 0;

my $cmd_plot_alleles_seen = 0;
my $minimum_reads_at_site = 0;

my $cmd_plot_reads_by_sites = 0;

my $cmd_get_gene_snp_mapping_file = 0;
my $use_gencode = 0;

my $cmd_get_gene_snp_coverage = 0;
my $gene_quantification_file = undef;
my $gene_snp_mapping_file = undef;

my $cmd_calculate_ase = 0;
my $ase_ref_to_nonreference_ratio = 0.5;
my $mapping_quality_threshold = 0;

my $cmd_calculate_ase_from_ploidy_genotypes = 0;
my $ploidy_allele_file = undef;

my $cmd_merge_parsed_pileup_files = 0;

my $cmd_permute_parsed_pileup_files = 0;
my $permutations = 100;
my $project_id;
my $permutation_start_position = 0;

my $cmd_calculate_ase_between_treatments = 0;
my $parsed_pileup_file1 = undef;
my $parsed_pileup_file2 = undef;
my $minimum_reads_at_site1 = 0;
my $minimum_reads_at_site2 = 0;

my $cmd_help = 0;
#sf, gl, sp, vcf, pp, is, mrs, bq, gq, gf, mqs, pf, p, id, spos, bs
GetOptions( ##Plots number of reads at various mapping quality scores
            'plot_mqs' => \$cmd_plot_mqs,  
            'sam_file|sf=s' => \$sam_file,
           
            ##Build a pseudo-VCF file from just a list of SNP positions
            'generate_vcf' => \$cmd_generate_vcf,
            'genotype_location_file|gl=s' => \$genotype_location_file,
           
            ##Parse the SAM pileup file (probably this can be an internal routine since it is fast)
            'parse_pileup' => \$cmd_parse_pileup,
            'sam_pileup_file|sp=s' => \$sam_pileup_file,
            'vcf_file|vcf=s' => \$vcf_file, 
            
            ##Plot the number of reference to non-reference alleles as a function of mapping quality
            ##and output the mapping to non-reference mapping bias
            'plot_refnonref' => \$cmd_plot_refnonref,
            'parsed_pileup_file|pp=s' => \$parsed_pileup_file,
            'included_sites_vcf_file|is=s' => \$included_sites_vcf_file,
            'minimum_reads_at_site|mrs=s' => \$minimum_reads_at_site,
            'req_both_alleles_seen|bs' => \$require_both_alleles_seen,
           
            ##Plot the number of alleles seen per site as a function of mapping quality
            'plot_alleles_seen' => \$cmd_plot_alleles_seen,
            'base_quality_filter|bq=s' => \$filter_base_quality,
            
            ##Plot the number of sites with a certain number of reads (over mapping quality)
            'plot_reads_by_sites' => \$cmd_plot_reads_by_sites,
            
            ##Identify the genes, transcripts and exons over a site
            'get_gene_snp_mapping_file' => \$cmd_get_gene_snp_mapping_file,
            'use_gencode' => \$use_gencode,
            
            ##Identify the relationship between gene read counts and quantifiable ASE sites
            'get_gene_snp_coverage' => \$cmd_get_gene_snp_coverage,
            'gene_quantification_file|gq=s' => \$gene_quantification_file,
            
            ##Determine the binomial p-value and weights for each site
            'calculate_ase_normal' => \$cmd_calculate_ase,
            'gene_snp_mapping_file|gf=s' => \$gene_snp_mapping_file,
            'ratio|r=s' => \$ase_ref_to_nonreference_ratio,
            'mapping_quality_threshold|mqs=s' => \$mapping_quality_threshold,
            
            ##Determine the ASE for trisomy individuals
            'calculate_ase_trisomy' => \$cmd_calculate_ase_from_ploidy_genotypes,
            'ploidy_allele_file|pf=s' => \$ploidy_allele_file,
            
            ##Permute parsed pileup file
            'permute_pp' => \$cmd_permute_parsed_pileup_files,
            'permutations|p=s' => \$permutations,
            'project_id|id=s' => \$project_id,
            'start_position|spos=s' => \$permutation_start_position,
            
            ##Merged parsed pileup files
            'merge_parsed_pileups' => \$cmd_merge_parsed_pileup_files,
            
            ##Calculate ASE differences between individuals
            'calculate_ase_between_treatments' => \$cmd_calculate_ase_between_treatments,
            'parsed_pileup_file1|pp1=s' => \$parsed_pileup_file1,
            'parsed_pileup_file2|pp2=s' => \$parsed_pileup_file2,
            'minimum_reads_in_pp1|mrs1=s' => \$minimum_reads_at_site1,
            'minimum_reads_in_pp2|mrs2=s' => \$minimum_reads_at_site2,
           
            'help|?' => \$cmd_help);
pod2usage(1) if $cmd_help;

if ($cmd_plot_mqs) { plotMqs($sam_file); }
elsif ($cmd_generate_vcf) { generateVcf($genotype_location_file); } 
elsif ($cmd_parse_pileup) { getParsePileup($sam_pileup_file, $vcf_file); }
elsif ($cmd_plot_refnonref) { plotRefNonRef($parsed_pileup_file, $included_sites_vcf_file, $minimum_reads_at_site, $filter_base_quality, $require_both_alleles_seen); }
elsif ($cmd_plot_alleles_seen) { plotAllelesSeen($parsed_pileup_file, $included_sites_vcf_file, $minimum_reads_at_site, $filter_base_quality); }
elsif ($cmd_plot_reads_by_sites) { plotReadsBySites($parsed_pileup_file, $included_sites_vcf_file); }
elsif ($cmd_get_gene_snp_mapping_file) { getGeneSNPMappingFile($parsed_pileup_file, $included_sites_vcf_file, $use_gencode); }
elsif ($cmd_get_gene_snp_coverage) { getGeneSNPCoverage($parsed_pileup_file, $gene_quantification_file, $gene_snp_mapping_file,
                                                        $included_sites_vcf_file, $minimum_reads_at_site, $filter_base_quality); }
#@todo command which is gene reads by depth at site
elsif ($cmd_calculate_ase) { calculateASE($parsed_pileup_file, $ase_ref_to_nonreference_ratio, $minimum_reads_at_site,
                                          $mapping_quality_threshold, $filter_base_quality,
                                          $included_sites_vcf_file, $gene_snp_mapping_file); }
elsif ($cmd_calculate_ase_from_ploidy_genotypes) {calculateAseFromPloidyGenotypes(  $parsed_pileup_file, $ase_ref_to_nonreference_ratio, $ploidy_allele_file,
                                                                                    $minimum_reads_at_site, $mapping_quality_threshold, $filter_base_quality,
                                                                                    $included_sites_vcf_file, $gene_snp_mapping_file); }
elsif ($cmd_merge_parsed_pileup_files) { heapSortAndMergeFiles($parsed_pileup_file1, $parsed_pileup_file2); }
elsif ($cmd_permute_parsed_pileup_files) { permuteParsePileupFile($parsed_pileup_file, $included_sites_vcf_file, $permutations, $project_id, $permutation_start_position); }
elsif ($cmd_calculate_ase_between_treatments) { calculateAseBetweenTreatments($parsed_pileup_file1, $parsed_pileup_file2,
                                                                              $included_sites_vcf_file, $minimum_reads_at_site1,
                                                                              $minimum_reads_at_site2, $mapping_quality_threshold,
                                                                              $filter_base_quality, $gene_snp_mapping_file ); }

exit(0);

##SUBROUTINES
sub plotMqs() {
    my $sam_file = shift;
    if (!defined($sam_file)) { die "missing argument: --sam_file (-sf)"; }
    unless(-f $sam_file) { die "SAM file not a file $sam_file"; }
    my $name = fileparse($sam_file);
    $name =~ s/.sam//g;
    my ($mfh1, $mfilename1) = tempfile( "samasetmpXXXXXXX",
                                        CLEANUP => 1); 
    my $cmd = "awk 'NF > 0{ counts[\$5] = counts[\$5] + 1; } END { for (word in "; 
    $cmd .= "counts) print word, counts[word]; }' $sam_file | sort -k1 -n > $mfilename1";
    `$cmd`;
    my ($rfh1, $Rfilename1) = tempfile( "samaseRtmpXXXXXXX",
                                        CLEANUP => 1);
    open(RFH1, ">" . $Rfilename1) || die("Cannot open R file");
    print RFH1 "foo<-read.table(\"$mfilename1\", header=F)\n";
    print RFH1 "postscript(file=\"plot_mqs.$name.ps\", onefile=T, width=600, height=400)\n";
    print RFH1 "plot(foo\$V1, cumsum(foo\$V2)/sum(foo\$V2), ylim=c(0,1), type=\"l\",";
    print RFH1 " xlab=\"Mapping quality score\", ylab=\"Percentage of reads\", ";
    print RFH1 " main=\"Cumulative distribution of reads at mapping quality scores\")\n";
    print RFH1 "dev.off()\n";
    close(RFH1);
    `$REXE --no-save < $Rfilename1`;
    `ps2pdf plot_mqs.$name.ps`;
    `rm plot_mqs.$name.ps`;
    print STDERR "Plot created as plot_mqs_$name.pdf\n";
    unlink0($mfh1, $mfilename1);
    unlink0($rfh1, $Rfilename1);
}

sub generateVcf() { 
    my $genotype_location_file = shift;  
    if (!defined($genotype_location_file)) { die "missing argument: --genotype_location_file (-gl)"; }
    unless(-f $genotype_location_file) { die "genotype location file not a file $genotype_location_file"; }
    
    my $slice_adaptor;
    eval {
        require Bio::EnsEMBL::Registry;
        print STDERR "Using EnsEMBL version: $ENSEMBL_VERSION\n";
        Bio::EnsEMBL::Registry->load_registry_from_db(  -host => $ENSEMBL_HOST,
                                                        -user => $ENSEMBL_USER,
                                                        -pass => $ENSEMBL_PASS,
                                                        -port => $ENSEMBL_PORT,
                                                        -db_version => $ENSEMBL_VERSION);
        $slice_adaptor = Bio::EnsEMBL::Registry->get_adaptor("human", "core", "Slice");
    }; if ($@) {
        warn $@;
        print STDERR "The EnsEMBL API is likely not installed, please follow the instructions here " .
        "http://www.ensembl.org/info/docs/api/api_cvs.html and install the core API for " .
        "the branch of EnsEMBL you are working with\nThis will then need to be added to your " .
        "PERL5LIB environment variable so that it is visible to this script.\nOtherwise, if this is " .
        "already installed, you may have a connection problem to the ensembldb.ensembl.org for the " .
        "version of the database you are interested in.  Edit the connection information in this script " .
        "to point to a new host, port, user and password or change the global variable for the ENSEMBL_VERSION " .
        "which is currently set to: $ENSEMBL_VERSION\n";
        return;
    }
    open(GENO, $genotype_location_file) || die("Cannot open genotype location file");
    print "#CHROM\tPOS\tID\tREF\tALT\tQUAL\tFILTER\tINFO\n";
    while (my $line = <GENO>) {
        chomp $line;
        my @ts = split /[\s]+/, $line;
        if ($ts[1] =~ /[0-9XY]+/g) { ##Is a chromosome
            my $slice = $slice_adaptor->fetch_by_region('chromosome', $ts[1], $ts[2], $ts[2], 1);
            if (defined($slice)) {
                my $reference_allele = $slice->seq;
                my @alleles = split /\//, $ts[3];
                if ($reference_allele eq $alleles[0] || $reference_allele eq $alleles[1]) {
                    if ($reference_allele eq $alleles[0]) {
                        print $ts[1] . "\t" . $ts[2] . "\t" . $ts[0] . "\t" . $reference_allele . "\t" . $alleles[1] . "\t.\t.\t.\n"; 
                    } else {
                        print $ts[1] . "\t" . $ts[2] . "\t" . $ts[0] . "\t" . $reference_allele . "\t" . $alleles[0] . "\t.\t.\t.\n"; 
                    }
                } else {
                    if ($alleles[0] eq "A") { $alleles[0] = "T"; }
                    elsif ($alleles[0] eq "C") { $alleles[0] = "G"; }
                    elsif ($alleles[0] eq "G") { $alleles[0] = "C"; }
                    elsif ($alleles[0] eq "T") { $alleles[0] = "A"; }
                    
                    if ($alleles[1] eq "A") { $alleles[1] = "T"; }
                    elsif ($alleles[1] eq "C") { $alleles[1] = "G"; }
                    elsif ($alleles[1] eq "G") { $alleles[1] = "C"; }
                    elsif ($alleles[1] eq "T") { $alleles[1] = "A"; }
                    
                    if ($reference_allele eq $alleles[0] || $reference_allele eq $alleles[1]) {
                        if ($reference_allele eq $alleles[0]) {
                            print $ts[1] . "\t" . $ts[2] . "\t" . $ts[0] . "\t" . $reference_allele . "\t" . $alleles[1] . "\t.\t.\t.\n"; 
                        } else {
                            print $ts[1] . "\t" . $ts[2] . "\t" . $ts[0] . "\t" . $reference_allele . "\t" . $alleles[0] . "\t.\t.\t.\n"; 
                        }
                    } else {
                        close(GENO);
                        die("Cannot find matching reference allele for $line\n for slice sequence $reference_allele\n");
                    }
                }
            } else {
                warn "Could not find sequence data for genotype location $line\n";
            }
        } else {
            warn "Column 2 of genotype file is not identifiable as a chromosome (i.e: 1,2,21,X,Y)\n" .
                 "Offending line: $line\n";
        }
    }
}

sub getParsePileup() {
    my $sam_pileup_file = shift;
    my $vcf_file = shift;
    
    if (!defined($sam_pileup_file)) { die "missing argument: --sam_pileup_file (-sp)"; }
    unless(-f $sam_pileup_file) { die "SAM pileup file not a file $sam_pileup_file"; }
    
    if (!defined($vcf_file)) {
        die "missing argument: --vcf_file (-vcf) " .
            "try running command --generate_vcf first to generate this file if you just have a list of SNP positions"; 
    }
    unless(-f $vcf_file) { die "VCF file not a file $vcf_file"; }
    open(VCF, $vcf_file) || die("Cannot open VCF file");
    my %reference_bases;
    while (my $line = <VCF>) {
        chomp $line;
        if ($line =~ /#[\S\s]+/g) {
            next;   
        }
        my @ts = split /\t/, $line;
	my $chr = $ts[0];
	$chr =~ s/chr//;
        $reference_bases{$chr}{$ts[1]}{'id'} = $ts[2];
        $reference_bases{$chr}{$ts[1]}{'nt'} = $ts[3];
    }
    close(VCF);
    
    print "MAPPING_QUALITY_THRESHOLD\tSAMPLE\tSNP_ID\tSNP_CHR\tSNP_POS\tDEPTH\tTOTAL_NT_AT_MQ\tPILEUP_STRING\tREF_ALLELE_COUNTS\tNONREF_ALLELE_COUNTS\n";
    my $quality_threshold = 0;   
    open(PILEUP, $sam_pileup_file) || die("Cannot open SAM pileup file");
    my $name = fileparse($sam_pileup_file);
    while (my $line = <PILEUP>) {
        chomp $line;
        my @ts = split /\t/, $line;
        my $chromosome = $ts[0];
	$chromosome =~ s/chr//;
        my $position = $ts[1];
        my $depth = $ts[3];
        
        my $reference_base = $reference_bases{$chromosome}{$position}{'nt'};
        if (!defined($reference_base)) {
            warn "Ignoring base chr=$chromosome and pos=$position because it is not found in reference base file\n";
            next;
        }
        $reference_base = uc($reference_base);
        my @pileup_nts = split //, $ts[4];
        my @base_qualities = split //, $ts[5];
        my @mapping_qualities = split //, $ts[6];
        
        my $total_relevant_nt = 0;
        my %nt_holder;
        my $p_string = "";
        for (my $i = 0; $i < scalar(@pileup_nts); $i++) {
            if ($pileup_nts[$i] eq '^') {
                $i++; ##skip the next character
            } elsif (uc($pileup_nts[$i]) =~ /[ATCG]+/ || $pileup_nts[$i] eq ',' || $pileup_nts[$i] eq '.') {
                if ($pileup_nts[$i] eq ',' || $pileup_nts[$i] eq '.') {
                    $pileup_nts[$i] = uc($ts[2]);
                }
                my $quality_ascii = shift @mapping_qualities;
                my $base_quality_ascii = shift @base_qualities;
                if (!defined($quality_ascii)) {
                    print STDERR $pileup_nts[$i] . "\n";
                    close(PILEUP);
                    die("Fix line processing, ran out of mapping qualities at index $i for $line");
                }
                my $quality_value = ord($quality_ascii) - 33;
                my $base_quality_value = ord($base_quality_ascii) - 33;
                if ($quality_value >= $quality_threshold) {
                    $total_relevant_nt++;
                    if (!defined($nt_holder{uc($pileup_nts[$i])})) {
                        $nt_holder{uc($pileup_nts[$i])} = 0;
                    }
                    $nt_holder{uc($pileup_nts[$i])} = $nt_holder{uc($pileup_nts[$i])} + 1;

                    if ($p_string eq "") {
                        $p_string = uc($pileup_nts[$i]) . "_" . $quality_value . "_" . $base_quality_value;
                    } else {
                        $p_string .= ":" . uc($pileup_nts[$i]) . "_" . $quality_value . "_" . $base_quality_value;
                    }
                }
            } elsif ($pileup_nts[$i] eq '*' || $pileup_nts[$i] eq '>' || $pileup_nts[$i] eq '<' || uc($pileup_nts[$i]) eq 'N') { ##deleted bases and such are ignored
                shift @mapping_qualities;
                shift @base_qualities;
            } elsif ($pileup_nts[$i] eq '$') {
                 ##do nothing
            } elsif ($pileup_nts[$i] eq '+' || $pileup_nts[$i] eq '-') { ##inserted bases
                my $length = $pileup_nts[$i+1];
                if ($pileup_nts[$i+2] =~ /[0-9]+/g) {
                    $length = int($pileup_nts[$i+1] . $pileup_nts[$i+2]); $i=$i+1;
                    if ($pileup_nts[$i+3] =~ /[0-9]+/g) {
                        $length = int($pileup_nts[$i+1] . $pileup_nts[$i+2] . $pileup_nts[$i+3]); $i=$i+1;
                        if ($pileup_nts[$i+4] =~ /[0-9]+/g) {
                            $length = int($pileup_nts[$i+1] . $pileup_nts[$i+2] . $pileup_nts[$i+3] . $pileup_nts[$i+4]); $i=$i+1;
                            if ($pileup_nts[$i+5] =~ /[0-9]+/g) {
                                $length = int($pileup_nts[$i+1] . $pileup_nts[$i+2] . $pileup_nts[$i+3] . $pileup_nts[$i+4] . $pileup_nts[$i+5]); $i=$i+1;
                            }
                        }
                    }
                }
                $i += $length + 1;

            } else {
                print STDERR $pileup_nts[$i] . "\n";
                close(PILEUP);
                die("Fix line processing, unknown character for $line");
            }
        }
         if (scalar(@mapping_qualities) > 0) {
            close(PILEUP);
            die("Fix line processing for $line");
        }

        if (!defined($nt_holder{uc($reference_base)})) {
            $nt_holder{uc($reference_base)} = 0;
        }
        print $quality_threshold . "\t" .  $name . "\t" . $reference_bases{$chromosome}{$position}{'id'} . "\t" . $chromosome . "\t" . $position . "\t" . $depth . "\t" . $total_relevant_nt;
        print "\t" . $p_string;
        print "\t" . uc($reference_base) . "_" . $nt_holder{uc($reference_base)};
        my $first_print = 1;
        foreach my $pileup_nt (keys %nt_holder) {
            if ($pileup_nt ne uc($reference_base)) {
                if ($first_print) {
                    print "\t" . $pileup_nt . "_" . $nt_holder{uc($pileup_nt)};
                } else {
                    print ":" . $pileup_nt . "_" . $nt_holder{uc($pileup_nt)};
                }
            }
        }
        print "\n";
    }
    close(PILEUP);
}

sub plotRefNonRef() {
    my $parsed_pileup_file = shift;
    my $included_sites_vcf_file = shift;
    my $minimum_number_of_reads_at_site = shift;
    my $filter_base_quality = shift;
    my $require_both_alleles_seen = shift;
    
    if ($require_both_alleles_seen) { print STDERR "Requiring both known alleles to be seen, only valid if included sites file is provided\n"; }
    
    ##Plot for bins of MQS 10, the percentage of ref to non ref alleles and output the percentages at different MQS
    if (!defined($parsed_pileup_file)) { die "missing argument: --parsed_pileup_file (-pp)"; }
    unless(-f $parsed_pileup_file) { die "Parsed pileup file not a file $parsed_pileup_file"; }
    
    my $name = fileparse($parsed_pileup_file);
    my $use_only_defined_sites = 0;
    my $site_info_hashref = _load_site_filter($included_sites_vcf_file);
    if (defined($site_info_hashref)) { $use_only_defined_sites = 1; }
    
    my $site_count = 0;
    
    open(PARSED_PILEUP, $parsed_pileup_file) || die("Cannot open parsed pileup file");
    my %data;
    for (my $i = 0; $i < 100; $i=$i+10) {
        $data{$i}{'ref'} = 0;
        $data{$i}{'non_ref'} = 0;
    }
    while (my $line = <PARSED_PILEUP>) {
        chomp $line;
        my @ts = split /\t/, $line;
        my %reference_alleles;
        if ($use_only_defined_sites) {
            if (!defined($site_info_hashref->{$ts[3]}->{$ts[4]})) {
                next;
            } else {
                my $astring = $site_info_hashref->{$ts[3]}->{$ts[4]}->{'alleles'};
                my @ats = split /\//, $astring;
                foreach my $at (@ats) {
                    $reference_alleles{$at} = 1;
                }
            }
        }
        $site_count++;
        my @ref_allele_ts = split /_/, $ts[8];
        my $ref_allele = $ref_allele_ts[0];
        my @alleles = split /:/, $ts[7];
        my $alleles_at_site = 0;
        my %reference_alleles_seen;
        foreach my $allele (@alleles) {
            my @allele_ts = split /_/, $allele;
            if ($allele_ts[2] >= $filter_base_quality) {
                $alleles_at_site++;
                if ($reference_alleles{$allele_ts[0]}) {
                    $reference_alleles_seen{$allele_ts[0]} = 1;
                }
            }
        }
        if ($alleles_at_site >= $minimum_number_of_reads_at_site) {
            my $proceed = 1;
            if ($use_only_defined_sites && $require_both_alleles_seen) {
                if (scalar(keys %reference_alleles_seen) == 1) {
                    $proceed = 0;
                }
            }
            if ($proceed) {
                foreach my $allele (@alleles) {
                    my @allele_ts = split /_/, $allele;
                    if ($allele_ts[2] >= $filter_base_quality) {
                        for (my $i = 0; $i < 100; $i=$i+10) {
                            if ($allele_ts[1] >= $i) {
                                if ($allele_ts[0] eq $ref_allele) {
                                    $data{$i}{'ref'} = $data{$i}{'ref'} + 1;
                                } else {
                                    $data{$i}{'non_ref'} = $data{$i}{'non_ref'} + 1;
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    close(PARSED_PILEUP);
    
    my ($mfh1, $mfilename1) = tempfile( "samasetmpXXXXXXX",
                                        CLEANUP => 1);
    open(OUT, ">" . $mfilename1) || die("Cannot open tmp file $mfilename1");
    print "MAP_QUAL_THRES\tREF_ALL\tNONREF_ALL\tPERC\n";
    my $y_max = 0;
    for (my $i = 0; $i < 100; $i=$i+10) {
        my $perc =    $data{$i}{'ref'} / ($data{$i}{'ref'} + $data{$i}{'non_ref'});
        print $i . "\t" . $data{$i}{'ref'} . "\t" . $data{$i}{'non_ref'} . "\t" . $perc . "\n";
        print OUT $i . "\t" . $data{$i}{'ref'} . "\t" . $data{$i}{'non_ref'} . "\t" . $perc . "\n";
    }
    close(OUT);

    if ($PLOT) {
        my $postscript_output_filename = "plot_ref_nonref.$name.bq_" . $filter_base_quality;
        my ($rfh1, $Rfilename1) = tempfile( "samaseRtmpXXXXXXX",
                                            CLEANUP => 1);
        open(RFH1, ">" . $Rfilename1) || die("Cannot open R file");
        print RFH1 "foo<-read.table(\"$mfilename1\", header=F)\n";
        print RFH1 "postscript(file=\"$postscript_output_filename.ps\", onefile=T, width=600, height=400)\n";
        print RFH1 "plot(foo\$V1, foo\$V4, ylim=c(0,1), type=\"l\",";
        print RFH1 " xlab=\"Mapping quality score\", ylab=\"Percentage of reference to non-reference alleles\", ";
        print RFH1 " sub=\"Base quality filter = $filter_base_quality\",\n";
        print RFH1 " main=\"Reference to non-reference allele bias\")\n";
        print RFH1 "dev.off()\n";
        close(RFH1);
        `$REXE --no-save < $Rfilename1`;
        `ps2pdf $postscript_output_filename.ps`;
        `rm $postscript_output_filename.ps`;
        print STDERR "Plot created as " . $postscript_output_filename . ".pdf\n";
        unlink0($rfh1, $Rfilename1);
    }
    unlink0($mfh1, $mfilename1);
    print STDERR "Used $site_count sites\n";
}

sub plotAllelesSeen() {
    my $parsed_pileup_file = shift;
    my $included_sites_vcf_file = shift;
    my $minimum_number_of_reads_at_site = shift;
    my $filter_base_quality = shift;
    
    if (!defined($parsed_pileup_file)) { die "missing argument: --parsed_pileup_file (-pp)"; }
    unless(-f $parsed_pileup_file) { die "Parsed pileup file not a file $parsed_pileup_file"; }
    if(!defined($minimum_number_of_reads_at_site)) {
        $minimum_number_of_reads_at_site = 0;
    } elsif ($minimum_number_of_reads_at_site < 0) {
        die("Minimum number of reads at site is not numeric: $minimum_number_of_reads_at_site");
    }
    
    my $name = fileparse($parsed_pileup_file);
    my $use_only_defined_sites = 0;
    my $site_info_hashref = _load_site_filter($included_sites_vcf_file);
    if (defined($site_info_hashref)) { $use_only_defined_sites = 1; }
    
    my $site_count = 0;
    open(PARSED_PILEUP, $parsed_pileup_file) || die("Cannot open parsed pileup file");
    my %type_data;
    for (my $i = 0; $i < 100; $i=$i+10) {
        $type_data{$i}{'single'} = 0;
        $type_data{$i}{'bi'} = 0;
        $type_data{$i}{'tri'} = 0;
    }
    while (my $line = <PARSED_PILEUP>) {
        chomp $line;
        my @ts = split /\t/, $line;
        if ($use_only_defined_sites) {
            if (!defined($site_info_hashref->{$ts[3]}->{$ts[4]})) {
                next;
            }
        }
        if ($ts[5] < $minimum_number_of_reads_at_site) { ##Skipping because not enough reads exist
            next;
        }
        $site_count++;
        my @alleles = split /:/, $ts[7];
        my %seen_alleles;
        my $passing_base_quality = 0;
        foreach my $allele (@alleles) {
            my @allele_ts = split /_/, $allele;
            if ($allele_ts[2] >= $filter_base_quality) {
                for (my $i = 0; $i < 100; $i=$i+10) {
                    if ($allele_ts[1] >= $i) {
                        $seen_alleles{$i}{$allele_ts[0]} = 1;
                    }
                }
                $passing_base_quality++;
            }
        }
        if ($passing_base_quality < $minimum_number_of_reads_at_site) {  ##Skipping because not enough reads meet desired base quality
            next;
        }
        for (my $i = 0; $i < 100; $i=$i+10) {
            my $tmp_hash = $seen_alleles{$i};
            my $seen_alleles = scalar keys( %$tmp_hash );
            if ($seen_alleles == 1) {
                $type_data{$i}{'single'} = $type_data{$i}{'single'} + 1;
            } elsif ($seen_alleles == 2) {
                $type_data{$i}{'bi'} = $type_data{$i}{'bi'} + 1;
            } elsif ($seen_alleles >= 3) {
                $type_data{$i}{'tri'} = $type_data{$i}{'tri'} + 1;
            }
        }
    }
    close(PARSED_PILEUP);
    
    my ($mfh1, $mfilename1) = tempfile( "samasetmpXXXXXXX",
                                        CLEANUP => 1);
    open(OUT, ">" . $mfilename1) || die("Cannot open tmp file $mfilename1");
    print "MAP_QUAL_THRES\tONE_ALL_SEEN\tTWO_SEEN\tTHREE_OR_MORE_SEEN\n";
    my $y_max = 0;
    for (my $i = 0; $i < 100; $i=$i+10) {
        print $i . "\t" . $type_data{$i}{'single'} . "\t" .  $type_data{$i}{'bi'} . "\t" .  $type_data{$i}{'tri'} . "\n";
        print OUT $i . "\t" . $type_data{$i}{'single'} . "\t" .  $type_data{$i}{'bi'} . "\t" .  $type_data{$i}{'tri'} . "\n";
        if ($type_data{$i}{'single'} > $y_max) { $y_max = $type_data{$i}{'single'}  }
        if ($type_data{$i}{'bi'} > $y_max) { $y_max = $type_data{$i}{'bi'}  }
        if ($type_data{$i}{'tri'} > $y_max) { $y_max = $type_data{$i}{'tri'}  }
    }
    close(OUT);
    $y_max = $y_max * 1.2;
    
    my ($rfh1, $Rfilename1) = tempfile( "samaseRtmpXXXXXXX",
                                        CLEANUP => 1);
    open(RFH1, ">" . $Rfilename1) || die("Cannot open R file");
    print RFH1 "foo<-read.table(\"$mfilename1\", header=F)\n";
    print RFH1 "postscript(file=\"plot_alleles_seen.$name.ps\", onefile=T, width=600, height=400)\n";
    print RFH1 "barplot(as.matrix(t(foo[,2:4])), beside=T, ylim=c(0,$y_max),\n";
    print RFH1 " sub=\"Minimum number of reads at site (indep. of qual) = $minimum_number_of_reads_at_site, Base quality filter = $filter_base_quality\",\n";
    print RFH1 " names.arg=foo\$V1, xlab=\"Mapping quality\",\n" ;
    print RFH1 " ylab=\"Number of SNPs\", \n";
    print RFH1 " main=\"Number of SNPs with 1, 2 and >= 3 alleles detected versus mapping quality\", \n";
    print RFH1 " col=c(\"Darkgreen\", \"Green\", \"Lightgreen\"), angle=45, density=50 )\n";
    print RFH1 "legend(\"topleft\", c(\"One allele detected\", \"Two alleles detected\", \"3 or more alleles detected\"),\n";
    print RFH1 "fill=c(\"Darkgreen\", \"Green\", \"Lightgreen\"), bty=\"n\", density=50, angle=45)\n";
    print RFH1 "dev.off()\n";
    
    close(RFH1);
    `$REXE --no-save < $Rfilename1`;
    `ps2pdf plot_alleles_seen.$name.ps`;
    `rm plot_alleles_seen.$name.ps`;
    print STDERR "Plot created as plot_alleles_seen.$name.pdf\n";
    unlink0($mfh1, $mfilename1);
    unlink0($rfh1, $Rfilename1);
    print STDERR "Used $site_count sites\n";
}

sub plotReadsBySites() {
    my $parsed_pileup_file = shift;
    my $included_sites_vcf_file = shift;
    
    if (!defined($parsed_pileup_file)) { die "missing argument: --parsed_pileup_file (-pp)"; }
    unless(-f $parsed_pileup_file) { die "Parsed pileup file not a file $parsed_pileup_file"; }
    
    my $name = fileparse($parsed_pileup_file);
    
    my $use_only_defined_sites = 0;
    my $site_info_hashref = _load_site_filter($included_sites_vcf_file);
    if (defined($site_info_hashref)) { $use_only_defined_sites = 1; }
    
    my $site_count = 0;
    open(PARSED_PILEUP, $parsed_pileup_file) || die("Cannot open parsed pileup file");
    my %site_data;
    for (my $i = 0; $i < 100; $i=$i+10) {
        my @array = ();
        $site_data{$i} = \@array;
    }
    my $max_reads = 0;
    while (my $line = <PARSED_PILEUP>) {
        chomp $line;
        my @ts = split /\t/, $line;
        if ($use_only_defined_sites) {
            if (!defined($site_info_hashref->{$ts[3]}->{$ts[4]})) {
                next;
            }
        }
        $site_count++;
        my @alleles = split /:/, $ts[7];
        my %read_counts;
        for (my $i = 0; $i < 100; $i=$i+10) {
            $read_counts{$i} = 0;   
        }
        foreach my $allele (@alleles) {
            my @allele_ts = split /_/, $allele;
            for (my $i = 0; $i < 100; $i=$i+10) {
                if ($allele_ts[1] >= $i) {
                    $read_counts{$i} = $read_counts{$i} + 1;
                }
            }
        }
        for (my $i = 0; $i < 100; $i=$i+10) {
            if ($read_counts{$i} > 0) {
                push @{$site_data{$i}}, $read_counts{$i};
            }
            if ($max_reads < $read_counts{$i}) {
                $max_reads = $read_counts{$i};
            }
        }
    }
    close(PARSED_PILEUP);
    my $max_reads_log_2 = int(log($max_reads)/log(2)) + 1;
    my %counts;
    for (my $i = 0; $i < 100; $i=$i+10) {
        my @site_data_elements = @{$site_data{$i}};
        $counts{$i} = scalar(@site_data_elements);
    }
    my ($mfh1, $mfilename1) = tempfile( "samasetmpXXXXXXX",
                                         CLEANUP => 1);
    open(OUT, ">" . $mfilename1) || die("Cannot open tmp file $mfilename1");
    for (my $j = 0; $j < $max_reads_log_2; $j++) {
        print $j;
        print OUT $j;
        for (my $i = 0; $i < 100; $i=$i+10) {
            my $curr_count = 0;
            my @site_data_elements = @{$site_data{$i}};
            foreach my $site_data_element (@site_data_elements) {
                my $value = log($site_data_element)/log(2);
                if ($value >= $j && $value < ($j+1)) {
                    $curr_count++;
                }
            }
            my $perc = $curr_count / $counts{$i};
            print "\t" . $perc;
            print OUT "\t" . $perc;
        }
        print "\n";
        print OUT "\n";
    }
    close(OUT);
    
    my ($rfh1, $Rfilename1) = tempfile( "samaseRtmpXXXXXXX",
                                        CLEANUP => 1);
    open(RFH1, ">" . $Rfilename1) || die("Cannot open R file");
    print RFH1 "foo<-read.table(\"$mfilename1\", header=F)\n";
    print RFH1 "postscript(file=\"plot_site_hist.$name.ps\", onefile=T, width=600, height=400)\n";
    print RFH1 "barplot(as.matrix(t(foo[,2:11])), names.arg=foo\$V1, beside=T, xlab=\"Read counts (log2)\",";
    print RFH1 "ylab=\"Percentage of sites\", main=\"Distribution of the number of reads per site\", ylim=c(0,0.6))\n";
    print RFH1 "legend(\"topright\", c(\"0\",\"10\",\"20\",\"30\",\"40\",\"50\",";
    print RFH1 "\"60\",\"70\",\"80\",\"90\") ,fill=gray.colors(10), bty=\"n\", title=\"Min. mapping quality\")\n";
    print RFH1 "dev.off()\n";
    close(RFH1);
    `$REXE --no-save < $Rfilename1`;
    `ps2pdf plot_site_hist.$name.ps`;
    `rm plot_site_hist.$name.ps`;
    print STDERR "Plot created as plot_site_hist.$name.pdf\n";
    unlink0($mfh1, $mfilename1);
    unlink0($rfh1, $Rfilename1);
    print STDERR "Used $site_count sites\n";
}

sub getGeneSNPMappingFile() {
    my $parsed_pileup_file = shift;
    my $included_sites_vcf_file = shift;
    my $use_gencode = shift;
    
    if (!defined($included_sites_vcf_file)) {
        if (!defined($parsed_pileup_file)) { die "missing argument: --parsed_pileup_file (-pp)"; }
        unless(-f $parsed_pileup_file) { die "Parsed pileup file not a file $parsed_pileup_file"; }
    } else {
        if (!defined($parsed_pileup_file)) {
            if ($use_gencode) {
                getGencodeRefGenes($included_sites_vcf_file);
                return;
            } else {
                getRefGenes($included_sites_vcf_file);
                return;
            }
        } else {
            unless(-f $parsed_pileup_file) { die "Parsed pileup file not a file $parsed_pileup_file"; }
        }
    }
    
    my $slice_adaptor;
    eval {
        require Bio::EnsEMBL::Registry;
        print STDERR "Using EnsEMBL version: $ENSEMBL_VERSION\n";
        Bio::EnsEMBL::Registry->load_registry_from_db(  -host => $ENSEMBL_HOST,
                                                        -user => $ENSEMBL_USER,
                                                        -pass => $ENSEMBL_PASS,
                                                        -port => $ENSEMBL_PORT,
                                                        -db_version => $ENSEMBL_VERSION);
        $slice_adaptor = Bio::EnsEMBL::Registry->get_adaptor("human", "core", "Slice");
    }; if ($@) {
        warn $@;
        print STDERR "The EnsEMBL API is likely not installed, please follow the instructions here " .
        "http://www.ensembl.org/info/docs/api/api_cvs.html and install the core API for " .
        "the branch of EnsEMBL you are working with\nThis will then need to be added to your " .
        "PERL5LIB environment variable so that it is visible to this script.\nOtherwise, if this is " .
        "already installed, you may have a connection problem to the ensembldb.ensembl.org for the " .
        "version of the database you are interested in.  Edit the connection information in this script " .
        "to point to a new host, port, user and password or change the global variable for the ENSEMBL_VERSION " .
        "which is currently set to: $ENSEMBL_VERSION\n";
        return;
    }
    
    my $name = fileparse($parsed_pileup_file);
    
    my $use_only_defined_sites = 0;
    my $site_info_hashref = _load_site_filter($included_sites_vcf_file);
    if (defined($site_info_hashref)) { $use_only_defined_sites = 1; }
    
    my $site_count = 0;
    open(PARSED_PILEUP, $parsed_pileup_file) || die("Cannot open parsed pileup file");
    while (my $line = <PARSED_PILEUP>) {
        chomp $line;
        my @ts = split /\t/, $line;
        if ($use_only_defined_sites) {
            if (!defined($site_info_hashref->{$ts[3]}->{$ts[4]})) {
                next;
            }
        }
        my $rsid = $ts[2];
        my $chr = $ts[3];
        $chr =~ s/chr//;
        my $loc = $ts[4];
        my $printed = 0;
        #print STDERR $rsid . "\t" . $chr . "\t" . $loc . "\n";
        my $slice = $slice_adaptor->fetch_by_region('chromosome', $chr, $loc, $loc, 1);
        if (defined($slice)) {
            my @overlapping_exons = @{$slice->get_all_Exons};
            my %overlapping_exons_hash;
            foreach my $overlapping_exon (@overlapping_exons) {
                $overlapping_exons_hash{$overlapping_exon->stable_id} = 1;
            }
            my @overlapping_genes = @{$slice->get_all_Genes};
            foreach my $overlapping_gene (@overlapping_genes) {
                my @overlapping_transcripts = @{ $overlapping_gene->get_all_Transcripts };
                foreach my $overlapping_transcript (@overlapping_transcripts) {
                    my @exons = @{ $overlapping_transcript->get_all_Exons() };
                    foreach my $exon (@exons) {
                        if ($overlapping_exons_hash{$exon->stable_id}) {
                            ##overlap found
                            if (!$printed) {
                                print $chr . "\t" . $loc . "\t" . $rsid . "\t";
                                print $overlapping_gene->stable_id . ":" . $overlapping_transcript->stable_id . ":" . $exon->stable_id;
                                $printed = 1;
                            } else {
                                print ";" . $overlapping_gene->stable_id . ":" . $overlapping_transcript->stable_id . ":" . $exon->stable_id;
                            }
                        }
                    }
                }
            }
        } else {
            warn "Could not find gene data for genotype location $line\n";
        }
        if ($printed) {
            print "\n";
        }
        $site_count++;
    }
}

sub getRefGenes() {
    my $included_sites_vcf_file = shift;
    
    if (!defined($included_sites_vcf_file)) { die "missing argument: --included_sites_vcf_file (-is)"; }
    unless(-f $included_sites_vcf_file) { die "Included sites VCF file not a file $included_sites_vcf_file"; }
    
    my $slice_adaptor;
    eval {
        require Bio::EnsEMBL::Registry;
        print STDERR "Using EnsEMBL version: $ENSEMBL_VERSION\n";
        Bio::EnsEMBL::Registry->load_registry_from_db(  -host => $ENSEMBL_HOST,
                                                        -user => $ENSEMBL_USER,
                                                        -pass => $ENSEMBL_PASS,
                                                        -port => $ENSEMBL_PORT,
                                                        -db_version => $ENSEMBL_VERSION);
        $slice_adaptor = Bio::EnsEMBL::Registry->get_adaptor("human", "core", "Slice");
    }; if ($@) {
        warn $@;
        print STDERR "The EnsEMBL API is likely not installed, please follow the instructions here " .
        "http://www.ensembl.org/info/docs/api/api_cvs.html and install the core API for " .
        "the branch of EnsEMBL you are working with\nThis will then need to be added to your " .
        "PERL5LIB environment variable so that it is visible to this script.\nOtherwise, if this is " .
        "already installed, you may have a connection problem to the ensembldb.ensembl.org for the " .
        "version of the database you are interested in.  Edit the connection information in this script " .
        "to point to a new host, port, user and password or change the global variable for the ENSEMBL_VERSION " .
        "which is currently set to: $ENSEMBL_VERSION\n";
        return;
    }
    
    my $site_count = 0;
    open(INCLUDED_SITES, $included_sites_vcf_file) || die("Cannot open included sites VCF file");
    while (my $line = <INCLUDED_SITES>) {
        chomp $line;
        my @ts = split /\t/, $line;
        my $chr = $ts[0];
        my $loc = $ts[1];
        my $rsid = $ts[2];
        my $printed = 0;

        my $slice = $slice_adaptor->fetch_by_region('chromosome', $chr, $loc, $loc, 1);
        if (defined($slice)) {
            my @overlapping_exons = @{$slice->get_all_Exons};
            my %overlapping_exons_hash;
            foreach my $overlapping_exon (@overlapping_exons) {
                $overlapping_exons_hash{$overlapping_exon->stable_id} = 1;
            }
            my @overlapping_genes = @{$slice->get_all_Genes};
            foreach my $overlapping_gene (@overlapping_genes) {
                my @overlapping_transcripts = @{ $overlapping_gene->get_all_Transcripts };
                foreach my $overlapping_transcript (@overlapping_transcripts) {
                    my @exons = @{ $overlapping_transcript->get_all_Exons() };
                    foreach my $exon (@exons) {
                        if ($overlapping_exons_hash{$exon->stable_id}) {
                            ##overlap found
                            if (!$printed) {
                                print $chr . "\t" . $loc . "\t" . $rsid . "\t";
                                print $overlapping_gene->stable_id . ":" . $overlapping_transcript->stable_id . ":" . $exon->stable_id;
                                $printed = 1;
                            } else {
                                print ";" . $overlapping_gene->stable_id . ":" . $overlapping_transcript->stable_id . ":" . $exon->stable_id;
                            }
                        }
                    }
                }
            }
        } else {
            warn "Could not find gene data for genotype location $line\n";
        }
        if ($printed) {
            print "\n";
        }
        $site_count++;
    }
}


sub getGencodeRefGenes() {
    my $included_sites_vcf_file = shift;
    if (!defined($included_sites_vcf_file)) { die "missing argument: --included_sites_vcf_file (-is)"; }
    unless(-f $included_sites_vcf_file) { die "Included sites VCF file not a file $included_sites_vcf_file"; }
    
    my $gencode_data_file = "/lustre/nobackup/WUR/ABGC/schac001/RNAseq/kyle_results/TJT/tophat_allelic/genecode_Sus_Scrofa.all.gtf";
    if (!defined($gencode_data_file)) { die "missing data file for gencode annotation: $gencode_data_file";}
    unless (-f $gencode_data_file) { die "Gencode data file is not a file for: $gencode_data_file"; }
    my %gencode_exon_lookup;
    my $index = 1000000;
    open(GENCODE, $gencode_data_file) || die "Cannot open gencode data file: $gencode_data_file";
    while (my $line = <GENCODE>) {
        chomp $line;
        my @ts = split /\t/, $line;
        if ($ts[2] eq "exon") {
            my $gene_type;
            my $gene_id;
            my $gene_name;
            my $transcript_id;
            if ($ts[8] =~ /[\s]*gene_id[\s]+[\S]{1}([\S]+)[\S]{1};[\s]+transcript_id[\s]+[\S]{1}([\S]+)[\S]{1};[\s]+gene_type[\s]+[\S]{1}([\S]+)[\S]{1};[\s]+[\S\s]+gene_name[\s]+[\S]{1}([\S]+)[\S]{1};[\s]+transcript_type[\s\S]+/g) {
                $gene_id = $1;
                $transcript_id = $2;
                $gene_type = $3;
                $gene_name = $4;
            }
            if (!defined($gene_type)) {
                close(GENCODE);
                die("$line is missing critical data gene_type");
            } elsif ($gene_type eq "protein_coding") {
                if (!defined($gene_id) || !defined($gene_name) || ! defined($transcript_id)) {
                    close(GENCODE);
                    die("$line is missing critical data gene_id, transcript_id or gene_name");
                }
                my $start_index = int($ts[3] / $index);
                my $end_index = int($ts[4] / $index);
                my %exon_object = ('s' => $ts[3],
                                  'e' => $ts[4],
                                  'i' => $gene_id . ":" . $transcript_id . ":exon_" . $ts[3] . "_" . $ts[4] . ":" . $gene_name);
                my $chr = $ts[0];
                $chr =~ s/chr//;
                for(my $i = $start_index; $i <= $end_index; $i++) {
                    push @{$gencode_exon_lookup{$chr}{$i}}, \%exon_object;
                }
            }
        }
    }
    print STDERR "Loaded gencode data\n";
    close(GENCODE);
    
    my $site_count = 0;
    open(INCLUDED_SITES, $included_sites_vcf_file) || die("Cannot open included sites VCF file");
    while (my $line = <INCLUDED_SITES>) {
        chomp $line;
        my @ts = split /\t/, $line;
        my $chr = $ts[0];
        $chr =~ s/chr//;
        my $loc = $ts[1];
        my $rsid = $ts[2];
        my $printed = 0;

        my @overlapping_exons;
        my $loc_index = int($loc / $index);
        if (!defined($gencode_exon_lookup{$chr}{$loc_index})) {
            next;
        }
        my @exons_to_search_for_overlap = @{$gencode_exon_lookup{$chr}{$loc_index}};
        foreach my $exon_to_search_for_overlap (@exons_to_search_for_overlap) {
            if ($exon_to_search_for_overlap->{'s'} <= $loc && $exon_to_search_for_overlap->{'e'} >= $loc) {
                if (!$printed) {
                    print $chr . "\t" . $loc . "\t" . $rsid . "\t";
                    print $exon_to_search_for_overlap->{'i'};
                    $printed = 1;
                } else {
                    print ";" . $exon_to_search_for_overlap->{'i'};
                }
            }
        }
        if ($printed) {
            print "\n";
        }
        $site_count++;
    }
}

sub getGeneSNPCoverage() {
    my $parsed_pileup_file = shift;
    my $gene_quantification_file = shift;
    my $gene_snp_mapping_file = shift;
    my $included_sites_vcf_file = shift;
    my $minimum_number_of_reads_at_site = shift;
    my $filter_base_quality = shift;
    
    if (!defined($parsed_pileup_file)) { die "missing argument: --parsed_pileup_file (-pp)"; }
    unless(-f $parsed_pileup_file) { die "Parsed pileup file not a file $parsed_pileup_file"; }
    my $name = fileparse($parsed_pileup_file);
    
    if (!defined($gene_quantification_file)) { die "missing argument: --gene_quantification_file (-gq)"; }
    unless(-f $gene_quantification_file) { die "Gene quantification file not a file $gene_quantification_file"; }
    
    if (!defined($gene_snp_mapping_file)) { die "missing argument: --gene_snp_mapping_file (-gf)"; }
    unless(-f $gene_snp_mapping_file) { die "Gene SNP mapping file not a file $gene_snp_mapping_file"; }
    
    my $use_only_defined_sites = 0;
    my $site_info_hashref = _load_site_filter($included_sites_vcf_file);
    if (defined($site_info_hashref)) { $use_only_defined_sites = 1; }
    
    my %snp_gene_mapping;
    my %gene_snp_mapping;
    open(SNP_GENE_FILE, $gene_snp_mapping_file) || die("Cannot open Gene SNP mapping file arg -gf");
    while (my $line = <SNP_GENE_FILE>) {
        chomp $line;
        my @ts = split /\t/, $line;
        my $chr = $ts[0];
        my $loc = $ts[1];
        if ($use_only_defined_sites) { ##Only care about mappings for SNPs which we are using
            if (!defined($site_info_hashref->{$chr}->{$loc})) {
                next;
            }
        }
        my @gts = split /;/, $ts[3];
        foreach my $gt (@gts) {
            my @mts = split /:/, $gt;
            $snp_gene_mapping{$chr}{$loc} = $mts[0];
            $gene_snp_mapping{$mts[0]}{$chr}{$loc} = 1;
        }
    }
    close(SNP_GENE_FILE);
    
    my %gene_quantifications;
    my $min_quantification = 0;
    my $max_quantification = log(4000);
    open(GENE_QUANTIFICATION, $gene_quantification_file) || die ("Cannot open Gene quantification file arg -gq");
    while (my $line = <GENE_QUANTIFICATION>) {
        chomp $line;
        my @ts = split /\t/, $line;
        if ($ts[1] != 0) {
            $gene_quantifications{$ts[0]} = log($ts[1]);
        } else {
            $gene_quantifications{$ts[0]} = 0;
        }
       # if (!defined($min_quantification)) { $min_quantification = $ts[1]; $max_quantification = $ts[1]; }
       # if ($ts[1] > $max_quantification) { $max_quantification = $ts[1]; }
       # if ($ts[1] < $min_quantification) { $min_quantification = $ts[1]; }
    }
    close(GENE_QUANTIFICATION);
    
    ##Process sites and determine which genes have ASE quantifiable
    open(PARSED_PILEUP, $parsed_pileup_file) || die("Cannot open parsed pileup file");
    my %genes_with_ase_quantifiable;
    while (my $line = <PARSED_PILEUP>) {
        chomp $line;
        my @ts = split /\t/, $line;
        my $chr = $ts[3];
        my $loc = $ts[4];
        if ($use_only_defined_sites) {
            if (!defined($site_info_hashref->{$chr}->{$loc})) {
                next;
            }
        }
        if ($ts[5] < $minimum_number_of_reads_at_site) { ##Skipping because not enough reads exist
            next;
        }
        my @alleles = split /:/, $ts[7];
        my $passing_base_quality = 0;
        foreach my $allele (@alleles) {
            my @allele_ts = split /_/, $allele;
            if ($allele_ts[2] >= $filter_base_quality) {
                $passing_base_quality++;
            }
        }
        if ($passing_base_quality < $minimum_number_of_reads_at_site) {  ##Skipping because not enough reads meet desired base quality
            next;
        }
        if (defined($snp_gene_mapping{$chr}{$loc})) {  ##SNP is mapped to a gene
            $genes_with_ase_quantifiable{$snp_gene_mapping{$chr}{$loc}} = 1;
        }
    }
    close(PARSED_PILEUP);
    
    my ($mfh1, $mfilename1) = tempfile( "samasetmpXXXXXXX",
                                        CLEANUP => 1);
    open(OUT, ">" . $mfilename1) || die("Cannot open tmp file $mfilename1");
    
    my %bin_data;
    my $bin_count = 20;
    my $unit = ($max_quantification - $min_quantification) / $bin_count;
    my @valid_genes = keys %gene_snp_mapping;
    for (my $i = 0; $i < $bin_count; $i++) {
        my $threshold = $min_quantification + ($i * $unit);
        $bin_data{$i}{'threshold'} = $threshold;
        $bin_data{$i}{'total'} = 0;
        $bin_data{$i}{'ase_quantifiable'} = 0;
        foreach my $gene (@valid_genes) {
            if ($gene_quantifications{$gene} >= $threshold) {
                $bin_data{$i}{'total'} = $bin_data{$i}{'total'} + 1;
                if (defined($genes_with_ase_quantifiable{$gene})) {
                    $bin_data{$i}{'ase_quantifiable'} = $bin_data{$i}{'ase_quantifiable'} + 1;
                }
            }
        }
        if ($bin_data{$i}{'total'} != 0) {
            my $perc = $bin_data{$i}{'ase_quantifiable'} / $bin_data{$i}{'total'};
            print OUT $i . "\t";
            print OUT int(exp($bin_data{$i}{'threshold'}));
            print OUT "\t" . $bin_data{$i}{'total'} . "\t" . $bin_data{$i}{'ase_quantifiable'} . "\t" . $perc . "\n";
        } else {
            print OUT $i . "\t" . int(exp($bin_data{$i}{'threshold'})) . "\t0\t" .  $bin_data{$i}{'ase_quantifiable'} . "\t0\n";
        }
    }
    close(OUT);
    
    my $postscript_output_filename = "plot_snp_gene_coverage.$name.bq_" . $filter_base_quality;
    my ($rfh1, $Rfilename1) = tempfile( "samaseRtmpXXXXXXX",
                                        CLEANUP => 1);
    open(RFH1, ">" . $Rfilename1) || die("Cannot open R file");
    print RFH1 "foo<-read.table(\"$mfilename1\", header=F)\n";
    print RFH1 "postscript(file=\"$postscript_output_filename.ps\", onefile=T, width=600, height=400)\n";
    print RFH1 "barplot(foo\$V5, names.arg=foo\$V2, ylim=c(0,1),";
    print RFH1 " xlab=\"RPKM\", ylab=\"Percentage of genes with ASE quantifiable\", ";
    print RFH1 " sub=\"Minimum number of reads at site = $minimum_number_of_reads_at_site Base quality filter = $filter_base_quality\",\n";
    print RFH1 " main=\"Percentage of expressed genes with coding SNPs that are quantifiable for ASE\")\n";
    print RFH1 "dev.off()\n";
    close(RFH1);
    `$REXE --no-save < $Rfilename1`;
    `ps2pdf $postscript_output_filename.ps`;
    `rm $postscript_output_filename.ps`;
    print STDERR "Plot created as " . $postscript_output_filename . ".pdf\n";
    unlink0($mfh1, $mfilename1);
    unlink0($rfh1, $Rfilename1);

}

sub calculateASE() {
    my $parsed_pileup_file = shift;
    my $ase_ref_to_nonreference_ratio = shift;
    my $minimum_reads_at_site = shift;
    my $mapping_quality_threshold = shift;
    my $filter_base_quality = shift;
    my $included_sites_vcf_file = shift;
    my $gene_snp_mapping_file = shift;
    
    if (!defined($parsed_pileup_file)) { die "missing argument: --parsed_pileup_file (-pp)"; }
    unless(-f $parsed_pileup_file) { die "Parsed pileup file not a file $parsed_pileup_file"; }
    my $name = fileparse($parsed_pileup_file);
    
    my $adaptive_filter_mode = 0;
    ##Adaptive filter mode uses the ref to non ref ratio for the 
    my %adaptive_mapping_ref_to_nonref_ratio;
    if (-f $ase_ref_to_nonreference_ratio) {
        $adaptive_filter_mode = 1;
        open(ADAPTIVE_REF_TO_NONREF, $ase_ref_to_nonreference_ratio) || die("Cannot open ase ref to nonref mapping ratio file");
        my $header_ar2nr = <ADAPTIVE_REF_TO_NONREF>;
        while (my $line = <ADAPTIVE_REF_TO_NONREF>) {
            chomp $line;
            my @ts = split /\t/, $line;
            $adaptive_mapping_ref_to_nonref_ratio{$ts[0]} = $ts[3];
        }
        close(ADAPTIVE_REF_TO_NONREF);
    }
    
    my $use_only_defined_sites = 0;
    my $site_info_hashref = _load_site_filter($included_sites_vcf_file);
    if (defined($site_info_hashref)) { $use_only_defined_sites = 1; }
    
    my $use_gene_information = 0;
    my %gene_info;
    if (defined($gene_snp_mapping_file)) {
        print STDERR $gene_snp_mapping_file . "\n";
        unless(-f $gene_snp_mapping_file) { die "Gene SNP mapping file not a file $gene_snp_mapping_file"; }
        open (GENES, $gene_snp_mapping_file) || die("Cannot open included gene SNP mapping file");
        while (my $line = <GENES>) {
            chomp $line;
            my @ts = split /\t/, $line;
            $gene_info{$ts[0]}{$ts[1]} = $ts[3];
        }
        close(GENES);
        $use_gene_information = 1;   
    }
    
    my ($mfh1, $mfilename1) = tempfile( "samasetmpXXXXXXX",
                                         CLEANUP => 1);
    open(OUT, ">" . $mfilename1) || die("Cannot open tmp file $mfilename1");
    my $site_count = 0;
    my %seen_allele_info;
    my %ref_allele_info;
    my %nonref_allele_lookup;
    open(PARSED_PILEUP, $parsed_pileup_file) || die("Cannot open parsed pileup file");
    while (my $line = <PARSED_PILEUP>) {
        chomp $line;
        my @ts = split /\t/, $line;
        my $rsid = $ts[2];
        my $chr = $ts[3];
        my $loc = $ts[4];
        if ($use_only_defined_sites) {
            if (!defined($site_info_hashref->{$chr}->{$loc})) {
                next;
            }
        }
        if ($ts[5] < $minimum_reads_at_site) {
            next;
        }
        my @ref_allele = split /_/, $ts[8];
        $ref_allele_info{$chr}{$loc} = $ref_allele[0];
        my @alleles = split /:/, $ts[7];
        my $ref_allele_count = 0;
        my $nonref_allele_count = 0;
        my %non_ref_allele_counts;
        my $minimum_mapping_quality = undef;
        foreach my $allele (@alleles) {  ##Reading allele string
            my @a_ts = split /_/, $allele;
            if ($a_ts[2] >=  $filter_base_quality) {
                if ($a_ts[1] >= $mapping_quality_threshold) {
                    if (!defined($minimum_mapping_quality)) {
                        $minimum_mapping_quality = $a_ts[1];
                    } elsif ($minimum_mapping_quality > $a_ts[1]) {
                        $minimum_mapping_quality = $a_ts[1];
                    }
                    
                    $seen_allele_info{$chr}{$loc}{$a_ts[0]} = 1;
                    if ($a_ts[0] eq $ref_allele[0]) {
                        $ref_allele_count++;
                    } else {
                        if (!defined($non_ref_allele_counts{$a_ts[0]})) {
                            $non_ref_allele_counts{$a_ts[0]} = 0;
                        }
                        $non_ref_allele_counts{$a_ts[0]} = $non_ref_allele_counts{$a_ts[0]} + 1;
                    }
                }
            }
        }
        if (scalar(keys %non_ref_allele_counts) > 0) { ##Only most abundant non-reference allele is used here
            my @nonref_most_abundant = sort {$non_ref_allele_counts{$b} <=> $non_ref_allele_counts{$a}} keys %non_ref_allele_counts;
            $nonref_allele_count = $non_ref_allele_counts{$nonref_most_abundant[0]};
            $nonref_allele_lookup{$chr}{$loc} = $nonref_most_abundant[0];
        }
        
        my $total = $ref_allele_count + $nonref_allele_count;
        if ($total < $minimum_reads_at_site) {
            next;
        }
        $site_count++;
        my $ase_ref_to_nonref_ratio_to_use = $ase_ref_to_nonreference_ratio;
        if ($adaptive_filter_mode) {
            if (defined($minimum_mapping_quality)) {
                my $ase_ref_to_nonref_ratio_lookup = int($minimum_mapping_quality / 10) * 10;
                $ase_ref_to_nonref_ratio_to_use = $adaptive_mapping_ref_to_nonref_ratio{$ase_ref_to_nonref_ratio_lookup};
                if (!defined($ase_ref_to_nonref_ratio_to_use)) {
                    print STDERR "Could not find an adaptive ref to non-reference ratio for: " . $ase_ref_to_nonref_ratio_lookup . "\n";
                    $ase_ref_to_nonref_ratio_to_use = 0.5;
                }
            } else {
                print STDERR "Could not find a minimum mapping quality for line: $line\n";
                next;
            }
        }
        print OUT $rsid . "\t" . $chr . "\t" . $loc . "\t" . $ref_allele_count . "\t" . $total . "\t" . $ase_ref_to_nonref_ratio_to_use . "\n";
    }
    close(OUT);
    
    my ($rfh1, $Rfilename1) = tempfile( "samaseRtmpXXXXXXX",
                                        CLEANUP => 1);
    my ($mfh2, $mfilename2) = tempfile( "samasetmpXXXXXXX",
                                         CLEANUP => 1);
    open(RFH1, ">" . $Rfilename1) || die("Cannot open R file");
    print RFH1 "ase<-read.table(\"$mfilename1\", header=F)\n";
    print RFH1 "binpv<-array()\n";
    print RFH1 "for(i in 1:nrow(ase)) {\n";
    print RFH1 "binpv[i]<-binom.test(ase[i,4],ase[i,5],ase[i,6], alternative = c(\"two.sided\"))\$p.value\n";
    print RFH1 "}\n";
    print RFH1 "ase2<-data.frame(ase, binpv)\n";
    print RFH1 "write.table(ase2, quote=FALSE, sep = \"\\t\", eol=\"\\n\", row.names=F, file=\"$mfilename2\")\n";
    close(RFH1);
    
    `$REXE --no-save < $Rfilename1`;
    open(ROUT, $mfilename2) || die("Cannot open ASE results");
    my $header = <ROUT>;
    print "INDIVIDUAL\tRSID\tCHR\tPOS\t";
    print "ALLELES\tBOTH_ALLELES_SEEN\t";
    print "REF_COUNT\tNONREF_COUNT\tTOTAL_COUNT\t";
    print "WEIGHTED_REF_COUNT\tWEIGHTED_NONREF_COUNT\tWRC_MINUS_WNC\t";
    print "ALLELES_SEEN\tREF_ALLELE\tALT_ALLELE\tMAQ_FILTER\tREF_RATIO\tPVALUE\tEXON_INFO\n";
    while (my $line = <ROUT>) {
        chomp $line;
        my @ts = split /\t/, $line;
        my $rsid = $ts[0];
        my $chr = $ts[1];
        my $loc = $ts[2];
        print $name . "\t" . $rsid . "\t" . $chr . "\t" . $loc . "\t";
        
        my $parsed_reference_allele = $ref_allele_info{$chr}{$loc};
        my @ref_alleles = split /\//, $site_info_hashref->{$chr}->{$loc}->{'alleles'};  ##These are the known alleles from the VCF file!
        my $seen_both_alleles = 0;
        if ($ref_alleles[0] ne $parsed_reference_allele &&
            $ref_alleles[1] ne $parsed_reference_allele) {  ##If we haven't seen both known alleles try reverse complementing
            for (my $i = 0; $i < scalar(@ref_alleles); $i++) {
                if ($ref_alleles[$i] eq "A") {$ref_alleles[$i] = "T"; }
                elsif ($ref_alleles[$i] eq "C") {$ref_alleles[$i] = "G"; }
                elsif ($ref_alleles[$i] eq "G") {$ref_alleles[$i] = "C"; }
                elsif ($ref_alleles[$i] eq "T") {$ref_alleles[$i] = "A"; }
            }
        }
        if ($seen_allele_info{$chr}{$loc}{$ref_alleles[0]} && $seen_allele_info{$chr}{$loc}{$ref_alleles[1]}) {
            $seen_both_alleles = 1;
        }
        print $site_info_hashref->{$chr}->{$loc}->{'alleles'} . "\t" . $seen_both_alleles . "\t";
        
        my $non_ref_count = $ts[4] - $ts[3];
        print $ts[3] . "\t" . $non_ref_count . "\t" . $ts[4] . "\t";
        
        my $ref_weight = 1 - $ts[5];
        my $nonref_weight = $ts[5];
        my $wrc = $ref_weight * $ts[3];
        my $wnc = $nonref_weight * $non_ref_count;
        my $wrc_wnc = $wrc - $wnc;
        print $wrc . "\t" . $wnc . "\t" . $wrc_wnc . "\t";
        
        my $alleles_seen_hashref = $seen_allele_info{$chr}{$loc};
        my $printed = 0;
        foreach my $seen_allele (keys %$alleles_seen_hashref) {
            if (!$printed) {
                print $seen_allele;
                $printed = 1;
            } else {
                print ":" . $seen_allele;
            }
        }
        print "\t" . $ref_allele_info{$chr}{$loc} . "\t";
        #$printed = 0;
        #foreach my $seen_allele (keys %$alleles_seen_hashref) {
        #    if ($seen_allele ne $ref_allele_info{$chr}{$loc}) {
        #        if (!$printed) {
        #            print $seen_allele;
        #            $printed = 1;
        #        } else {
        #            print ":" . $seen_allele;
        #        }
        #    }
        #}
        print $nonref_allele_lookup{$chr}{$loc};
        print "\t" . $mapping_quality_threshold . "\t" . $ts[5] . "\t" . $ts[6] . "\t" . $gene_info{$chr}{$loc} . "\n";
    }
    close(ROUT);
    
    unlink0($mfh1, $mfilename1);
    unlink0($mfh2, $mfilename2);
    unlink0($rfh1, $Rfilename1);
}

sub calculateAseFromPloidyGenotypes() {
    my $parsed_pileup_file = shift;
    my $ase_ref_to_nonreference_ratio = shift;
    my $ploidy_allele_file = shift; ##Need to know genotyped alleles to see if there is ASE
    my $minimum_reads_at_site = shift;
    my $mapping_quality_threshold = shift;
    my $filter_base_quality = shift;
    my $included_sites_vcf_file = shift;
    my $gene_snp_mapping_file = shift;
    
    if (!defined($parsed_pileup_file)) { die "missing argument: --parsed_pileup_file (-pp)"; }
    unless(-f $parsed_pileup_file) { die "Parsed pileup file not a file $parsed_pileup_file"; }
    my $name = fileparse($parsed_pileup_file);
    if (!defined($ploidy_allele_file)) { die "missing argument: --ploidy_allele_file (-pa)"; }
    unless(-f $ploidy_allele_file) { die "Ploidy allele file not a file $ploidy_allele_file"; }
     
    my $use_only_defined_sites = 0;
    my $site_info_hashref = _load_site_filter($included_sites_vcf_file);
    if (defined($site_info_hashref)) { $use_only_defined_sites = 1; }
    
    my %allele_info;
    open(PLOIDY_ALLELE_FILE, $ploidy_allele_file) || die("Cannot open ploidy allele file");
    while (my $line = <PLOIDY_ALLELE_FILE>) {
        chomp $line;
        my @ts = split /\t/, $line;
        
        my $is_het = 0;  ##Can only calculate ASE for heterozygous sites
        my @palleles = split //, $ts[4];
        for(my $i = 0; $i < scalar(@palleles); $i++) {
            for (my $j = 0; $j < scalar(@palleles); $j++) {
                if ($palleles[$i] ne $palleles[$j]) {
                    $is_het = 1; 
                }
            }
        }
        if ($is_het) {
            $allele_info{$ts[1]}{$ts[2]}{'a'} = $ts[4];
            $allele_info{$ts[1]}{$ts[2]}{'rs'} = $ts[0];
        }
    }
    close(PLOIDY_ALLELE_FILE);
    
    my $use_gene_information = 0;
    my %gene_info;
    if (defined($gene_snp_mapping_file)) {
        print STDERR $gene_snp_mapping_file . "\n";
        unless(-f $gene_snp_mapping_file) { die "Gene SNP mapping file not a file $gene_snp_mapping_file"; }
        open (GENES, $gene_snp_mapping_file) || die("Cannot open included gene SNP mapping file");
        while (my $line = <GENES>) {
            chomp $line;
            my @ts = split /\t/, $line;
            $gene_info{$ts[0]}{$ts[1]} = $ts[3];
        }
        close(GENES);
        $use_gene_information = 1;   
    }
    
    ##to complete
    
    my ($mfh1, $mfilename1) = tempfile( "samasetmpXXXXXXX",
                                         CLEANUP => 1);
    open(OUT, ">" . $mfilename1) || die("Cannot open tmp file $mfilename1");
    my $site_count = 0;
    my %seen_allele_info;
    my %ref_allele_info;
    my %nonref_allele_lookup;
    open(PARSED_PILEUP, $parsed_pileup_file) || die("Cannot open parsed pileup file");
    while (my $line = <PARSED_PILEUP>) {
        chomp $line;
        my @ts = split /\t/, $line;
        my $rsid = $ts[2];
        my $chr = $ts[3];
        my $loc = $ts[4];
        if ($use_only_defined_sites) {
            if (!defined($site_info_hashref->{$chr}->{$loc})) {
                next;
            }
        }
        if ($ts[5] < $minimum_reads_at_site) {
            next;
        }
        my @ref_allele = split /_/, $ts[8];
        $ref_allele_info{$chr}{$loc} = $ref_allele[0];
        my @alleles = split /:/, $ts[7];
        my $ref_allele_count = 0;
        my $nonref_allele_count = 0;
        my %non_ref_allele_counts;
        foreach my $allele (@alleles) {  ##Reading allele string
            my @a_ts = split /_/, $allele;
            if ($a_ts[2] >=  $filter_base_quality) {
                if ($a_ts[1] >= $mapping_quality_threshold) {
                    $seen_allele_info{$chr}{$loc}{$a_ts[0]} = 1;
                    if ($a_ts[0] eq $ref_allele[0]) {
                        $ref_allele_count++;
                    } else {
                        if (!defined($non_ref_allele_counts{$a_ts[0]})) {
                            $non_ref_allele_counts{$a_ts[0]} = 0;
                        }
                        $non_ref_allele_counts{$a_ts[0]} = $non_ref_allele_counts{$a_ts[0]} + 1;
                    }
                }
            }
        }
        my $non_ref_allele = "";
        if (scalar(keys %non_ref_allele_counts) > 0) { ##Only most abundant non-reference allele is used here
            my @nonref_most_abundant = sort {$non_ref_allele_counts{$b} <=> $non_ref_allele_counts{$a}} keys %non_ref_allele_counts;
            $non_ref_allele = $nonref_most_abundant[0];
            $nonref_allele_count = $non_ref_allele_counts{$non_ref_allele};
        }
        $nonref_allele_lookup{$chr}{$loc} = $non_ref_allele;
        
        my $total = $ref_allele_count + $nonref_allele_count;
        if ($total < $minimum_reads_at_site) {
            next;
        }
        $site_count++;
        
        ##Determine probability given genotype, if non available create two lines for both alternatives (this is for trisomy)
        my $prob_to_use;
        if (defined($allele_info{$chr}{$loc})) {
            my @palleles = split //, $allele_info{$chr}{$loc}{'a'};
            my $pref_count = 0;
            my $pnonref_count = 0;
            foreach my $pallele (@palleles) {
                if ($pallele eq $ref_allele[0]) {
                    $pref_count++;
                } elsif ($pallele eq $non_ref_allele) {
                    $pnonref_count++;
                } else {
                    #close(OUT);
                    warn("Cannot find nonreference allele for $rsid for $pallele given nonref allele: " . $non_ref_allele . " and ref allele " . $ref_allele[0] );
                    next;
                }
            }
            ##check it adds to 3
            if (($pnonref_count + $pref_count) != 3) {
                #close(OUT);
                warn("Cannot find three alleles for $rsid " . $allele_info{$chr}{$loc}{'a'});
                next;
            }
            my $prob_to_use = (($pref_count * $ase_ref_to_nonreference_ratio)) / 1.5;
            print OUT $rsid . "\t" . $chr . "\t" . $loc . "\t" . $ref_allele_count . "\t" . $total . "\t" . $prob_to_use . "\t" . $allele_info{$chr}{$loc}{'a'} . "\n";
        } else {
            ##Test both allternative hypotheses
            my $prob_to_use1 = ((1 * $ase_ref_to_nonreference_ratio)) / 1.5;
            print OUT $rsid . "\t" . $chr . "\t" . $loc . "\t" . $ref_allele_count . "\t" . $total . "\t" . $prob_to_use1 . "\t" . "UNKNOWN" . "\n";
            my $prob_to_use2 = ((2 * $ase_ref_to_nonreference_ratio)) / 1.5;   
            print OUT $rsid . "\t" . $chr . "\t" . $loc . "\t" . $ref_allele_count . "\t" . $total . "\t" . $prob_to_use2 . "\t" . "UNKNOWN" . "\n";
        }
    }
    close(OUT);
    
    ##Now process calculations
    my ($rfh1, $Rfilename1) = tempfile( "samaseRtmpXXXXXXX",
                                        CLEANUP => 1);
    my ($mfh2, $mfilename2) = tempfile( "samasetmpXXXXXXX",
                                         CLEANUP => 1);
    open(RFH1, ">" . $Rfilename1) || die("Cannot open R file");
    print RFH1 "ase<-read.table(\"$mfilename1\", header=F)\n";
    print RFH1 "binpv<-array()\n";
    print RFH1 "for(i in 1:nrow(ase)) {\n";
    print RFH1 "binpv[i]<-binom.test(ase[i,4],ase[i,5],ase[i,6], alternative = c(\"two.sided\"))\$p.value\n";
    print RFH1 "}\n";
    print RFH1 "ase2<-data.frame(ase, binpv)\n";
    print RFH1 "write.table(ase2, quote=FALSE, sep = \"\\t\", eol=\"\\n\", row.names=F, file=\"$mfilename2\")\n";
    close(RFH1);
    
    `$REXE --no-save < $Rfilename1`;
    open(ROUT, $mfilename2) || die("Cannot open ASE results");
    my $header = <ROUT>;
    print "INDIVIDUAL\tRSID\tCHR\tPOS\t";
    print "ALLELES\tBOTH_ALLELES_SEEN\t";
    print "REF_COUNT\tNONREF_COUNT\tTOTAL_COUNT\t";
    print "WEIGHTED_REF_COUNT\tWEIGHTED_NONREF_COUNT\tWRC_MINUS_WNC\t";
    print "ALLELES_SEEN\tREF_ALLELE\tALT_ALLELE\tMAQ_FILTER\tREF_RATIO\tPVALUE\tEXON_INFO\tPLOIDY_GENOTYPE\n";
    while (my $line = <ROUT>) {
        chomp $line;
        my @ts = split /\t/, $line;
        my $rsid = $ts[0];
        my $chr = $ts[1];
        my $loc = $ts[2];
        print $name . "\t" . $rsid . "\t" . $chr . "\t" . $loc . "\t";
        
        my $parsed_reference_allele = $ref_allele_info{$chr}{$loc};
        my @ref_alleles = split /\//, $site_info_hashref->{$chr}->{$loc}->{'alleles'};  ##These are the known alleles from the VCF file!
        my $seen_both_alleles = 0;
        if ($ref_alleles[0] ne $parsed_reference_allele &&
            $ref_alleles[1] ne $parsed_reference_allele) {  ##If we haven't seen both known alleles try reverse complementing
            for (my $i = 0; $i < scalar(@ref_alleles); $i++) {
                if ($ref_alleles[$i] eq "A") {$ref_alleles[$i] = "T"; }
                elsif ($ref_alleles[$i] eq "C") {$ref_alleles[$i] = "G"; }
                elsif ($ref_alleles[$i] eq "G") {$ref_alleles[$i] = "C"; }
                elsif ($ref_alleles[$i] eq "T") {$ref_alleles[$i] = "A"; }
            }
        }
        if ($seen_allele_info{$chr}{$loc}{$ref_alleles[0]} && $seen_allele_info{$chr}{$loc}{$ref_alleles[1]}) {
            $seen_both_alleles = 1;
        }
        print $site_info_hashref->{$chr}->{$loc}->{'alleles'} . "\t" . $seen_both_alleles . "\t";
        
        my $non_ref_count = $ts[4] - $ts[3];
        print $ts[3] . "\t" . $non_ref_count . "\t" . $ts[4] . "\t";
        
        my $ref_weight = 1 - $ase_ref_to_nonreference_ratio;
        my $nonref_weight = $ase_ref_to_nonreference_ratio;
        my $wrc = $ref_weight * $ts[3];
        my $wnc = $nonref_weight * $non_ref_count;
        my $wrc_wnc = $wrc - $wnc;
        print $wrc . "\t" . $wnc . "\t" . $wrc_wnc . "\t";
        
        my $alleles_seen_hashref = $seen_allele_info{$chr}{$loc};
        my $printed = 0;
        foreach my $seen_allele (keys %$alleles_seen_hashref) {
            if (!$printed) {
                print $seen_allele;
                $printed = 1;
            } else {
                print ":" . $seen_allele;
            }
        }
        print "\t" . $ref_allele_info{$chr}{$loc} . "\t";
        $printed = 0;
        print $nonref_allele_lookup{$chr}{$loc};
        #foreach my $seen_allele (keys %$alleles_seen_hashref) {
        #    if ($seen_allele ne $ref_allele_info{$chr}{$loc}) {
        #        if (!$printed) {
        #            print $seen_allele;
        #            $printed = 1;
        #        } else {
        #            print ":" . $seen_allele;
        #        }
        #    }
        #}
        print "\t" . $mapping_quality_threshold . "\t" . $ase_ref_to_nonreference_ratio . "\t" . $ts[7] . "\t" . $gene_info{$chr}{$loc} . "\t" . $ts[6] . "\n";
    }
    close(ROUT);
    
    unlink0($mfh1, $mfilename1);
    unlink0($mfh2, $mfilename2);
    unlink0($rfh1, $Rfilename1);
}

sub calculateAseBetweenTreatments() {
    my $parsed_pileup_file1 = shift;
    my $parsed_pileup_file2 = shift;
    my $included_sites_vcf_file = shift;
    my $minimum_reads_at_site1 = shift;
    my $minimum_reads_at_site2 = shift;
    my $mapping_quality_threshold = shift;
    my $filter_base_quality = shift;
    my $gene_snp_mapping_file  = shift;
 
    if (!defined($parsed_pileup_file1)) { die "No parsed pileup file defined for arg --parsed_pileup1 or -pp1"; }
    unless(-f $parsed_pileup_file1) { die "Parsed pileup file: $parsed_pileup_file1  is not a file for arg --parsed_pileup1 or -pp1"; }
    if (!defined($parsed_pileup_file2)) { die "No parsed pileup file defined for arg --parsed_pileup2 or -pp2"; }
    unless(-f $parsed_pileup_file2) { die "Parsed pileup file: $parsed_pileup_file2  is not a file for arg --parsed_pileup2 or -pp2"; }
 
    my $use_only_defined_sites = 0;
    my $site_info_hashref = _load_site_filter($included_sites_vcf_file);
    if (defined($site_info_hashref)) { $use_only_defined_sites = 1; }
    
    my $gene_snp_mapping_info_hashref = _load_gene_snp_mapping($gene_snp_mapping_file);
 
    ##1. Determine biallelic positions to test, this is done using both files because we could have valid test positions
    ## which are A:0 B:40 and B:0 A:40 which would be ignored by just a regular single file biallelic filter
    my %POSITION_INFO;
    open(PARSED_PILEUP_1, $parsed_pileup_file1) || die "Cannot open parsed pileup file 1";
    while (my $line = <PARSED_PILEUP_1>) {
        chomp $line;
        my @ts = split /\t/, $line;
        unless ($ts[0] =~ /[0-9]+/g) { next; }
        if ($use_only_defined_sites) {
            if (!defined($site_info_hashref->{$ts[3]}->{$ts[4]})) {
                next;
            }
        }
        for(my $i = 8; $i < scalar(@ts); $i++) {
            my @gts = split /_/, $ts[$i];
            ##Loads all positions with location then allele, then counts
            $POSITION_INFO{$ts[3] . "_" . $ts[4]}{$gts[0]} = $gts[1]; 
        }
    }
    close(PARSED_PILEUP_1);
    my %BIALLELIC_POSITIONS;
    open(PARSED_PILEUP_2, $parsed_pileup_file2) || die "Cannot open parsed pileup file 2";
    while (my $line = <PARSED_PILEUP_2>) {
        chomp $line;
        my @ts = split /\t/, $line;
        unless ($ts[0] =~ /[0-9]+/g) { next; }
        my $lookup_key =  $ts[3] . "_" . $ts[4];
        ##Only test positions found in parsed pileup file 1
        if (!defined($POSITION_INFO{$lookup_key})) { next; } 
        if ($use_only_defined_sites) {
            if (!defined($site_info_hashref->{$ts[3]}->{$ts[4]})) {
                next;
            }
        }
        for(my $i = 8; $i < scalar(@ts); $i++) { ##Add allele counts to the position
            my @gts = split /_/, $ts[$i];
            if (!defined($POSITION_INFO{$lookup_key}{$gts[0]})) { $POSITION_INFO{$lookup_key}{$gts[0]} = 0; }
            $POSITION_INFO{$lookup_key}{$gts[0]}  = $POSITION_INFO{$lookup_key}{$gts[0]}  + $gts[1];
        }
        my $different_alleles = 0;
        my $tmp_hashref = $POSITION_INFO{$lookup_key};
        foreach my $allele (keys %$tmp_hashref) {
            if (  $POSITION_INFO{$lookup_key}{$allele} > 0 ) { $different_alleles++; }
        }
        if ($different_alleles >= 2) { ##If there are two or more different alleles, we can use this site
            $BIALLELIC_POSITIONS{$lookup_key} = 1;
        }
    }
    close(PARSED_PILEUP_2);
    my %POSITION_INFO = ();
    print STDERR "Determined biallelic positions, found: " . scalar(keys %BIALLELIC_POSITIONS) . " potential positions\n";
    
    ##2. Load information for each bi-allelic position from both files, record those meeting different filters.
    my %RAW_TREATMENT_DATA;
    my %RSID_LOOKUP;
    my %parsed_pileup_files = ('1' => $parsed_pileup_file1,
                               '2' => $parsed_pileup_file2);
    foreach my $pileup_file_key (keys %parsed_pileup_files) {
        open(PARSED_PILEUP, $parsed_pileup_files{$pileup_file_key}) || die "Cannot open parsed pileup file: " . $parsed_pileup_files{$pileup_file_key};
        while (my $line = <PARSED_PILEUP>) {
            chomp $line;
            my @ts = split /\t/, $line;
            my $lookup_key =  $ts[3] . "_" . $ts[4];
            if (defined($BIALLELIC_POSITIONS{$lookup_key})) {
                $RSID_LOOKUP{$lookup_key} = $ts[2];
                my @bases = split /:/, $ts[7];
                foreach my $base (@bases) {
                    my @bts = split /_/, $base;
                    if (!defined($RAW_TREATMENT_DATA{$pileup_file_key}{$lookup_key}{$bts[0]})) {
                        $RAW_TREATMENT_DATA{$pileup_file_key}{$lookup_key}{$bts[0]}{'sum'} = 0;  ##positions passing both filters
                        $RAW_TREATMENT_DATA{$pileup_file_key}{$lookup_key}{$bts[0]}{'sum_mqs'} = 0; ##positions passing the base quality filter but with no mqs filter
                        $RAW_TREATMENT_DATA{$pileup_file_key}{$lookup_key}{$bts[0]}{'sum_bq'} = 0; ##positions passing the mqs filter but with no base quality filter
                        $RAW_TREATMENT_DATA{$pileup_file_key}{$lookup_key}{$bts[0]}{'sum_bq_mqs'} = 0; ##positions regardless of filters
                    }
                    if ($bts[1] >= $mapping_quality_threshold && $bts[2] >= $filter_base_quality) {
                        $RAW_TREATMENT_DATA{$pileup_file_key}{$lookup_key}{$bts[0]}{'sum'} = $RAW_TREATMENT_DATA{$pileup_file_key}{$lookup_key}{$bts[0]}{'sum'} + 1;  
                        $RAW_TREATMENT_DATA{$pileup_file_key}{$lookup_key}{$bts[0]}{'sum_mqs'} = $RAW_TREATMENT_DATA{$pileup_file_key}{$lookup_key}{$bts[0]}{'sum_mqs'} + 1;
                        $RAW_TREATMENT_DATA{$pileup_file_key}{$lookup_key}{$bts[0]}{'sum_bq'} = $RAW_TREATMENT_DATA{$pileup_file_key}{$lookup_key}{$bts[0]}{'sum_bq'} + 1;
                        $RAW_TREATMENT_DATA{$pileup_file_key}{$lookup_key}{$bts[0]}{'sum_bq_mqs'} = $RAW_TREATMENT_DATA{$pileup_file_key}{$lookup_key}{$bts[0]}{'sum_bq_mqs'} + 1;
                    } elsif ($bts[1] >= $mapping_quality_threshold) { ##only add to the below bq if it passes the mqs filter
                        $RAW_TREATMENT_DATA{$pileup_file_key}{$lookup_key}{$bts[0]}{'sum_bq'} = $RAW_TREATMENT_DATA{$pileup_file_key}{$lookup_key}{$bts[0]}{'sum_bq'} + 1;
                        $RAW_TREATMENT_DATA{$pileup_file_key}{$lookup_key}{$bts[0]}{'sum_bq_mqs'} = $RAW_TREATMENT_DATA{$pileup_file_key}{$lookup_key}{$bts[0]}{'sum_bq_mqs'} + 1;
                    } elsif ($bts[2] >= $filter_base_quality) { ##only add to the below mqs if it passes the bq filter
                        $RAW_TREATMENT_DATA{$pileup_file_key}{$lookup_key}{$bts[0]}{'sum_mqs'} = $RAW_TREATMENT_DATA{$pileup_file_key}{$lookup_key}{$bts[0]}{'sum_mqs'} + 1;
                        $RAW_TREATMENT_DATA{$pileup_file_key}{$lookup_key}{$bts[0]}{'sum_bq_mqs'} = $RAW_TREATMENT_DATA{$pileup_file_key}{$lookup_key}{$bts[0]}{'sum_bq_mqs'} + 1;
                    } else {
                        $RAW_TREATMENT_DATA{$pileup_file_key}{$lookup_key}{$bts[0]}{'sum_bq_mqs'} = $RAW_TREATMENT_DATA{$pileup_file_key}{$lookup_key}{$bts[0]}{'sum_bq_mqs'} + 1;
                    }
                }
            }
        }
        close(PARSED_PILEUP);
    }
    print STDERR "Loaded data on allele counts at biallelic sites given mapping and base quality filters\n";
    
    ##3. Get ASE comparative p-values, process "sites_to_batch" sites at a time
    my @biallelic_site_locations = keys %BIALLELIC_POSITIONS;
    my $sites_to_batch = 50000;
    my $skipped = 0;
    my $number_of_chunks = ceil(scalar(@biallelic_site_locations) / $sites_to_batch);
    
    my ($mfh1, $mfilename1) = tempfile( "samasetmpXXXXXXX",
                                        CLEANUP => 1);
    my ($rfh1, $Rfilename1) = tempfile( "samaseRtmpXXXXXXX",
                                        CLEANUP => 1);
    my ($rfhout1, $Routfilename1) = tempfile( "samaseRouttmpXXXXXXX",
                                        CLEANUP => 1);
    open(RFH1, ">" . $Rfilename1) || die("Cannot open R file");
    print RFH1 "data<-read.table(\"$mfilename1\", header=F)\n";
    print RFH1 "fisherr<-array()\n";
    print RFH1 "for(i in 1:nrow(data)) {\n";
    print RFH1 "fisherr[i]<-fisher.test(matrix(c(data[i,5], data[i,7], data[i,6], data[i,8]),nrow=2), alternative=\"t\")\$p.value\n";
    print RFH1 "}\n";
    print RFH1 "foo<-data.frame(data, fisherr)\n";
    print RFH1 "write.table(foo, file=\"$Routfilename1\", sep=\"\\t\", eol=\"\\n\", row.names=F, quote=F, col.names=F)\n";
    close(RFH1);
    
    ##METADATA OUTPUT output mapping_quality_filter, base_quality_filter, minimum_reads_at_site_1, minimum_reads_at_site_2
    print "#parsed_pileup_file1 = $parsed_pileup_file1\n";
    print "#parsed_pileup_file2 = $parsed_pileup_file2\n";
    print "#mapping_quality_filter = $mapping_quality_threshold\n";
    print "#base_quality_filter = $filter_base_quality\n";
    print "#minimum_reads_at_site_1 = $minimum_reads_at_site1\n";
    print "#minimum_reads_at_site_2 = $minimum_reads_at_site2\n";
    print "#CHR\tLOC\tRSID\tALLELE1\tALLELE2\tALLELE1_SITES_IN_1\tALLELE2_SITES_IN_1\tALLELE1_SITES_IN_2\tALLELE2_SITES_IN_2\t";
    print "PVALUE\tPVALUE_NO_MAPPING_FILTER\tPVALUE_NO_BASE_QUALITY_FILTER\tSIG\tGENE_INFO\n";
    for (my $i = 0; $i < $number_of_chunks; $i++) {
        my $start_index = $i * $sites_to_batch;
        my $end_index = $sites_to_batch + $start_index;
        if ($end_index > scalar(@biallelic_site_locations)) {
            $end_index = scalar(@biallelic_site_locations);
        }
        open(MFH, ">" . $mfilename1) || die("Cannot open output file");
        for (my $j = $start_index; $j < $end_index; $j++) {
            my $lookup_key = $biallelic_site_locations[$j];
            
            ##Determine forward strand alleles or determine most abundant two alleles.
            my %alleles_to_use;
            if ($use_only_defined_sites) {
                ##Know the alleles already
                my @lkts = split /_/, $lookup_key;
                my @alleles = split /\//, $site_info_hashref->{$lkts[0]}->{$lkts[1]}->{'alleles'};
                foreach my $allele (@alleles) {
                    $alleles_to_use{$allele} = 1;
                }
            } else {
                ##Need to figure out what is most abundant
                my %allele_counts;
                foreach my $pileup_file_key (keys %parsed_pileup_files) {
                    my $tmp_hashref = $RAW_TREATMENT_DATA{$pileup_file_key}{$lookup_key};
                    foreach my $allele (keys %$tmp_hashref) {
                        if (!defined($allele_counts{$allele})) {
                            $allele_counts{$allele} = 0;
                        }
                        $allele_counts{$allele} = $allele_counts{$allele} + $RAW_TREATMENT_DATA{$pileup_file_key}{$lookup_key}{$allele}{'sum_bq_mqs'};
                    }
                }
                my @sorted_alleles = sort {$allele_counts{$b} <=> $allele_counts{$a}} keys %allele_counts;
                if (scalar(@sorted_alleles) < 2) {
                    next;
                } 
                for(my $k = 0; $k < 2; $k++) {
                    $alleles_to_use{$sorted_alleles[$k]} = 1;
                }
            }
            
            my @alleles = keys %alleles_to_use;
            
            ##Nothing interesting to calculate so skip these cases
            if (!defined($RAW_TREATMENT_DATA{'1'}{$lookup_key}{$alleles[0]}{'sum'})) { $RAW_TREATMENT_DATA{'1'}{$lookup_key}{$alleles[0]}{'sum'} = 0; }
            if (!defined($RAW_TREATMENT_DATA{'1'}{$lookup_key}{$alleles[1]}{'sum'})) { $RAW_TREATMENT_DATA{'1'}{$lookup_key}{$alleles[1]}{'sum'} = 0; }
            if (!defined($RAW_TREATMENT_DATA{'2'}{$lookup_key}{$alleles[0]}{'sum'})) { $RAW_TREATMENT_DATA{'2'}{$lookup_key}{$alleles[0]}{'sum'} = 0; }
            if (!defined($RAW_TREATMENT_DATA{'2'}{$lookup_key}{$alleles[1]}{'sum'})) { $RAW_TREATMENT_DATA{'2'}{$lookup_key}{$alleles[1]}{'sum'} = 0; }
            
            if (!defined($RAW_TREATMENT_DATA{'1'}{$lookup_key}{$alleles[0]}{'sum_mqs'})) { $RAW_TREATMENT_DATA{'1'}{$lookup_key}{$alleles[0]}{'sum_mqs'} = 0; }
            if (!defined($RAW_TREATMENT_DATA{'1'}{$lookup_key}{$alleles[1]}{'sum_mqs'})) { $RAW_TREATMENT_DATA{'1'}{$lookup_key}{$alleles[1]}{'sum_mqs'} = 0; }
            if (!defined($RAW_TREATMENT_DATA{'2'}{$lookup_key}{$alleles[0]}{'sum_mqs'})) { $RAW_TREATMENT_DATA{'2'}{$lookup_key}{$alleles[0]}{'sum_mqs'} = 0; }
            if (!defined($RAW_TREATMENT_DATA{'2'}{$lookup_key}{$alleles[1]}{'sum_mqs'})) { $RAW_TREATMENT_DATA{'2'}{$lookup_key}{$alleles[1]}{'sum_mqs'} = 0; }
            
            if (!defined($RAW_TREATMENT_DATA{'1'}{$lookup_key}{$alleles[0]}{'sum_bq'})) { $RAW_TREATMENT_DATA{'1'}{$lookup_key}{$alleles[0]}{'sum_bq'} = 0; }
            if (!defined($RAW_TREATMENT_DATA{'1'}{$lookup_key}{$alleles[1]}{'sum_bq'})) { $RAW_TREATMENT_DATA{'1'}{$lookup_key}{$alleles[1]}{'sum_bq'} = 0; }
            if (!defined($RAW_TREATMENT_DATA{'2'}{$lookup_key}{$alleles[0]}{'sum_bq'})) { $RAW_TREATMENT_DATA{'2'}{$lookup_key}{$alleles[0]}{'sum_bq'} = 0; }
            if (!defined($RAW_TREATMENT_DATA{'2'}{$lookup_key}{$alleles[1]}{'sum_bq'})) { $RAW_TREATMENT_DATA{'2'}{$lookup_key}{$alleles[1]}{'sum_bq'} = 0; }
            
            if ($RAW_TREATMENT_DATA{'1'}{$lookup_key}{$alleles[0]}{'sum'} == 0 &&
                $RAW_TREATMENT_DATA{'1'}{$lookup_key}{$alleles[1]}{'sum'} == 0) { $skipped++;  next; }
            if ($RAW_TREATMENT_DATA{'2'}{$lookup_key}{$alleles[0]}{'sum'} == 0 &&
                $RAW_TREATMENT_DATA{'2'}{$lookup_key}{$alleles[1]}{'sum'} == 0) { $skipped++; next; }
            if ($RAW_TREATMENT_DATA{'1'}{$lookup_key}{$alleles[0]}{'sum'} == 0 &&
                $RAW_TREATMENT_DATA{'2'}{$lookup_key}{$alleles[0]}{'sum'} == 0) { $skipped++; next; }
            if ($RAW_TREATMENT_DATA{'1'}{$lookup_key}{$alleles[1]}{'sum'} == 0 &&
                $RAW_TREATMENT_DATA{'2'}{$lookup_key}{$alleles[1]}{'sum'} == 0) { $skipped++; next; }
            
            ##Using the alleles output the data to the temporary file
            print MFH "NORMAL\t" . $lookup_key . "\t" . $alleles[0] . "\t" . $alleles[1] . "\t" . $RAW_TREATMENT_DATA{'1'}{$lookup_key}{$alleles[0]}{'sum'} . "\t" . $RAW_TREATMENT_DATA{'1'}{$lookup_key}{$alleles[1]}{'sum'};
            print MFH "\t" . $RAW_TREATMENT_DATA{'2'}{$lookup_key}{$alleles[0]}{'sum'} . "\t" . $RAW_TREATMENT_DATA{'2'}{$lookup_key}{$alleles[1]}{'sum'} . "\n";
            print MFH "MQS\t" . $lookup_key . "\t" . $alleles[0] . "\t" . $alleles[1] . "\t" . $RAW_TREATMENT_DATA{'1'}{$lookup_key}{$alleles[0]}{'sum_mqs'} . "\t" . $RAW_TREATMENT_DATA{'1'}{$lookup_key}{$alleles[1]}{'sum_mqs'};
            print MFH "\t" . $RAW_TREATMENT_DATA{'2'}{$lookup_key}{$alleles[0]}{'sum_mqs'} . "\t" . $RAW_TREATMENT_DATA{'2'}{$lookup_key}{$alleles[1]}{'sum_mqs'} . "\n";
            print MFH "BQ\t" . $lookup_key . "\t" . $alleles[0] . "\t" . $alleles[1] . "\t" . $RAW_TREATMENT_DATA{'1'}{$lookup_key}{$alleles[0]}{'sum_bq'} . "\t" . $RAW_TREATMENT_DATA{'1'}{$lookup_key}{$alleles[1]}{'sum_bq'};
            print MFH "\t" . $RAW_TREATMENT_DATA{'2'}{$lookup_key}{$alleles[0]}{'sum_bq'} . "\t" . $RAW_TREATMENT_DATA{'2'}{$lookup_key}{$alleles[1]}{'sum_bq'} . "\n";
        }
        close(MFH);
        
        ##Process file with R and start reporting
        `$REXE --no-save < $Rfilename1`;
        
        my %RAW_RESULTS;
        open(ROUT, $Routfilename1) || die("Cannot open R results from $Routfilename1 temp file");
        while (my $line = <ROUT>) {
            chomp $line;
            my @ts = split /\t/, $line;
            if ($ts[0] eq "NORMAL") {
                $RAW_RESULTS{$ts[1]}{'NORMAL'} = \@ts;
            } else {
                $RAW_RESULTS{$ts[1]}{$ts[0]} = $ts[8];
            }
        }
        
        ##OUTPUT, chr, loc, rsid, allele1, allele2, allele1_sites_in_1, allele2_sites_in_1, allele1_sites_in_2, allele2_sites_in_2,
        ##pvalue, pvalue_no_mapping_filter, pvalue_no_base_quality_filter, gene_info
        foreach my $result_key (keys %RAW_RESULTS) {
            my @rts = split /_/, $result_key;
            ##print location
            print $rts[0] . "\t" . $rts[1] . "\t";
            
            ##print rsid if exists
            print $RSID_LOOKUP{$rts[0] . "_" . $rts[1]} . "\t";
            
            ##print results
            my @result_data = @{$RAW_RESULTS{$result_key}{'NORMAL'}};
            print $result_data[2] . "\t" . $result_data[3] . "\t" . $result_data[4] . "\t";
            print $result_data[5] . "\t" . $result_data[6] . "\t" . $result_data[7] . "\t";
            print $result_data[8] . "\t" .  $RAW_RESULTS{$result_key}{'MQS'} . "\t" . $RAW_RESULTS{$result_key}{'BQ'} . "\t";
            if ($result_data[8] <= 0.05 && $RAW_RESULTS{$result_key}{'MQS'} <= 0.05 && $RAW_RESULTS{$result_key}{'BQ'} <= 0.05) {
                print "0.05\t";
            } else {
                print ".\t";
            }
            
            ##print gene info if exists
            if (defined($gene_snp_mapping_info_hashref->{$rts[0]})) {
                if (defined($gene_snp_mapping_info_hashref->{$rts[0]}->{$rts[1]})) {
                    print $gene_snp_mapping_info_hashref->{$rts[0]}->{$rts[1]} . "\n";
                } else {
                    print ".\n";
                }
            } else {
                print ".\n";
            }
        }
        close(ROUT);
    }
    print STDERR "Skipped: $skipped\n";
    
    unlink0($mfh1, $mfilename1);
    unlink0($rfh1, $Rfilename1);
    unlink0($rfhout1, $Routfilename1);
}


sub permuteParsePileupFile() {
    my $parsed_pileup_file = shift;
    my $included_sites_vcf_file = shift;
    my $permutations = shift;
    my $fileid = shift;
    my $permutation_start_position = shift;
    print STDERR "Using start: $permutation_start_position\n";
    if (!defined($permutations)) { $permutations = 100; print STDERR "Making 100 permuted files\n";} else {
        print STDERR "Making $permutations permuted files\n";
    }
    if (!defined($fileid)) { $fileid = "uid" . int(rand(1000)); print STDERR "Using fileid $fileid"; }
    
    if (!defined($parsed_pileup_file)) { die "No parsed pileup file defined for arg --parsed_pileup1 or -pp1"; }
    unless(-f $parsed_pileup_file) { die "Parsed pileup file: $parsed_pileup_file  is not a file for arg --parsed_pileup1 or -pp1"; }

    my $use_only_defined_sites = 0;
    my $site_info_hashref = _load_site_filter($included_sites_vcf_file);
    if (defined($site_info_hashref)) { $use_only_defined_sites = 1; }
    
    ##make new allele files
    my $ref_total_count = 0;
    my $nonref_total_count = 0;
    open(PARSED_PILEUP, $parsed_pileup_file) || die "Cannot open parsed pileup file";
    while (my $line = <PARSED_PILEUP>) {
        chomp $line;
        my @ts = split /\t/, $line;
        unless ($ts[0] =~ /[0-9]+/g) { next; }
        if ($use_only_defined_sites) {
            if (!defined($site_info_hashref->{$ts[3]}->{$ts[4]})) {
                next;
            }
        }
        my $ref_allele = $ts[8];
        my @rts = split /_/, $ref_allele;
        $ref_total_count = $ref_total_count + $rts[1];
        my $most_abundant_nonref = 0;
        for (my $i = 9; $i <= scalar(@ts); $i++) {
            my @nrts = split /_/, $ts[$i];
            if ($nrts[1] > $most_abundant_nonref) {
                $most_abundant_nonref = $nrts[1];
            }
        }
        $nonref_total_count = $nonref_total_count + $most_abundant_nonref;
    }
    close(PARSED_PILEUP);
    
    ##Now for each file reassign alleles
    my %ref_nonref_permutation_lookup;
    unless(-d "permutations") {
        `mkdir permutations`;
    }
    if (-d "permutations/$fileid") {
        print STDERR "Warning permutations/$fileid exists\n";
        #`rm -rf permutations/$fileid`;
    } else {
        `mkdir permutations/$fileid`;
    }
    
    my $PERMUTATION_BATCH_SIZE = 250;
    my $batch_permutations = int($permutations / $PERMUTATION_BATCH_SIZE); ##Do only $PERMUTATION_BATCH_SIZE at a time
    my $start_permutation_index = int($permutation_start_position / $PERMUTATION_BATCH_SIZE);
    for (my $batch_perm_index = $start_permutation_index; $batch_perm_index < $batch_permutations; $batch_perm_index++) {
        my %fh_lookup;
        my $current_real_perm_start = $batch_perm_index * $PERMUTATION_BATCH_SIZE;
        my $total_perm_to_run_in_batch = $PERMUTATION_BATCH_SIZE;
        if (($batch_permutations - 1) == $batch_perm_index ) {  ##probably faster than the above, combine the last two jobs
            $total_perm_to_run_in_batch = $permutations - $current_real_perm_start;
        }
        print STDERR "Processing $batch_perm_index to $total_perm_to_run_in_batch for real perm start: $current_real_perm_start\n";
        for (my $i = 0; $i < $total_perm_to_run_in_batch; $i++) {
            my $real_perm_position = $i + $current_real_perm_start;
            my $tmpref = $ref_total_count;
            my $tmpnonref = $nonref_total_count;
            $ref_nonref_permutation_lookup{$i}{'ref'} = $tmpref;
            $ref_nonref_permutation_lookup{$i}{'nonref'} = $tmpnonref;
            ##Make new files
            my $location_index = int($real_perm_position / 500);
            unless(-d "permutations/$fileid/$location_index") {
                `mkdir permutations/$fileid/$location_index`;
            }
            my $file_handle = FileHandle->new(">permutations/$fileid/$location_index/perm.$fileid." . $real_perm_position . ".txt");
            if (!defined($file_handle)) {
                foreach my $fhkey (keys %fh_lookup) {
                    my $fh = $fh_lookup{$fhkey};
                    $fh->close();
                }
                die("Cannot open file handle for " . $i . "th file, check if too many files are open");
            } elsif (defined($fh_lookup{$i})) {
                my $fh = $fh_lookup{$i};
                $fh->close();
                $fh = undef;
            }
            $fh_lookup{$i} = $file_handle;
        }
        eval {
            open(PARSED_PILEUP, $parsed_pileup_file) or die "Cannot open parsed pileup file " . $!;
            while (my $line = <PARSED_PILEUP>) {
                chomp $line;
                my @ts = split /\t/, $line;
                unless ($ts[0] =~ /[0-9]+/g) { next; }
                if ($use_only_defined_sites) {
                    if (!defined($site_info_hashref->{$ts[3]}->{$ts[4]})) {
                        next;
                    }
                }
                my @gts = split /:/, $ts[7];
                my %gts_split_lookup;
                for (my $j = 0; $j < scalar(@gts); $j++) {
                    my @gtss = split /_/, $gts[$j];
                    $gts_split_lookup{$j} = \@gtss;
                 }
                my @rts = split /_/, $ts[8];
                my $ref_allele = $rts[0];
                my $nonref_allele;
                my $nonref_allele_count = 0;
                for(my $i = 9; $i < scalar(@ts); $i++) {
                    my @ats = split /_/, $ts[$i];
                    if ($ats[0] ne $ref_allele) {
                        if (!defined($nonref_allele)) {
                            $nonref_allele = $ats[0];
                            $nonref_allele_count = $ats[1];
                        } elsif ($nonref_allele_count < $ats[1]) {
                            $nonref_allele = $ats[0];
                            $nonref_allele_count = $ats[1];
                        }
                    }
                }
                if (!defined($nonref_allele)) {
                    $nonref_allele = "X";
                }
                for (my $i = 0; $i < $total_perm_to_run_in_batch; $i++) {
                    my $real_perm_position = $i + $current_real_perm_start;
                    my $fh = $fh_lookup{$i};
                    my $tmpref1 = $ref_nonref_permutation_lookup{$i}{'ref'};
                    my $tmpnonref1 = $ref_nonref_permutation_lookup{$i}{'nonref'};
                    print $fh $ts[0] . "\t" . $ts[1] . ".perm$real_perm_position\t" . $ts[2] . "\t" . $ts[3] . "\t" . $ts[4] . "\t" . $ts[5] . "\t" . $ts[6] . "\t";             
                    my $site_ref_count = 0;
                    my $site_nonref_count = 0;
                    my $printed = 0;
                    for (my $j = 0; $j < scalar(@gts); $j++) {
                        #my @gtss = split /_/, $gts[$j];
                        my @gtss = @{$gts_split_lookup{$j}};
                        if ($gtss[0] ne $ref_allele && $gtss[0] ne $nonref_allele) {
                            next;
                        }
                        if ($printed) {
                            print $fh ":";
                        }
                        my $rand = rand($tmpnonref1 + $tmpref1);
                        if ($rand < $tmpnonref1) {
                            print $fh $nonref_allele . "_" . $gtss[1] . "_" . $gtss[2];
                            $tmpnonref1 = $tmpnonref1 - 1;
                            $site_nonref_count++;
                        } else {
                            print $fh $ref_allele . "_" . $gtss[1] . "_" . $gtss[2];
                            $tmpref1 = $tmpref1 - 1;
                            $site_ref_count++;
                        }
                        $printed = 1;
                    }
                    print $fh "\t" . $ref_allele . "_" . $site_ref_count . "\t" . $nonref_allele . "_" . $site_nonref_count . "\n";
                    $ref_nonref_permutation_lookup{$i}{'ref'} = $tmpref1;
                    $ref_nonref_permutation_lookup{$i}{'nonref'} = $tmpnonref1;
                }
            }
            close(PARSED_PILEUP);
        }; if ($@) {
            ##Some error, just close all open file handles
            foreach my $fhkey (keys %fh_lookup) {
                my $fh = $fh_lookup{$fhkey};
                $fh->close();
                $fh = undef;
            }
            die($@);
        }
        for (my $i = 0; $i < $total_perm_to_run_in_batch; $i++) {
            my $fh = $fh_lookup{$i};
            $fh->close();
            $fh = undef;
        }
    }
    return;
}

sub heapSortAndMergeFiles() {
    ##Works for very large files!  Having a merged PP file works easier for doing between treatment ASE calculations
    my $parsed_pileup_file1 = shift;
    my $parsed_pileup_file2 = shift;
    
    if (!defined($parsed_pileup_file1)) { die "No parsed pileup file defined for arg --parsed_pileup1 or -pp1"; }
    unless(-f $parsed_pileup_file1) { die "Parsed pileup file: $parsed_pileup_file1  is not a file for arg --parsed_pileup1 or -pp1"; }
    if (!defined($parsed_pileup_file2)) { die "No parsed pileup file defined for arg --parsed_pileup2 or -pp2"; }
    unless(-f $parsed_pileup_file2) { die "Parsed pileup file: $parsed_pileup_file2  is not a file for arg --parsed_pileup2 or -pp2"; }
    
    ##Split files into sorted chunks
    my @files = ($parsed_pileup_file1, $parsed_pileup_file2);  ##This works with any number of files...
    my %heap_files;
    my @headers = ();
    for(my $i = 0; $i < scalar(@files); $i++) {
        open(PP, $files[$i]) || die("Cannot open parsed pileup file: " . $files[$i]);
        my $index = 0;
        my %data;
        while (my $line = <PP>) {
            my @ts = split /\t/, $line;
            if ($line =~ /MAPPING_QUALITY_THRESHOLD[\S\s]+/g) {
                push @headers, $line;
                next;
            }
            $data{$ts[3]}{$ts[4]} = $line;
            if ($index++ == 100000) {
                my ($mfh1, $mfilename1) = tempfile( "samasetmpXXXXXXX",
                                                    CLEANUP => 0);
                open(MFH, ">" . $mfilename1) || die("Cannot open temp file $mfilename1");
                my @chr_keys = sort {$a <=> $b} keys %data;
                foreach my $chr_key (@chr_keys) {
                    foreach my $position_key (sort {$a <=> $b} keys %{$data{$chr_key}}) {
                        print MFH $data{$chr_key}{$position_key};
                    }
                }
                close(MFH);
                push @{$heap_files{$i}}, $mfilename1;
                %data = ();
                $index = 0;
            }
        }
        close(PP);
        if (scalar(keys %data) > 0) {
            my ($mfh1, $mfilename1) = tempfile( "samase_heaptmpXXXXXXX",
                                                CLEANUP => 0);
            open(MFH, ">" . $mfilename1) || die("Cannot open temp file $mfilename1");
            my @chr_keys = sort {$a <=> $b} keys %data;
            foreach my $chr_key (@chr_keys) {
                foreach my $position_key (sort {$a <=> $b} keys %{$data{$chr_key}}) {
                    print MFH $data{$chr_key}{$position_key};
                }
            }
            close(MFH);
            push @{$heap_files{$i}}, $mfilename1;
            %data = ();
            $index = 0;
        }
    }
    
    ##Have a bunch of sorted file chunks, heap sort values into single sorted files.
    my @sorted_files = ();
    for(my $i = 0; $i < scalar(@files); $i++) {
        my ($mfh1, $mfilename1) = tempfile( "samase_sortedtmpXXXXXXX",
                                            CLEANUP => 0);
        open(MFH1, ">" . $mfilename1) || die("Cannot open tmp file $mfilename1");
        push @sorted_files, $mfilename1;
        my @file_handles = ();
        my @lines = ();
        foreach my $heap_file (@{$heap_files{$i}}) {
            my $file_handle = FileHandle->new($heap_file, "r");
            push @file_handles, $file_handle;
            my $line = <$file_handle>;
            chomp $line;
            my @ts = split /\t/, $line;
            push @lines, \@ts;
        }
        
        my $lowest_filehandle_index = 0;
        my @curr_lowest_pos = ();
        while (scalar(@file_handles) > 0) {
            $lowest_filehandle_index = 0;
            @curr_lowest_pos = @{$lines[0]};
            for(my $j = 1; $j < scalar(@file_handles); $j++) {
                my @pos = @{$lines[$j]};
                if ($pos[3] < $curr_lowest_pos[3]) {
                    @curr_lowest_pos = @pos;
                    $lowest_filehandle_index = $j;
                } elsif ($pos[3] == $curr_lowest_pos[3] && $pos[4] < $curr_lowest_pos[4]) {
                    @curr_lowest_pos = @pos;
                    $lowest_filehandle_index = $j;
                }
            }
            print MFH1 $curr_lowest_pos[0];
            for (my $k = 1; $k < scalar(@curr_lowest_pos); $k++) {
                print MFH1 "\t" . $curr_lowest_pos[$k];
            }
            print MFH1 "\n";
            my $fh = $file_handles[$lowest_filehandle_index];
            if ($fh->eof()) {
                splice (@lines, $lowest_filehandle_index, 1);
                splice (@file_handles, $lowest_filehandle_index, 1);
                $fh->close();
            } else {
                my $line = <$fh>;
                chomp $line;
                my @ts = split /\t/, $line;
                $lines[$lowest_filehandle_index] = \@ts;
            }
        }
        close(MFH1);
    }
    for(my $i = 0; $i < scalar(@files); $i++) {
        foreach my $heap_file (@{$heap_files{$i}}) {
            `rm $heap_file`;  
        }
    }
    
    ##Merge sorted files into one file and return filename
    my ($mfh1, $mfilename1) = tempfile( "samase_mergedXXXXXXX",
                                            CLEANUP => 0);
    open(MFH1, ">" . $mfilename1) || die("Cannot open tmp file $mfilename1");
    my @sorted_filehandles = ();
    my @lines = ();
    my @curr_lowest_pos = ();
    my $lowest_filehandle_index = 0;
    for(my $i = 0; $i < scalar(@sorted_files); $i++) {
        my $file_handle = FileHandle->new($sorted_files[$i], "r");
        push @sorted_filehandles, $file_handle;
        my $line = <$file_handle>;
        chomp $line;
        my @pos = split /\t/, $line;
        push @lines, \@pos;
        if (scalar(@curr_lowest_pos) == 0) {
            @curr_lowest_pos = @pos;
            $lowest_filehandle_index = $i;
        } else {
            if ($pos[3] < $curr_lowest_pos[3]) {
                @curr_lowest_pos = @pos;
                $lowest_filehandle_index = $i;
            } elsif ($pos[3] == $curr_lowest_pos[3] && $pos[4] < $curr_lowest_pos[4]) {
                @curr_lowest_pos = @pos;
                $lowest_filehandle_index = $i;
            }
        }
    }
    my %number_eof;
    while (scalar(@sorted_filehandles) != scalar(keys %number_eof)) {
        #print STDERR scalar(@sorted_filehandles) . " " . scalar(keys %number_eof) . "\n";
        for(my $i = 0; $i < scalar(@lines); $i++) {
            my @pos = @{$lines[$i]};
            if (scalar(@pos) == 0) { next; }
            if ($pos[3] == $curr_lowest_pos[3] && $pos[4] == $curr_lowest_pos[4]) {
                print MFH1 $pos[0];
                for (my $k = 1; $k < scalar(@pos); $k++) {
                    print MFH1 "\t" . $pos[$k];
                }
                my $fh = $sorted_filehandles[$i];
                if ($fh->eof()) {
                    $number_eof{$i} = 1;
                    my @ts = ();
                    $lines[$i] = \@ts;
                } else {
                    my $line = <$fh>;
                    chomp $line;
                    my @ts = split /\t/, $line;
                    $lines[$i] = \@ts;
                }
            }
            if ($i != scalar(@lines) - 1) {
                print MFH1 ";"
            }
        }
        print MFH1 "\n";
        @curr_lowest_pos = ();
        for(my $i = 0; $i < scalar(@lines); $i++) {
            my @pos = @{$lines[$i]};
            if (scalar(@pos) == 0) { next; }
            if (scalar(@curr_lowest_pos) == 0) {
                @curr_lowest_pos = @pos;
                $lowest_filehandle_index = $i;
            } else {
                if ($pos[3] < $curr_lowest_pos[3]) {
                    @curr_lowest_pos = @pos;
                    $lowest_filehandle_index = $i;
                } elsif ($pos[3] == $curr_lowest_pos[3] && $pos[4] < $curr_lowest_pos[4]) {
                    @curr_lowest_pos = @pos;
                    $lowest_filehandle_index = $i;
                }
            }
        }
    }
    close(MFH1);
    foreach my $sorted_file (@sorted_files) {
        `rm $sorted_file`;
    }
    
    print STDERR "Merged files to $mfilename1\n";
}

sub _load_site_filter() {
    my $included_sites_vcf_file = shift;
    my %site_info;
    if (defined($included_sites_vcf_file)) {
        unless(-f $included_sites_vcf_file) { die "Included sites VCF file not a file $included_sites_vcf_file"; }
        open (SITES, $included_sites_vcf_file) || die("Cannot open included sites VCF file");
        while (my $line = <SITES>) {
            chomp $line;
            my @ts = split /\t/, $line;
            $site_info{$ts[0]}{$ts[1]}{'id'} = $ts[2];
            $site_info{$ts[0]}{$ts[1]}{'alleles'} = $ts[3] . "/" . $ts[4];
        }
        close(SITES);
        return \%site_info;
    } else {
        return undef;
    }
}

sub _load_gene_snp_mapping() {
    my $gene_snp_mapping_file = shift;
    my %gene_info;
    if (defined($gene_snp_mapping_file)) {
        unless(-f $gene_snp_mapping_file) { die "Gene SNP mapping file not a file: $gene_snp_mapping_file"; }
        open(GENE_SNP, $gene_snp_mapping_file) || die "Cannot open Gene SNP mapping file";
        while (my $line = <GENE_SNP>) {
            chomp $line;
            my @gts = split /\t/, $line;
            $gene_info{$gts[0]}{$gts[1]} = $gts[3];
        }
        close(GENE_SNP);
    } 
    return \%gene_info;
}


__END__

=head1 NAME

sample - Using Getopt::Long and Pod::Usage

=head1 SYNOPSIS

sample [options] [file ...]

 Options:
  -help brief help message
  -man full documentation

=head1 OPTIONS

=over 8

=item B<-help>

Print a brief help message and exits.

=item B<-man>

Prints the manual page and exits.

=back

=head1 DESCRIPTION

B<This program> will read the given input file(s) and do something
useful with the contents thereof.

=cut
