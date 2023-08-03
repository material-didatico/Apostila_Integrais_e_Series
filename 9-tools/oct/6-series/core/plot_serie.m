
function h = plot_serie( A, side, xl )

  s = 1;
  if( strcmp( side, 'left' ) ), s = -1; end

  inh = ~ishold;
  hold on

  N = length( A ); 
  H = zeros( N, 1 );

  for n = 1:N
    H(n) = draw_serie_rect( n, A(n), s, xl );
  end

  plot( xl, [0 0], 'k', 'linewidth', 0.5 )

  if( xl(1) > 0 )
    set(gca, 'ycolor', [1 1 1] )
  end

  xlim( xl ); 

  if( inh ), hold off; end

  if( nargout == 1 ), h = H; end

end

%-----------------------------------------------------------------------------%
function h = draw_serie_rect( n, A, s, xl )

  if( s == 1 )
    xo = n;
    xf = n + 1;
  else
    xo = n - 1;
    xf = n;
  end

  if( isnan(A) || xf < xl(1) || xo > xl(2) )
    h = NaN;
    return
  end

  xo = max( xo, xl(1) );
  xf = min( xf, xl(2) );

  yo = 0;
  yf = A;

  X = [ xo xf xf xo xo ];
  Y = [ yo yo yf yf yo ];

  FC = [ 0.8 0.8 1 ];
  EC = 'b'; 

  h = fill( X, Y, FC, 'FaceAlpha', 0.5, 'EdgeColor', EC );

  if( xo == xl(1) ), plot( [xo xo], [0 A], 'w', 'linewidth', 1 ); end
  if( xf == xl(2) ), plot( [xf xf], [0 A], 'w', 'linewidth', 1 ); end

end

%-----------------------------------------------------------------------------%
