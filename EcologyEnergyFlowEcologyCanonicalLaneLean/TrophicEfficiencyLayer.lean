import EcologyEnergyFlowEcologyCanonicalLaneLean.EcosystemBiomassLayers

/-!
# Trophic Efficiency Layer

This module records the energy transfer efficiency certificate.
-/

namespace HautevilleHouse
namespace EcologyEnergyFlowEcologyCanonicalLaneLean

structure TrophicEfficiencyCertificate where
  flow : EcosystemFlow
  efficiencyValid : Prop
  conservationHolds : Prop
  efficiencyValidProof : efficiencyValid
  conservationHoldsProof : conservationHolds

def sourceTrophicEfficiencyCertificate : TrophicEfficiencyCertificate := {
  flow := primitiveFlow
  efficiencyValid := TrophicTransferEfficiency primitiveOperators.energyTransferEfficiency
  conservationHolds := EnergyConservation primitiveFlow
  efficiencyValidProof := default_efficiency_valid
  conservationHoldsProof := primitive_flow_conservation
}

def TrophicEfficiencyClosed (C : TrophicEfficiencyCertificate) : Prop :=
  C.efficiencyValid ∧ C.conservationHolds

theorem source_trophic_efficiency_closed :
    TrophicEfficiencyClosed sourceTrophicEfficiencyCertificate := by
  exact And.intro sourceTrophicEfficiencyCertificate.efficiencyValidProof
    sourceTrophicEfficiencyCertificate.conservationHoldsProof

end EcologyEnergyFlowEcologyCanonicalLaneLean
end HautevilleHouse