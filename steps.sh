
# Path to gs frameng
path_gs=Configuration/GenProduction/python/Jpsi_gun_cfi.py
# Number of events for gs step
nevt=1
# GS cfg fragment 
py_gs=Jpsi_gun_GS_cfg.py
# DR cfg fragment
py_dr=Jpsi_gun_DR_cfg.py
# HLT cfg fragment
py_hlt=Jpsi_gun_HLT_cfg.py
# AOD cfg fragment
py_aod=Jpsi_gun_AOD_cfg.py

# CmsDriver for GS step
cmsDriver.py $path_gs --fileout file:GS.root --mc --eventcontent RAWSIM --datatier GEN-SIM --conditions 106X_mc2017_realistic_v7 --beamspot Realistic25ns13TeVEarly2017Collision --step GEN,SIM --customise Configuration/DataProcessing/Utils.addMonitoring --geometry DB:Extended --era Run2_2017 --python_filename $py_gs -n $nevt --no_exec

cmsRun $py_gs

cp $py_gs GS/config/

# Cmsdriver for DR step - without pileup
cmsDriver.py --filein file:GS.root --fileout file:DR.root --pileup NoPileUp --mc --eventcontent PREMIXRAW --datatier GEN-SIM-RAW --conditions 106X_mc2017_realistic_v7 --step DIGI,L1,DIGI2RAW --nThreads 1 --geometry DB:Extended --era Run2_2017 --python_filename $py_dr -n -1 --no_exec

cmsRun $py_dr

cp $py_dr DR/ && cp DR.root ../../CMSSW_9_4_14_UL_patch1/src/HLT && cd ../../CMSSW_9_4_14_UL_patch1/src/HLT

cmsenv

# Cmsdriver for HLT step
cmsDriver.py --filein file:DR.root --fileout file:HLT.root --mc --eventcontent RAWSIM --datatier GEN-SIM-RAW --conditions 94X_mc2017_realistic_v15 --customise_commands 'process.source.bypassVersionCheck = cms.untracked.bool(True)' --step HLT:2e34v40 --nThreads 1 --geometry DB:Extended --era Run2_2017 --python_filename $py_hlt -n -1 --no_exec

cmsRun $py_hlt

cp HLT.root ../../../CMSSW_10_6_20/src/ && cd ../../../CMSSW_10_6_20/src/

cmsenv

# Cmsdriver for AOD step
cmsDriver.py --filein file:HLT.root --fileout file:AOD.root --mc --eventcontent AODSIM --runUnscheduled --datatier AODSIM --conditions 106X_mc2017_realistic_v7 --step RAW2DIGI,L1Reco,RECO,RECOSIM --nThreads 1 --geometry DB:Extended --era Run2_2017 --python_filename $py_aod -n -1 --no_exec

cmsRun $py_aod

cp $py_aod AOD/

