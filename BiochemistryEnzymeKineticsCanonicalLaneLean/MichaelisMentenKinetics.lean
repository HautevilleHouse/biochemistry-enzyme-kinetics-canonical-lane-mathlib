import BiochemistryEnzymeKineticsCanonicalLaneLean.EnzymeAdmissibleClass

/-!
# Michaelis-Menten Kinetics Package
-/

namespace HautevilleHouse
namespace BiochemistryEnzymeKineticsCanonicalLaneLean

structure MichaelisMentenPackage where
  enzymeConcentration : ℝ
  substrateConcentration : ℝ
  bindingRate : ℝ
  unbindingRate : ℝ
  catalyticRate : ℝ
  steadyStateApproximation : Prop
  michaelisConstant : ℝ
  maximumVelocity : ℝ

structure MichaelisMentenEvidence (M : MichaelisMentenPackage) where
  steadyStateApproximationClosed : M.steadyStateApproximation
  michaelisConstantDefined : M.michaelisConstant = (M.unbindingRate + M.catalyticRate) / M.bindingRate
  maximumVelocityDefined : M.maximumVelocity = M.catalyticRate * M.enzymeConcentration

def MichaelisMentenClosed (M : MichaelisMentenPackage) : Prop :=
  M.steadyStateApproximation ∧
  M.michaelisConstant = (M.unbindingRate + M.catalyticRate) / M.bindingRate ∧
  M.maximumVelocity = M.catalyticRate * M.enzymeConcentration

theorem michaelis_menten_closed_from_evidence (M : MichaelisMentenPackage)
    (E : MichaelisMentenEvidence M) : MichaelisMentenClosed M := by
  exact And.intro E.steadyStateApproximationClosed
    (And.intro E.michaelisConstantDefined E.maximumVelocityDefined)

end BiochemistryEnzymeKineticsCanonicalLaneLean
end HautevilleHouse