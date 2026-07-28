import BiochemistryEnzymeKineticsCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BiochemistryEnzymeKineticsCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  EnzymeKineticsWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end BiochemistryEnzymeKineticsCanonicalLaneLean
end HautevilleHouse