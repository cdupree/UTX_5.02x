
% Copyright 2015 The University of Texas at Austin
%
% For licensing information see
%                http://www.cs.utexas.edu/users/flame/license.html 
%                                                                                 
% Programmed by: Name of author
%                Email of author

function [ A_out ] = Set_to_identity_unb( A )

  [ ATL, ATR, ...
    ABL, ABR ] = FLA_Part_2x2( A, ...
                               0, 0, 'FLA_TL' );

  while ( size( ATL, 1 ) < size( A, 1 ) )

    [ A00,  a01,     A02,  ...
      a10t, alpha11, a12t, ...
      A20,  a21,     A22 ] = FLA_Repart_2x2_to_3x3( ATL, ATR, ...
                                                    ABL, ABR, ...
                                                    1, 1, 'FLA_BR' );

    %------------------------------------------------------------%

     a01 = laff_zerov(a01);
     alpha11 = laff_onev(alpha11); % laff_onev needed for pictureFLAME.
     a21 = laff_zerov( a21);
    
     % could also do
     % a10t = laff_zerov(a10t);
     % alpha11 = laff_onev(alpha11);
     % a12t = laff_zerov(a12t);
     
     % and (which does the row to the left, and the column to the top
     % a01 = laff_zerov(a01);
     % alpha11 = laff_onev(alpha11);
     % a10t = laff_zerov(a10t);
     
     

    %------------------------------------------------------------%

    [ ATL, ATR, ...
      ABL, ABR ] = FLA_Cont_with_3x3_to_2x2( A00,  a01,     A02,  ...
                                             a10t, alpha11, a12t, ...
                                             A20,  a21,     A22, ...
                                             'FLA_TL' );

  end

  A_out = [ ATL, ATR
            ABL, ABR ];

return
