i=24

while [ $i -gt 0 ]
do
  crab resubmit crab_projects/crab_GS_JpsiToMuMuwithDstar2018_26-11-2021/
  sleep 1800
  echo Hours left: $i
  ((i--))
done
