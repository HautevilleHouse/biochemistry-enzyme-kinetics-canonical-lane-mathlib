import BiochemistryEnzymeKineticsCanonicalLaneLean.FinalTheorem
import canonicalLaneMathlib.Core

/-!
# Formalization Layer for Biochemistry Enzyme Kinetics
-/

namespace HautevilleHouse
namespace BiochemistryEnzymeKineticsCanonicalLaneLean

open canonicalLaneMathlib.Core

structure EnzymeAdmittedObject where
  enzymeType : String
  substrateType : String
  kmValue : ℝ
  kcatValue : ℝ
  conclusion : EnzymeWitnessClosed (this : EnzymeAdmittedObject)

def EnzymeWitnessClosed (O : EnzymeAdmittedObject) : Prop :=
  O.kmValue > 0 ∧ O.kcatValue > 0

theorem enzyme_witness_closed_from_admitted (O : EnzymeAdmittedObject) :
    EnzymeWitnessClosed O := by
  exact O.conclusion

end BiochemistryEnzymeKineticsCanonicalLaneLean
end HautevilleHouse
