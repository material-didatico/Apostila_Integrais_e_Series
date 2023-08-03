
function plot_taylor_approx( f, a, r, C, xo, xf, N )

  n = length( C ) -1;

  if( ~exist( 'N' ) ), N = 0:n; end

  inh = ~ishold();

  x = linspace( max( xo, a-r), min( xf, a+r), 1000 );
  p = repmat( C(1), size(x) );

  for k = 1:n

    p = p + C(k+1) * ( x - a ).^k;

    if( ismember( k, N ) )

      plot( x, p, 'linewidth', 0.5, 'color', [.5 .5 .5] );
      hold on

    end

  end

  z = linspace( xo, xf, 2000 );
  y = f(z);
  plot( z, y, 'b', 'linewidth', 1 );

  if( ismember( k, N ) )
    plot( x, p, 'color', 'm', 'linewidth', 1.2 );
  end

  plot( a, C(1), 'b.', 'markersize', 16 );

  if( inh ), hold off, end

end

%-----------------------------------------------------------------------------%
