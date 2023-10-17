# Particle Gun Acceptance

The following steps are for 2017 conditions.

## Setup your system

In this step, the CMSSW versions for simulating the steps GEM-SIM, DR, HLT, and AOD are configurated.

```
cmsrel CMSSW_10_6_20_patch1

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
```
## Generating the fragments

Your fragments are at Configuration/GenProduction/python: **Jpsi_gun_cfi.py** and **Dstar_gun_cfi.py**. Config them the way you need and you are ready to generate all fragments and events.

To generate the fragments all you need to do is run steps.sh file. If you want to generate some events in your local machine, you can set the number of events on the variable **nevt**.
To run the whole chain you can do:

```
. steps.sh
```
## Running events with CRAB

TODO



