import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.EcologyEnergyFlowEcologyCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace EcologyEnergyFlowEcologyCanonicalLaneLean

def ConstrainedTheoremClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_theorem_closure (A : AdmissibleClass) :
    ConstrainedTheoremClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end EcologyEnergyFlowEcologyCanonicalLaneLean
end HautevilleHouse
