import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Data.Real.Basic

/-!
# Ecology Energy Flow Analytic Objects

This module provides a local analytic vocabulary for the ecology energy flow
theorem package: compartments, energy flows, productivity, transfer efficiency,
and closure operators.
-/

namespace HautevilleHouse
namespace EcologyEnergyFlowEcologyCanonicalLaneLean

abbrev CompartmentID := String
abbrev EnergyAmount := ℝ
abbrev Time := ℝ
abbrev FlowRate := ℝ

structure EcosystemCompartment where
  id : CompartmentID
  biomass : EnergyAmount
  productivity : FlowRate

def defaultCompartment : EcosystemCompartment := {
  id := "default",
  biomass := 0,
  productivity := 0
}

structure EnergyFlow where
  source : CompartmentID
  target : CompartmentID
  rate : FlowRate

def zeroFlow : EnergyFlow := {
  source := "",
  target := "",
  rate := 0
}

structure EcosystemNetwork where
  compartments : List EcosystemCompartment
  flows : List EnergyFlow

def emptyEcosystem : EcosystemNetwork := {
  compartments := [],
  flows := []
}

def totalProductivity (eco : EcosystemNetwork) : EnergyAmount :=
  List.sum (eco.compartments.map fun c => c.productivity)

def totalBiomass (eco : EcosystemNetwork) : EnergyAmount :=
  List.sum (eco.compartments.map fun c => c.biomass)

def flowBalance (eco : EcosystemNetwork) : Prop :=
  List.all eco.compartments fun c =>
    (List.sum (eco.flows.filter fun f => f.source = c.id).map fun f => f.rate) =
    (List.sum (eco.flows.filter fun f => f.target = c.id).map fun f => f.rate)

def transferEfficiency (rate : FlowRate) (productivity : FlowRate) : ℝ :=
  if productivity = 0 then 0 else rate / productivity

def energyFlowClosed (eco : EcosystemNetwork) : Prop :=
  flowBalance eco ∧ totalProductivity eco ≥ 0 ∧ totalBiomass eco ≥ 0

end EcologyEnergyFlowEcologyCanonicalLaneLean
end HautevilleHouse
