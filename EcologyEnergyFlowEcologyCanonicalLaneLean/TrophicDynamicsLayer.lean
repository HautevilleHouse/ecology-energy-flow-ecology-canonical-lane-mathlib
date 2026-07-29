import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.EcologyEnergyFlowEcologyCanonicalLaneLean.EnergyFlowLayer

/-!
# Trophic Dynamics Layer

This module defines the trophic dynamics certificate: trophic levels, energy
pyramids, and the closure of trophic dynamics.
-/

namespace HautevilleHouse
namespace EcologyEnergyFlowEcologyCanonicalLaneLean

structure TrophicLevel where
  level : ℕ
  compartments : List CompartmentID

def defaultTrophicLevel : TrophicLevel := {
  level := 0,
  compartments := []
}

structure TrophicDynamicsCertificate where
  energyFlow : EnergyFlowCertificate
  trophicLevels : List TrophicLevel
  pyramidClosed : Prop
  energyTransferEfficiency : ℝ
  pyramidClosedProof : pyramidClosed
  energyTransferEfficiencyPositive : energyTransferEfficiency > 0

def sourceTrophicDynamicsCertificate : TrophicDynamicsCertificate := {
  energyFlow := sourceEnergyFlowCertificate,
  trophicLevels := [defaultTrophicLevel],
  pyramidClosed := True,
  energyTransferEfficiency := 0.1,
  pyramidClosedProof := trivial,
  energyTransferEfficiencyPositive := by
    norm_num
}

def TrophicDynamicsClosed (C : TrophicDynamicsCertificate) : Prop :=
  EnergyFlowClosed C.energyFlow ∧ C.pyramidClosed ∧ C.energyTransferEfficiency > 0

theorem source_trophic_dynamics_closed :
    TrophicDynamicsClosed sourceTrophicDynamicsCertificate := by
  exact And.intro source_energy_flow_closed
    (And.intro sourceTrophicDynamicsCertificate.pyramidClosedProof
      sourceTrophicDynamicsCertificate.energyTransferEfficiencyPositive)

end EcologyEnergyFlowEcologyCanonicalLaneLean
end HautevilleHouse
