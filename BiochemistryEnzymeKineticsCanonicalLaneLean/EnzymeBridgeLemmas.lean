import BiochemistryEnzymeKineticsCanonicalLaneLean.EnzymeAdmissibleClass

namespace HautevilleHouse
namespace BiochemistryEnzymeKineticsCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  EnzymeWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.kineticModel

end BiochemistryEnzymeKineticsCanonicalLaneLean
end HautevilleHouse