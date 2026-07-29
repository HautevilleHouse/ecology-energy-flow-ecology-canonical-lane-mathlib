import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Data.Real.Basic

/-!
# Ecosystem Biomass Layers

This module defines the biomass compartments and trophic flow operators
for ecosystem energy flow modeling.
-/

namespace HautevilleHouse
namespace EcologyEnergyFlowEcologyCanonicalLaneLean

abbrev Time := ℝ
abbrev Biomass := Time → ℝ
abbrev TrophicLevel := Fin 5 → ℝ

structure EcosystemOperators where
  grossPrimaryProduction : Biomass → Biomass
  respiration : Biomass → Biomass
  consumption : Biomass → Biomass → Biomass
  mortality : Biomass → Biomass
  decomposition : Biomass → Biomass
  energyTransferEfficiency : ℝ

def defaultEfficiency : ℝ := 0.1

def primitiveOperators : EcosystemOperators := {
  grossPrimaryProduction := fun b => b
  respiration := fun _ => 0
  consumption := fun _ _ => 0
  mortality := fun _ => 0
  decomposition := fun _ => 0
  energyTransferEfficiency := defaultEfficiency
}

structure EcosystemFlow where
  producers : Biomass
  consumers : TrophicLevel
  detritus : Biomass
  operators : EcosystemOperators

def primitiveFlow : EcosystemFlow := {
  producers := fun _ => 1
  consumers := fun _ _ => 0
  detritus := fun _ => 0
  operators := primitiveOperators
}

def EnergyConservation (F : EcosystemFlow) : Prop :=
  (F.operators.grossPrimaryProduction F.producers) =
    (F.operators.respiration F.producers) +
    (F.operators.mortality F.producers) +
    (F.operators.consumption F.producers (F.consumers 0))

def TrophicTransferEfficiency (eff : ℝ) : Prop :=
  0 ≤ eff ∧ eff ≤ 1

theorem default_efficiency_valid : TrophicTransferEfficiency defaultEfficiency := by
  refine And.intro (by norm_num) (by norm_num)

theorem primitive_flow_conservation : EnergyConservation primitiveFlow := by
  unfold EnergyConservation primitiveFlow primitiveOperators
  simp

end EcologyEnergyFlowEcologyCanonicalLaneLean
end HautevilleHouse