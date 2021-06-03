# Comparing Episode Dates

This R projects uses CCM data to quantify the extend of incorrectly derived
system fields. Specifically, we enumerate how many cases of COVID-19 have
incorrect earliest symptom onset date, earliest positive lab collection date,
earliest lab collection date, episode date, and episode date type. We have
employed both the CCM and iPHIS episode date logic as some of the COVID-19
cases were migrated from iPHIS into CCM and retained the old logic. Any case
with an incorrect earliest symptom onset date, earliest positive lab collection
date, earliest lab collection date, episode date, or episode date type is
returned.

## iPHIS Episode Date Logic

Earliest Symptom Onset Date > Earliest Positive Lab Collection Date > Reported Date

## CCM Episode Date Logic

min(Earliest Symptom Onset Date, Earliest Positive Lab Collection Date, Reported Date)
