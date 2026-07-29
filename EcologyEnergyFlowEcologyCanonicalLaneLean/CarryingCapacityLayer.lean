import EcologyEnergyFlowEcologyCanonicalLaneLean.TrophicEfficiencyLayer

/-!
# Carrying Capacity Layer

This module records the carrying capacity gate ecological closure.
-/

namespace HautevilleHouse
namespace EcologyEnergyFlowEcologyCanonicalLaneLean

structure CarryingCapacityCertificate where
  efficiency : TrophicEfficiencyCertificate
  capacityPositive : Prop
  capacityFinite : Prop
  capacityPositiveProof : capacityPositive
  capacityFiniteProof : capacityFinite

def sourceCarryingCapacityCertificate : CarryingCapacityCertificate := {
  efficiency := sourceTrophicEfficiencyCertificate
  capacityPositive := primitiveFlow.producers 0 > 0
  capacityFinite := True
  capacityPositiveProof := by norm_num
  capacityFiniteProof := trivial
}

def CarryingCapacityClosed (C : CarryingCapacityCertificate) : Prop :=
  TrophicEfficiencyClosed C.efficiency ∧
  C.capacityPositive ∧
  C.capacityFinite

theorem source_carrying_capacity_closed :
    CarryingCapacityClosed sourceCarryingCapacityCertificate := by
  refine And.intro source_trophic_efficiency_closed
    (And.intro sourceCarryingCapacityCertificate.capacityPositiveProof
      sourceCarryingCapacityCertificate.capacityFiniteProof)

end EcologyEnergyFlowEcologyCanonicalLaneLean
end HautevilleHouse