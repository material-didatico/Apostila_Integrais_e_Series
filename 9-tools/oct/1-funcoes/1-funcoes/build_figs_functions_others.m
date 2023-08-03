
function build_figs_functions_others

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

  tex = latex_add_preamble( tex, { '\newcommand{\carac}[1]{\chi_{_{#1}}}'
                                   '\DeclareMathOperator{\heaviside}{H}'
                                   '\DeclareMathOperator{\ramp}{G}' } );

  figure_position( 1, 2, 2, 2 );

  tex = latex_figure_properties( tex, 'size', [8 4], 'type', 'tex', 'device', 'png' );

  %----------------------------------------------------------------------------%

  clf 
  hold on

  x = [ -3.1 -1 NaN -1 2 NaN 2 3.1 ];
  y = [  0    0 NaN  1 1 NaN 0 0   ];

  plot( x, y, 'b', 'linewidth', 1 );
  plot_jump( -1, 0, 1, 1, 4, 'b' );
  plot_jump(  2, 0, 1, 1, 4, 'b' ); 

  text( 0.2, 1.15, '$\carac{[-1, 2]}(x)$' )
  text( 3.4, -0.07, '$x$', 'horizontalalignment', 'right' )

  axis([ -3.2 3.2 -0.1 1.2 ])
  set( gca, 'ytick', [-1 1] )
  set( gca, 'position', [ 0.05 0.05 0.9 0.9 ] )
  axis_math
  axis_commas
  hold off

  tex = latex_add_figure( tex, 'Função', 'fig_functions_carac' );
  
  %----------------------------------------------------------------------------%

  clf 
  hold on

  x = [ -3.1  0 NaN 0 3.1 ];
  y = [  0    0 NaN 1 1   ];

  plot( x, y, 'b', 'linewidth', 1 );
  plot_jump( 0, 0, 1, 1/2, 4, 'b' );

  text( 0.2, 1.15, '$\heaviside(x)$' )
  text( 3.4, -0.07, '$x$', 'horizontalalignment', 'right' )

  axis([ -3.2 3.2 -0.1 1.2 ])
  set( gca, 'ytick', [-1 1] )
  set( gca, 'position', [ 0.05 0.05 0.9 0.9 ] )
  axis_math
  axis_commas
  hold off

  tex = latex_add_figure( tex, 'Função', 'fig_functions_heaviside' );
  
  %----------------------------------------------------------------------------%

  clf 
  hold on

  x = [ -3.1  -1  1  3.1 ];
  y = [  0     0  1  1   ];

  plot( x, y, 'b', 'linewidth', 1 );

  text( 0.2, 1.15, '$\ramp_{1}(x)$' )
  text( 3.4, -0.07, '$x$', 'horizontalalignment', 'right' )

  axis([ -3.2 3.2 -0.1 1.2 ])
  set( gca, 'ytick', [-1 1] )
  set( gca, 'position', [ 0.05 0.05 0.9 0.9 ] )
  axis_math
  axis_commas
  hold off

  tex = latex_add_figure( tex, 'Função', 'fig_functions_rampa' );
  
  %----------------------------------------------------------------------------%

  clf 
  hold on

  plot( [-3.1 3.1], [0 0], 'b', 'linewidth', 1 );
  plot( [ 0   0  ], [0 1], 'b', 'linewidth', 1 );

  text( 0.2, 1.15, '$\delta(x)$' )
  text( 3.4, -0.07, '$x$', 'horizontalalignment', 'right' )

  scatter( 0, 0, 16, 'w', 'filled' )
  scatter( 0, 0, 16, 'b', 'linewidth', 1 )

  annotation( 'textarrow', [0.5 0.5], [ 0.5 0.81 ],
              'headlength', 4,
              'headwidth',  4,
              'color', 'b' );

  axis([ -3.2 3.2 -0.1 1.2 ])
  set( gca, 'ytick', [-1 1] )
  set( gca, 'position', [ 0.05 0.05 0.9 0.9 ] )
  axis_math
  axis_commas
  hold off

  tex = latex_add_figure( tex, 'Função', 'fig_functions_delta' );
  
  %----------------------------------------------------------------------------%

  latex_compile( tex );

end

%------------------------------------------------------------------------------%
