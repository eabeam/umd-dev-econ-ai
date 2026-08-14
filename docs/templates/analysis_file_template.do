/* =============================================================================
    a01_summary_stats.do — [the table this file makes, one line]

    Inputs:    $clean/household.dta
    Outputs:   $output/table1_summary.tex
    Requires:  00_config.do (and config_local.do on your machine)

    Self-contained: running this one file produces the table.
    (It may READ cleaning output, but it never depends on another
    analysis file having run first.)
============================================================================= */

if "$config_loaded" != "1" include "00_config.do"

use "$clean/household.dta", clear

* ==========================================================================
* SAMPLE
* ==========================================================================

* [Restrictions for THIS table only — cleaning-level decisions belong
*  in the cleaning file. Note the N.]

* ==========================================================================
* ANALYSIS
* ==========================================================================

* [Your code here]

* ==========================================================================
* EXPORT
* ==========================================================================

* estpost summarize [varlist]
* esttab using "$output/table1_summary.tex", replace ///
*     cells("mean(fmt(2)) sd(fmt(2)) count(fmt(0))") ///
*     label booktabs nonumber title("Summary statistics")
