#!/bin/bash

#creates tables of aseg and aparc statistics and for listed subjects
asegstats2table --subjects [subjects] --meas vol --t asegstats.txt
aparcstats2table --subjects [subjects] --meas vol --t aparcstats.txt
