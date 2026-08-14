/* =============================================================================
    00_config.do — project paths and settings

    Every cleaning and analysis file starts with:  include "00_config.do"
    Your personal project root lives in config_local.do (gitignored):
    copy config_local_template.do -> config_local.do and set $root there.
============================================================================= */

version 17
include "config_local.do"    // defines $root — the only personal path

* --- Derived paths (never edit these on a new machine) ---
global raw     "$root/data/raw"       // as downloaded; read-only
global clean   "$root/data/clean"     // built by cleaning files
global output  "$root/output"         // tables and figures land here

* --- Flag so files can check the config ran ---
global config_loaded 1
