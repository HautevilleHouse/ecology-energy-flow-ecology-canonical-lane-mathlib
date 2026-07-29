import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EcologyEnergyFlowEcologyCanonicalLaneLean

inductive FormulaExpr where
  | var (name : String)
  | num (value : String)
  | add (lhs rhs : FormulaExpr)
  | sub (lhs rhs : FormulaExpr)
  | mul (lhs rhs : FormulaExpr)
  | div (lhs rhs : FormulaExpr)
  | neg (arg : FormulaExpr)
  | abs (arg : FormulaExpr)
  | min (lhs rhs : FormulaExpr)
  | max (lhs rhs : FormulaExpr)
  | raw (formula : String)
deriving Repr, DecidableEq

structure Component where
  key : String
  value : String
deriving Repr, DecidableEq

structure FormulaModel where
  group : String
  key : String
  status : String
  formula : String
  expr : FormulaExpr
  sourceSection : String
  components : List Component
deriving Repr, DecidableEq

def sourceFormulaModels : List FormulaModel :=
  [{ group := "biomass", key := "gpp", status := "derived", formula := "gpp_raw", expr := FormulaExpr.var "gpp_raw", sourceSection := "Ecology Energy Flow Preprint §2", components := [{ key := "gpp_raw", value := "100.0" }] },
   { group := "biomass", key := "respiration", status := "derived", formula := "respiration_raw", expr := FormulaExpr.var "respiration_raw", sourceSection := "Ecology Energy Flow Preprint §2", components := [{ key := "respiration_raw", value := "40.0" }] },
   { group := "efficiency", key := "transfer_efficiency", status := "derived", formula := "transfer_efficiency_raw", expr := FormulaExpr.var "transfer_efficiency_raw", sourceSection := "Ecology Energy Flow Preprint §3", components := [{ key := "transfer_efficiency_raw", value := "0.1" }] }]

def sourceFormulaModelCount : Nat := 3

theorem formula_count_checked : sourceFormulaModels.length = 3 := by
  native_decide

end EcologyEnergyFlowEcologyCanonicalLaneLean
end HautevilleHouse