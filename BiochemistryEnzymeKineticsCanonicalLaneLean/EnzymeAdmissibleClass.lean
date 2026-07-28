import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiochemistryEnzymeKineticsCanonicalLaneLean

structure EnzymeAdmittedObject where
  enzyme : Type
  substrate : Type
  kineticModel : Prop
  bindingAffinity : Prop
  catalyticRate : Prop

structure AdmissibleClass where
  object : EnzymeAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  EnzymeWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end BiochemistryEnzymeKineticsCanonicalLaneLean
end HautevilleHouse