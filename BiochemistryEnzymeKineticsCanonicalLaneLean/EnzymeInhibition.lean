import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiochemistryEnzymeKineticsCanonicalLaneLean

inductive InhibitionType where
  | competitive
  | uncompetitive
  | noncompetitive
  | mixed

structure InhibitionConstants where
  ki : Float
  kiPrime : Float
  inhibitionType : InhibitionType
  kiPositive : ki > 0
  kiPrimeNonnegative : kiPrime ≥ 0

structure InhibitedKineticsPackage {E : Enzyme} {S : Substrate}
    (BasePkg : MichaelisMentenPackage E S) where
  inhibitionConstants : InhibitionConstants
  apparentKm : Float
  apparentVmax : Float
  apparentKcat : Float
  inhibitionModelValid : Prop
  apparentKmComputed : apparentKm = BasePkg.km * (1 + BasePkg.substrate.concentration / inhibitionConstants.ki)
  apparentVmaxComputed : apparentVmax = BasePkg.vmax / (1 + BasePkg.substrate.concentration / inhibitionConstants.kiPrime)

structure InhibitedKineticsEvidence {E : Enzyme} {S : Substrate}
    {BasePkg : MichaelisMentenPackage E S}
    (Pkg : InhibitedKineticsPackage BasePkg) where
  inhibitionModelValidClosed : Pkg.inhibitionModelValid
  apparentKmComputedClosed : Pkg.apparentKmComputed
  apparentVmaxComputedClosed : Pkg.apparentVmaxComputed
  inhibitionConstantsValid : Pkg.inhibitionConstants.kiPositive ∧ Pkg.inhibitionConstants.kiPrimeNonnegative

def InhibitedKineticsClosed {E : Enzyme} {S : Substrate}
    {BasePkg : MichaelisMentenPackage E S}
    (Pkg : InhibitedKineticsPackage BasePkg) : Prop :=
  Pkg.inhibitionModelValid ∧ Pkg.apparentKmComputed ∧ Pkg.apparentVmaxComputed ∧
  Pkg.inhibitionConstants.kiPositive ∧ Pkg.inhibitionConstants.kiPrimeNonnegative

theorem inhibited_kinetics_closed_from_evidence
    {E : Enzyme} {S : Substrate} {BasePkg : MichaelisMentenPackage E S}
    (Pkg : InhibitedKineticsPackage BasePkg)
    (Ev : InhibitedKineticsEvidence Pkg) : InhibitedKineticsClosed Pkg := by
  have h := Ev.inhibitionConstantsValid
  exact And.intro Ev.inhibitionModelValidClosed
    (And.intro Ev.apparentKmComputedClosed
      (And.intro Ev.apparentVmaxComputedClosed
        (And.intro h.left h.right)))

end BiochemistryEnzymeKineticsCanonicalLaneLean
end HautevilleHouse