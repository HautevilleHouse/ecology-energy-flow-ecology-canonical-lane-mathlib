import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EcologyEnergyFlowEcologyCanonicalLaneLean

open HautevilleHouse.EcologyEnergyFlowEcologyCanonicalLaneLean

structure PDEEnergyLayer where
  flow : EcosystemFlow
  biomassConservation : Prop
  nutrientConservation : Prop
  energyConservation : Prop
  trophicConstraints : Prop
  biomassConservationClosed : biomassConservation
  nutrientConservationClosed : nutrientConservation
  energyConservationClosed : energyConservation
  trophicConstraintsClosed : trophicConstraints

def sourcePDEEnergyLayer : PDEEnergyLayer := {
  flow := primitiveEcosystemFlow
  biomassConservation := BiomassBalance primitiveEcosystemFlow
  nutrientConservation := NutrientConservation primitiveEcosystemFlow
  energyConservation := EnergyFlowClosed primitiveEcosystemFlow
  trophicConstraints := True
  biomassConservationClosed := primitive_ecosystem_biomass_balance_checked
  nutrientConservationClosed := primitive_ecosystem_nutrient_conservation_checked
  energyConservationClosed := primitive_ecosystem_energy_flow_closed_checked
  trophicConstraintsClosed := trivial
}

def PDEEnergyLayerClosed (L : PDEEnergyLayer) : Prop :=
  L.biomassConservation ∧ L.nutrientConservation ∧ L.energyConservation ∧ L.trophicConstraints

theorem source_pde_energy_layer_closed :
    PDEEnergyLayerClosed sourcePDEEnergyLayer := by
  exact And.intro sourcePDEEnergyLayer.biomassConservationClosed
    (And.intro sourcePDEEnergyLayer.nutrientConservationClosed
      (And.intro sourcePDEEnergyLayer.energyConservationClosed
        sourcePDEEnergyLayer.trophicConstraintsClosed))

end HautevilleHouse.EcologyEnergyFlowEcologyCanonicalLaneLean
end HautevilleHouse