import FWCore.ParameterSet.Config as cms

generator = cms.EDFilter("Pythia8PtGun",
    PGunParameters = cms.PSet(
       ParticleID = cms.vint32(443),
       AddAntiParticle = cms.bool(False),
       MinPt = cms.double(0.0),
       MaxPt = cms.double(100.0),
       MinEta = cms.double(-4.0),
       MaxEta = cms.double(4.0),
       MinPhi = cms.double(-3.14159265359),
       MaxPhi = cms.double(3.14159265359),
    ),

    maxEventsToPrint = cms.untracked.int32(1),
    pythiaPylistVerbosity = cms.untracked.int32(0),
    pythiaHepMCVerbosity = cms.untracked.bool(False),

    PythiaParameters = cms.PSet(
	    py8JpsiDecaySettings = cms.vstring('443:onMode = off', # Turn OFF all Jpsi decays
		   			                       '443:addChannel = 1 1. 0 13 -13'  # Turn ON JPsi-> mu mu only
	    ),
        parameterSets = cms.vstring('py8JpsiDecaySettings')
    )
)

ProductionFilterSequence = cms.Sequence(generator)
