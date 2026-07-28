import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BiochemistryEnzymeKineticsCanonicalLaneLean.EnzymeKinetics
import HautevilleHouse.BiochemistryEnzymeKineticsCanonicalLaneLean.EnzymeInhibition

namespace HautevilleHouse
namespace BiochemistryEnzymeKineticsCanonicalLaneLean

structure EnzymeAdmittedObject where
  enzyme : Enzyme
  substrate : Substrate
  michaelisMenten : MichaelisMentenPackage enzyme substrate
  inhibition : Option (InhibitedKineticsPackage michaelisMenten)
  conclusion : MichaelisMentenClosed michaelisMenten

def EnzymeKineticsWitnessClosed (O : EnzymeAdmittedObject) : Prop :=
  MichaelisMentenClosed O.michaelisMenten

def bridgeClosed (A : AdmissibleClass) : Prop :=
  EnzymeKineticsWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  exact A.object.conclusion

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) : gateClosed A := by
  exact A.gateWitness

def ConstrainedBiochemistryEnzymeKineticsClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_biochemistry_enzyme_kinetics_endgame (A : AdmissibleClass) :
    ConstrainedBiochemistryEnzymeKineticsClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end BiochemistryEnzymeKineticsCanonicalLaneLean
end HautevilleHouse