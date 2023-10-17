# Particle Gun Acceptance

cmsrel CMSSW_10_6_20_patch1
cmsrel CMSSW_9_4_14_UL_patch1
cd CMSSW_10_6_20_patch1//src
cmsenv

git clone git@github.com:Mapse/Particle-gun.git .

scram b

mv HLT/ ../../CMSSW_9_4_14_UL_patch1/src/
cd ../../CMSSW_9_4_14_UL_patch1/src/
cmsenv
scram b


