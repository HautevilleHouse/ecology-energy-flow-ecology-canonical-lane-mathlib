import EcologyEnergyFlowEcologyCanonicalLaneLean.EcologyEnergyFlowAnalyticCertificate

/-!
# Ecology Energy Flow Analytic Closure

This module states the admitted analytic closure theorem for the Ecology Energy Flow
package. It closes the local certificate layer and carries the unrestricted
classical boundary through the source theorem boundary.
-/

namespace HautevilleHouse
namespace EcologyEnergyFlowEcologyCanonicalLaneLean

def EcologyEnergyFlowAdmittedAnalyticClosure : Prop :=
  EcologyEnergyFlowAnalyticCertificateClosed sourceEcologyEnergyFlowAnalyticCertificate ∧
  ConstrainedTheoremClosure analyticAdmissibleClass

def UnrestrictedClassicalEcologyEnergyFlowBoundaryCarried : Prop :=
  formalizationCertificate.theoremBoundaryOpen = true ∧
  mathlibPDESubstrate.unrestrictedEcologyEnergyFlowStackCarried = true

theorem ecology_energy_flow_admitted_analytic_closure_checked :
    EcologyEnergyFlowAdmittedAnalyticClosure := by
  exact And.intro source_ecology_energy_flow_analytic_certificate_closed
    (constrained_ecology_energy_flow_endgame analyticAdmissibleClass)

theorem unrestricted_classical_ecology_energy_flow_boundary_carried_checked :
    UnrestrictedClassicalEcologyEnergyFlowBoundaryCarried := by
  exact And.intro rfl rfl

end EcologyEnergyFlowEcologyCanonicalLaneLean
end HautevilleHouse
