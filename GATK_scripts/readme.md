## Calling variants using GATK
  Here is an example HgV event for running the GATK variant calling pipeline on HG002 samples, using inputs from one of the previous runs. 
  This directory can be copied and used as a template for running GATK variant calling on different inputs. 
  `Resequencing38.smk` is the Snakemake workflow for the analysis pipeline.

  The `event.json` file is the HgV sample-level configuration for the event. Some of these fields will need to be modified for different inputs:
  1. `path` - Path to the event (i.e. the directory where the event.json file is located).
  2. `extracted_reads_bam` - Path to the input BAM of extracted reads.
  3. `extracted_reads_interval_list` - Path to the input interval list file of extracted reads analysis regions (GATK requires interval list format instead of BED). This can be generated from the BED file using Picard BedToIntervalList.
  4. `reference` - Path to the FASTA reference.

  To start the analysis pipeline with HgV, first run this command to setup the HgV shell environment (Baylor HGSC cluster):

  `source /hgsc_software/HgV/latest/hgv/setup.sh`

  Next, this command will start the analysis pipeline by submitting analysis jobs to the cluster. The `-q` option specifies the queue name, set this to the name of the cluster queue you will use:

  `hgv --profile analysis start -e {event_path} -w Resequencing38.smk -q {queue_name}`

  The Snakemake workflow also lists the GATK commands and parameters being used if you want to try running the commands manually. 
