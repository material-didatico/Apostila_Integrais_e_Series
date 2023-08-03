
function build_teste_integral

  % Papel A4 29,7 x 21 cm
  % Texto    25,2 x 18 cm

  % General information
  basename = mfilename();
  latexdir = [ 'aux_' basename ];
  filename = basename;
  doctitle = 'Título'; 
  author   = 'Luis D''Afonseca';

  global latex_model
  
  % Creating the latex directory
  tex = latex_create( latexdir, filename, doctitle, author,
                      'lang',     'pt', 
                      'preamble', false,
                      % 'dryrun', true,
                      'class', 'article',  
                      'model', latex_model );

  tex = latex_add_preamble( tex, '\usepackage{blindtext}' );                    

  tex = latex_figure_properties( tex, 'size', [16 5], 'type', 'tex', 'device', 'png' );

  %---------------------------------------------------------------------------%

  figure_position( 1, 2, 2, 2 );
  plot_serie_and_function( 'right' );

  tex = latex_add_figure( tex, 'Teste Integral 1', 'fig_teste_integral_right', true );

  %---------------------------------------------------------------------------%

  figure_position( 2, 2, 2, 4 );
  plot_serie_and_function( 'left' )

  tex = latex_add_figure( tex, 'Teste Integral 2', 'fig_teste_integral_left', true );

  %---------------------------------------------------------------------------%

  latex_compile( tex );

end

%-----------------------------------------------------------------------------%
function g = fun_g( x, N, M )

  g = zeros( size(x) );

  ii = x <  N;
  jj = x >= N;

  dn = -10;

  g(ii) = poly3( -5, N, 13, 5.1, 0,  dn,  x(ii) );
  g(jj) = poly3(  N, M,  5.1, 1, dn, -1,  x(jj) );

end

%-----------------------------------------------------------------------------%
function f = fun_f( x, N, M )

  f = fun_g( x, N, M );

  ii = x <  N;

  f(ii) = f(ii) + poly3( 0, N, 3, 0, -20, 0, x(ii) );

end

%-----------------------------------------------------------------------------%
function plot_serie_and_function( s )

  clf
  hold on

  M = 15;
  N = 6;

  n = 1:M;
  a = fun_g( n, N, M );

  xo = 1.7;
  xf = M-0.7;

  if( strcmp( s, 'left' ) ), d = 0;
  else,                      d = 1;
  end

  plot( [ 9+d xf ], [  2.5  2.5 ], 'linewidth', 0.4, 'color', [.7 .7 .7] )
  plot( [ 6+d xf ], [  5.0  5.0 ], 'linewidth', 0.4, 'color', [.7 .7 .7] )
  plot( [ 3+d xf ], [  7.5  7.5 ], 'linewidth', 0.4, 'color', [.7 .7 .7] )
  plot( [ xo  xf ], [ 10.0 10.0 ], 'linewidth', 0.4, 'color', [.7 .7 .7] )

  h = plot_serie( a, s, [xo xf] );
  
  h = h(1:N-1);
  h = h(~isnan(h));
  set( h, 'FaceColor', [ .95 .95 .95 ], 'EdgeColor', [ .85 .85 .85 ]  )

  x = linspace( xo, xf, 100 );
  y = fun_f( x, N, M );

  plot( x, y, 'm', 'linewidth', 1 )

  scatter( N:M, a(N:M), 16, 'm', 'filled' )

  ylim([ -1 10 ])

  set( gca, 'ytick', [],
            'xtick', N+[-1 0 1:2:9],
            'xticklabel', {
                '$N\!-\!1$'
                '$N$'
                '$N\!+\!1$'
                '$N\!+\!3$'
                '$N\!+\!5$'
                '$N\!+\!7$'
                '$N\!+\!9$'
            } )

  % text( 1.5, a(1)+3, '$f(x)$',
  %       'horizontalalignment', 'center',
  %       'verticalalignment', 'baseline' )

  axis_math

  set( gca, 'position', [0.01 0.05 0.98 0.94 ] )
  
  hold off

end

%-----------------------------------------------------------------------------%

