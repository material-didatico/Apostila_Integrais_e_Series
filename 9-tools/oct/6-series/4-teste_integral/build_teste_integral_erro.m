
function build_teste_integral_erro

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

  tex = latex_add_figure( tex, 'Teste Integral 1', 'fig_teste_integral_erro_right', true );

  %---------------------------------------------------------------------------%

  figure_position( 2, 2, 2, 4 );
  plot_serie_and_function( 'left' )

  tex = latex_add_figure( tex, 'Teste Integral 2', 'fig_teste_integral_erro_left', true );

  %---------------------------------------------------------------------------%

  latex_compile( tex );

end

%-----------------------------------------------------------------------------%
function f = fun_f( x, N, M )

  f = poly3( 0.8, M, 10, 2, -15, -6, x );

end

%-----------------------------------------------------------------------------%
function plot_serie_and_function( s )

  clf
  hold on
  
  M = 15;
  N = 5;

  n = 1:M;
  a = fun_f( n, N, M );

  xo = 1.7;
  xf = M-0.7;

  if( strcmp( s, 'left' ) ), d = 0;
  else,                      d = 1;
  end

  plot( [14+d xf ], [  2.5  2.5 ], 'linewidth', 0.4, 'color', [.7 .7 .7] )
  plot( [ 7+d xf ], [  5.0  5.0 ], 'linewidth', 0.4, 'color', [.7 .7 .7] )
  plot( [ 3+d xf ], [  7.5  7.5 ], 'linewidth', 0.4, 'color', [.7 .7 .7] )
  plot( [ xo  xf ], [ 10.0 10.0 ], 'linewidth', 0.4, 'color', [.7 .7 .7] )

  h = plot_serie( a, s, [xo xf] );

  h = h(1:N-1);
  h = h(~isnan(h));
  set( h, 'FaceColor', [ .95 .95 .95 ], 'EdgeColor', [ .85 .85 .85 ]  )

  x = linspace( xo, xf, 100 );
  y = fun_f( x, N, M );

  plot( x, y, 'm', 'linewidth', 1 )

  scatter( 1:M, a(1:M), 16, 'm', 'filled' )

  ylim([ -1 10 ])

  set( gca, 'ytick', [],
            'xtick', N+[-1 0 1:2:9]-1,
            'xticklabel', {
                '$n\!-\!1$'
                '$n\vphantom{1}$'
                '$n\!+\!1$'
                '$n\!+\!3$'
                '$n\!+\!5$'
                '$n\!+\!7$'
                '$n\!+\!9$'
            } )





  axis_math

  set( gca, 'position', [0.01 0.05 0.98 0.94 ] )
  
  hold off

end

%-----------------------------------------------------------------------------%

