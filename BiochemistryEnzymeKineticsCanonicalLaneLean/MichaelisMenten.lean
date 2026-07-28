import BiochemistryEnzymeKineticsCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BiochemistryEnzymeKineticsCanonicalLaneLean

structure MichaelisMentenConstants where
  kₐₜ : ℕ
  Kₘ : ℕ

structure MichaelisMentenEquation (S : ℕ) (E : ℕ) (C : MichaelisMentenConstants) where
  rate : ℕ → Prop
  steadyStateApproximation : Prop
  productFormationFormula : Prop

structure MichaelisMentenPackage where
  constants : MichaelisMentenConstants
  equation : MichaelisMentenEquation constants.substrateConc constants.enzymeConc constants
  initialVelocity : Prop
  saturationFraction : Prop

def MichaelisMentenClosed (M : MichaelisMentenPackage) : Prop :=
  M.initialVelocity ∧ M.saturationFraction

theorem michaelis_menten_closed (M : MichaelisMentenPackage) :
    MichaelisMentenClosed M := by
  exact And.intro M.initialVelocity M.saturationFraction

end BiochemistryEnzymeKineticsCanonicalLaneLean
end HautevilleHouse