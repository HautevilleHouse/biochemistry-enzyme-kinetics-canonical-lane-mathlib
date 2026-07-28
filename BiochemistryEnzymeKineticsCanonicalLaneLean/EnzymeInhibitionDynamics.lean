import BiochemistryEnzymeKineticsCanonicalLaneLean.MichaelisMentenKinetics

/-!
# Enzyme Inhibition Dynamics Package
-/

namespace HautevilleHouse
namespace BiochemistryEnzymeKineticsCanonicalLaneLean

inductive InhibitionType where
  | competitive
  | uncompetitive
  | noncompetitive
  | mixed

structure InhibitionModel where
  inhibitorConcentration : ℝ
  inhibitionConstant : ℝ
  inhibitionType : InhibitionType
  modifiedMichaelisConstant : ℝ
  modifiedMaximumVelocity : ℝ

structure InhibitionEvidence (I : InhibitionModel) where
  inhibitionConstantPositive : I.inhibitionConstant > 0
  modifiedConstantsConsistent : Prop
  inhibitionTypeValid : True

def InhibitionClosed (I : InhibitionModel) : Prop :=
  I.inhibitionConstant > 0 ∧ I.modifiedConstantsConsistent ∧ True

theorem inhibition_closed_from_evidence (I : InhibitionModel)
    (E : InhibitionEvidence I) : InhibitionClosed I := by
  exact And.intro E.inhibitionConstantPositive
    (And.intro E.modifiedConstantsConsistent E.inhibitionTypeValid)

structure EnzymeInhibitionDynamicsPackage {M : MichaelisMentenPackage}
    (I : InhibitionModel) where
  inhibitionPreservesSteadyState : Prop
  rateEquationModified : Prop
  parameterCoupling : Prop

structure EnzymeInhibitionDynamicsEvidence {M : MichaelisMentenPackage}
    {I : InhibitionModel} (D : EnzymeInhibitionDynamicsPackage I) where
  inhibitionPreservesSteadyStateClosed : D.inhibitionPreservesSteadyState
  rateEquationModifiedClosed : D.rateEquationModified
  parameterCouplingClosed : D.parameterCoupling

def EnzymeInhibitionDynamicsClosed {M : MichaelisMentenPackage}
    {I : InhibitionModel} (D : EnzymeInhibitionDynamicsPackage I) : Prop :=
  D.inhibitionPreservesSteadyState ∧ D.rateEquationModified ∧ D.parameterCoupling

theorem enzyme_inhibition_dynamics_closed_from_evidence
    {M : MichaelisMentenPackage} {I : InhibitionModel}
    (D : EnzymeInhibitionDynamicsPackage I)
    (E : EnzymeInhibitionDynamicsEvidence D) : EnzymeInhibitionDynamicsClosed D := by
  exact And.intro E.inhibitionPreservesSteadyStateClosed
    (And.intro E.rateEquationModifiedClosed E.parameterCouplingClosed)

end BiochemistryEnzymeKineticsCanonicalLaneLean
end HautevilleHouse