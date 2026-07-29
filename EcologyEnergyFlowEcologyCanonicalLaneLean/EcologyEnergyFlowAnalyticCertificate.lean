import EcologyEnergyFlowEcologyCanonicalLaneLean.RegularityEndpointLayer

/-!
# Ecology Energy Flow Analytic Certificate

This module packages the local analytic flow layer into one proof-carrying
certificate. The certificate is native Lean data with evidence terms for every
field in the admitted lane.
-/

namespace HautevilleHouse
namespace EcologyEnergyFlowEcologyCanonicalLaneLean

structure EcologyEnergyFlowAnalyticCertificate where
  substrate : MathlibPDESubstrate
  operatorsClosed : Prop
  weakLayerClosed : Prop
  energyLayerClosed : Prop
  compactnessLayerClosed : Prop
  endpointLayerClosed : Prop
  canonicalCarriageImported : Prop
  operatorsClosedProof : operatorsClosed
  weakLayerClosedProof : weakLayerClosed
  energyLayerClosedProof : energyLayerClosed
  compactnessLayerClosedProof : compactnessLayerClosed
  endpointLayerClosedProof : endpointLayerClosed
  canonicalCarriageImportedProof : canonicalCarriageImported

def sourceEcologyEnergyFlowAnalyticCertificate : EcologyEnergyFlowAnalyticCertificate := {
  substrate := mathlibPDESubstrate
  operatorsClosed := EcosystemBalance primitiveEnergyFlowModel
  weakLayerClosed := LerayHopfEnvelopeClosed sourceLerayHopfEnvelope
  energyLayerClosed := EnergyEnstrophyClosed sourceEnergyEnstrophyCertificate
  compactnessLayerClosed := CompactnessRigidityClosed sourceCompactnessRigidityCertificate
  endpointLayerClosed := RegularityEndpointClosed sourceRegularityEndpointCertificate
  canonicalCarriageImported := commonCoreProjectionLawAvailable ∧ commonCoreCarriageLawAvailable ∧ commonCoreIdempotenceAvailable
  operatorsClosedProof := primitive_ecosystem_balance_checked
  weakLayerClosedProof := source_leray_hopf_envelope_closed
  energyLayerClosedProof := source_energy_enstrophy_closed
  compactnessLayerClosedProof := source_compactness_rigidity_closed
  endpointLayerClosedProof := source_regularity_endpoint_closed
  canonicalCarriageImportedProof := And.intro mathlib_common_core_projection_law_checked
    (And.intro mathlib_common_core_carriage_law_checked mathlib_common_core_idempotence_checked)
}

def EcologyEnergyFlowAnalyticCertificateClosed (C : EcologyEnergyFlowAnalyticCertificate) : Prop :=
  C.operatorsClosed ∧
  C.weakLayerClosed ∧
  C.energyLayerClosed ∧
  C.compactnessLayerClosed ∧
  C.endpointLayerClosed ∧
  C.canonicalCarriageImported

theorem source_ecology_energy_flow_analytic_certificate_closed :
    EcologyEnergyFlowAnalyticCertificateClosed sourceEcologyEnergyFlowAnalyticCertificate := by
  exact And.intro sourceEcologyEnergyFlowAnalyticCertificate.operatorsClosedProof
    (And.intro sourceEcologyEnergyFlowAnalyticCertificate.weakLayerClosedProof
      (And.intro sourceEcologyEnergyFlowAnalyticCertificate.energyLayerClosedProof
        (And.intro sourceEcologyEnergyFlowAnalyticCertificate.compactnessLayerClosedProof
          (And.intro sourceEcologyEnergyFlowAnalyticCertificate.endpointLayerClosedProof
            sourceEcologyEnergyFlowAnalyticCertificate.canonicalCarriageImportedProof))))

end EcologyEnergyFlowEcologyCanonicalLaneLean
end HautevilleHouse
