#!/usr/bin/env bash
# scripts/generate-presentation-dates.sh
# Generates a JSON map of filename -> ISO date (last commit) for presentation files.
# Run from repo root. Outputs JSON to stdout or to a file when redirected.

set -euo pipefail

# List of presentation files (update if names change)
files=(
  "AgileBirdsEye.html"
  "ApplicantTrackingSystems.html"
  "BigRoomPlanningAUG.html"
  "BigRoomPlanningBAM.html"
  "ChartingYourPath-IIBAColumbus.html"
  "ChartingYourPath-fCCColumbus.html"
  "DACC-APS.html"
  "DevOpsBirdsEye.html"
  "ElevateYourExpertisewithProfessionalScrumCertification.html"
  "EstablishingaCommonLanguageonaScrumTeam.html"
  "FastTrackTesting.html"
  "FosteringAMavonCulture.html"
  "FosteringAnAgileCulture.html"
  "GaryMontiInterview.html"
  "GitIntro.html"
  "HowToUseTheTree.html"
  "HowToWriteARecipeForAutomatedTesting.html"
  "Internship.html"
  "JiraXray.html"
  "LeadingWithAlignment.html"
  "PickYourThrowdown.html"
  "ReadySetAgile-OMJ.html"
  "ScrumMasterInterviewGames.html"
  "SoYouwanttoPursueanITCareer.html"
  "SoYouwanttoStartYourOwnBusiness.html"
  "WhatIsSelfOrganizationAnyway.html"
  "demo.html"
  "jr-test.html"
  "index.html"
)

# Function to get last commit date in ISO 8601 for a file
get_date() {
  local file="$1"
  if git ls-files --error-unmatch -- "$file" >/dev/null 2>&1; then
    # Use author date of last commit that touched the file
    git log -1 --format=%aI -- "$file" 2>/dev/null || echo ""
  else
    echo ""
  fi
}

# Build JSON
printf '{\n'
first=true
for f in "${files[@]}"; do
  date="$(get_date "$f")"
  # If empty, set null
  if [ -z "$date" ]; then
    val="null"
  else
    # Escape filename for JSON
    esc_file=$(printf '%s' "$f" | sed 's/\\/\\\\/g; s/"/\\"/g')
    val="\"$date\""
  fi

  if [ "$first" = true ]; then
    first=false
  else
    printf ',\n'
  fi

  # Print key/value. If file exists in list but not tracked, prints null.
  printf '  "%s": %s' "$f" "$val"
done
printf '\n}\n'
