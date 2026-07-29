import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EcologyEnergyFlowEcologyCanonicalLaneLean

open HautevilleHouse.EcologyEnergyFlowEcologyCanonicalLaneLean

structure EnergyFlowEndpointCertificate where
  pdeLayer : PDEEnergyLayer
  trophicStructure : TrophicDynamicsStructure
  nutrientEquilibrium : NutrientCycleEquilibriumCertificate
  energyFlowBalanceClosed : Prop
  endpointLayerClosed : Prop
  energyFlowBalanceClosedProof : energyFlowBalanceClosed
  endpointLayerClosedProof : endpointLayerClosed

def sourceEnergyFlowEndpointCertificate : EnergyFlowEndpointCertificate := {
  pdeLayer := sourcePDEEnergyLayer
  trophicStructure := sourceTrophicDynamicsStructure
  nutrientEquilibrium := sourceNutrientCycleEquilibriumCertificate
  energyFlowBalanceClosed := EcologyEnergyBalanceClosed primitiveEcosystemFlow
  endpointLayerClosed := True
  energyFlowBalanceClosedProof := primitive_ecosystem_ecology_energy_balance_closed_checked
  endpointLayerClosedProof := trivial
}

def EnergyFlowEndpointClosed (C : EnergyFlowEndpointCertificate) : Prop :=
  PDEEnergyLayerClosed C.pdeLayer ∧
  TrophicDynamicsClosed C.trophicStructure ∧
  NutrientCycleEquilibriumClosed C.nutrientEquilibrium ∧
  C.energyFlowBalanceClosed ∧
  C.endpointLayerClosed

theorem source_energy_flow_endpoint_closed :
    EnergyFlowEndpointClosed sourceEnergyFlowEndpointCertificate := by
  exact And.intro source_pde_energy_layer_closed
    (And.intro source_trophic_dynamics_closed
      (And.intro source_nutrient_cycle_equilibrium_closed
        (And.intro sourceEnergyFlowEndpointCertificate.energyFlowBalanceClosedProof
          sourceEnergyFlowEndpointCertificate.endpointLayerClosedProof)))

end HautevilleHouse.EcologyEnergyFlowEcologyCanonicalLaneLean
end HautevilleHouse