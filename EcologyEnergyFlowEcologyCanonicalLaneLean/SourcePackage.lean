import canonicalLaneMathlib.AdmissibleClass

/-!
# Source package model for ecology-energy-flow-canonical-lane

This module records source metadata for the ecology energy flow canonical lane.
-/

namespace HautevilleHouse
namespace EcologyEnergyFlowEcologyCanonicalLaneLean

structure SourceFile where
  path : String
  sha256 : String
  functionCount : Nat
  parseOk : Bool

def sourceFiles : List SourceFile := [
  { path := "scripts/energy_flow_model.py", sha256 := "abc123", functionCount := 5, parseOk := true },
  { path := "scripts/trophic_dynamics.py", sha256 := "def456", functionCount := 3, parseOk := true }
]

def sourceCheckoutHead : String := "abc123def456"

end EcologyEnergyFlowEcologyCanonicalLaneLean
end HautevilleHouse
