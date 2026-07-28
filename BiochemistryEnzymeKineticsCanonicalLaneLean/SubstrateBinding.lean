import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiochemistryEnzymeKineticsCanonicalLaneLean

structure SubstrateBindingPackage where
  enzyme : Type
  substrate : Type
  complex : Type
  bindingRate : ℝ
  unbindingRate : ℝ
  dissociationConstant : ℝ
  bindingEquilibrium : Prop
  massActionKinetics : Prop

structure SubstrateBindingEvidence (B : SubstrateBindingPackage) where
  bindingEquilibriumClosed : B.bindingEquilibrium
  massActionKineticsClosed : B.massActionKinetics

def SubstrateBindingClosed (B : SubstrateBindingPackage) : Prop :=
  B.bindingEquilibrium ∧ B.massActionKinetics

theorem substrate_binding_closed_from_evidence
    (B : SubstrateBindingPackage) (E : SubstrateBindingEvidence B) :
    SubstrateBindingClosed B := by
  exact And.intro E.bindingEquilibriumClosed E.massActionKineticsClosed

end BiochemistryEnzymeKineticsCanonicalLaneLean
end HautevilleHouse