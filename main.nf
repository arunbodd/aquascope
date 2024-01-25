#!/usr/bin/env nextflow
/*
========================================================================================
    NWSS/aquascope
========================================================================================
*/

nextflow.enable.dsl = 2

/*
========================================================================================
    VALIDATE & PRINT PARAMETER SUMMARY
========================================================================================
*/

WorkflowMain.initialise(workflow, params, log)

/*
========================================================================================
    NAMED WORKFLOW FOR PIPELINE
========================================================================================
*/

include { AQUASCOPE } from './workflows/aquascope'

//
// WORKFLOW: Run main nf-core/aquascope analysis pipeline
//
workflow NFCORE_AQUASCOPE {
    AQUASCOPE ()
}

/*
========================================================================================
    RUN ALL WORKFLOWS
========================================================================================
*/

//
// WORKFLOW: Execute a single named workflow for the pipeline
// See: https://github.com/nf-core/rnaseq/issues/619
//
workflow {
    NFCORE_AQUASCOPE ()
}

/*
========================================================================================
    THE END
========================================================================================
*/
