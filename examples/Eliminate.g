##  <#GAPDoc Label="Eliminate">
##  <Subsection Label="Eliminate">
##  <Heading>Eliminate</Heading>
##  <Example><![CDATA[
##  gap> R := HomalgFieldOfRationalsInDefaultCAS( ) * "x,y,z,l,m";;
##  gap> var := Indeterminates( R );
##  [ x, y, z, l, m ]
##  gap> x := var[1];; y := var[2];; z := var[3];; l := var[4];; m := var[5];;
##  gap> L := [ x*m+l-4, y*m+l-2, z*m-l+1, x^2+y^2+z^2-1, x+y-z ];
##  [ x*m+l-4, y*m+l-2, z*m-l+1, x^2+y^2+z^2-1, x+y-z ]
##  gap> e := Eliminate( L, [ l, m ] );
##  <A ? x 1 matrix over an external ring>
##  gap> Display( e );
##  4*y+z,  
##  4*x-5*z,
##  21*z^2-8
##  gap> I := LeftSubmodule( e );
##  <A torsion-free (left) ideal given by 3 generators>
##  gap> Display( I );
##  4*y+z,  
##  4*x-5*z,
##  21*z^2-8
##  
##  A (left) ideal generated by the 3 entries of the above matrix
##  gap> J := LeftSubmodule( "x+y-z, -2*z-3*y+x, x^2+y^2+z^2-1", R );
##  <A torsion-free (left) ideal given by 3 generators>
##  gap> I = J;
##  true
##  ]]></Example>
##  </Subsection>
##  <#/GAPDoc>

LoadPackage( "RingsForHomalg" );
R := HomalgFieldOfRationalsInDefaultCAS( ) * "x,y,z,l,m";
var := Indeterminates( R );
x := var[1]; y := var[2]; z := var[3]; l := var[4]; m := var[5];
L := [ x*m+l-4, y*m+l-2, z*m-l+1, x^2+y^2+z^2-1, x+y-z ];
e := Eliminate( L, [ l, m ] );

LoadPackage( "Modules" );
I := LeftSubmodule( e );
J := LeftSubmodule( "x+y-z, -2*z-3*y+x, x^2+y^2+z^2-1", R );
Assert( 0, I = J );
