import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.EcologyEnergyFlowEcologyCanonicalLaneLean.BridgeLemmas

namespace HautevilleHouse
namespace EcologyEnergyFlowEcologyCanonicalLaneLean

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness

end EcologyEnergyFlowEcologyCanonicalLaneLean
end HautevilleHouse
