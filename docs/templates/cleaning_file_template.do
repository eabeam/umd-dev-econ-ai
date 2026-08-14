/* =============================================================================
    01_clean_household.do — [what this file builds, one line]

    Inputs:    $raw/[MODULE].dta
    Outputs:   $clean/household.dta
    Requires:  00_config.do (and config_local.do on your machine)

    Decisions: every drop / recode / imputation / restriction made here
    is logged in the decisions log for the assignment that uses it.
============================================================================= */

if "$config_loaded" != "1" include "00_config.do"

* --- Validate inputs ---
confirm file "$raw/[MODULE].dta"

* --- Load raw data (never save back to $raw) ---
use "$raw/[MODULE].dta", clear

* ==========================================================================
* CLEAN
* ==========================================================================

* [Your code here. Comments say WHY: cite the questionnaire item,
*  the BID page, or the decision-log entry that justifies each choice.]

* --- Track your sample as you go ---
* count                        // note N after each restriction

* ==========================================================================
* VALIDATE + SAVE
* ==========================================================================

isid hhid                       // fails loudly if the ID isn't unique — good
compress
save "$clean/household.dta", replace
