import FWCore.ParameterSet.Config as cms

generator = cms.EDFilter("Pythia8PtGun",
    PGunParameters = cms.PSet(
       ParticleID = cms.vint32(413),
       AddAntiParticle = cms.bool(True),
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
	    py8DstarDecaySettings = cms.vstring('413:onMode = off', # Turn OFF all D* decays
		   			                        '413:addChannel = 1 1. 0 421 211',  # Turn ON D*-> D0 pislow only
                                            '421:onMode = off', # Turn OFF all D* decays
		   			                        '421:addChannel = 1 1. 0 -321 211',  # Turn ON D0-> k pi only
	    ),
        parameterSets = cms.vstring('py8DstarDecaySettings')
    )
)

ProductionFilterSequence = cms.Sequence(generator)
