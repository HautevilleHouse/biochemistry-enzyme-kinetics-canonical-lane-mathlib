import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BiochemistryEnzymeKineticsCanonicalLaneLean.SubstrateBinding
import HautevilleHouse.BiochemistryEnzymeKineticsCanonicalLaneLean.CatalyticStep
import HautevilleHouse.BiochemistryEnzymeKineticsCanonicalLaneLean.KineticParameters
import HautevilleHouse.BiochemistryEnzymeKineticsCanonicalLaneLean.ThermodynamicCycle

namespace HautevilleHouse
namespace BiochemistryEnzymeKineticsCanonicalLaneLean

structure RateEquationsPackage {B : SubstrateBindingPackage} {C : CatalyticStepPackage B}
    {K : KineticParametersPackage B C} (T : ThermodynamicCyclePackage B C K) where
  differentialEquation : Prop
  steadyStateSolution : Prop
  initialRateExpression : Prop

structure RateEquationsEvidence {B : SubstrateBindingPackage} {C : CatalyticStepPackage B}
    {K : KineticParametersPackage B C} {T : ThermodynamicCyclePackage B C K}
    (R : RateEquationsPackage T) where
  differentialEquationClosed : R.differentialEquation
  steadyStateSolutionClosed : R.steadyStateSolution
  initialRateExpressionClosed : R.initialRateExpression

def RateEquationsClosed {B : SubstrateBindingPackage} {C : CatalyticStepPackage B}
    {K : KineticParametersPackage B C} {T : ThermodynamicCyclePackage B C K}
    (R : RateEquationsPackage T) : Prop :=
  R.differentialEquation ∧ R.steadyStateSolution ∧ R.initialRateExpression

theorem rate_equations_closed_from_evidence
    {B : SubstrateBindingPackage} {C : CatalyticStepPackage B}
    {K : KineticParametersPackage B C} {T : ThermodynamicCyclePackage B C K}
    (R : RateEquationsPackage T) (E : RateEquationsEvidence R) :
    RateEquationsClosed R := by
  exact And.intro E.differentialEquationClosed
    (And.intro E.steadyStateSolutionClosed E.initialRateExpressionClosed)

end BiochemistryEnzymeKineticsCanonicalLaneLean
end HautevilleHouse