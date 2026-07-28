import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiochemistryEnzymeKineticsCanonicalLaneLean

structure Enzyme where
  name : String
  ecNumber : String
  molecularWeight : Float

default name := ""
default ecNumber := ""
default molecularWeight := 0.0

structure Substrate where
  name : String
  concentration : Float
  bindingAffinity : Float

default name := ""
default concentration := 0.0
default bindingAffinity := 0.0

structure MichaelisMentenPackage (E : Enzyme) (S : Substrate) where
  km : Float
  vmax : Float
  kcat : Float
  catalyticEfficiency : Float
  steadyStateAssumption : Prop
  kmPositive : km > 0
  vmaxPositive : vmax > 0
  kcatPositive : kcat > 0
  catalyticEfficiencyComputed : catalyticEfficiency = kcat / km

structure MichaelisMentenEvidence {E : Enzyme} {S : Substrate}
    (Pkg : MichaelisMentenPackage E S) where
  steadyStateAssumptionClosed : Pkg.steadyStateAssumption
  kmPositiveClosed : Pkg.kmPositive
  vmaxPositiveClosed : Pkg.vmaxPositive
  kcatPositiveClosed : Pkg.kcatPositive
  catalyticEfficiencyComputedClosed : Pkg.catalyticEfficiencyComputed

def MichaelisMentenClosed {E : Enzyme} {S : Substrate}
    (Pkg : MichaelisMentenPackage E S) : Prop :=
  Pkg.steadyStateAssumption ∧ Pkg.kmPositive ∧ Pkg.vmaxPositive ∧ Pkg.kcatPositive ∧ Pkg.catalyticEfficiencyComputed

theorem michaelis_menten_closed_from_evidence
    {E : Enzyme} {S : Substrate} (Pkg : MichaelisMentenPackage E S)
    (Ev : MichaelisMentenEvidence Pkg) : MichaelisMentenClosed Pkg := by
  exact And.intro Ev.steadyStateAssumptionClosed
    (And.intro Ev.kmPositiveClosed
      (And.intro Ev.vmaxPositiveClosed
        (And.intro Ev.kcatPositiveClosed Ev.catalyticEfficiencyComputedClosed)))

end BiochemistryEnzymeKineticsCanonicalLaneLean
end HautevilleHouse