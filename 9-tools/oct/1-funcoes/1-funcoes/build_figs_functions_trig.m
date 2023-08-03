
function build_figs_functions_trig

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

  % tex = latex_add_preamble( tex, '\usepackage{blindtext}' );                    

  figure_position( 1, 2, 2, 2 );

  tex = latex_figure_properties( tex, 'size', [8 4], 'type', 'tex', 'device', 'png' );

  %----------------------------------------------------------------------------%

  clf 
  hold on

  x = linspace( -3.1*pi, 3.1*pi, 150 );
  y = sin(x);
  plot( [ -3.4*pi 3.4*pi ], [  1  1 ], '-', 'color', [0.9 0.9 0.9] )
  plot( [ -3.4*pi 3.4*pi ], [ -1 -1 ], '-', 'color', [0.9 0.9 0.9] )
  plot( x, y, 'b', 'linewidth', 1 );

  text( 0.6,     1.45, '$\sin(x)$' )
  text( 3.3*pi, -0.2, '$x$' )

  axis([ -3.4*pi 3.4*pi -1.7, 1.7 ])
  latex_ticklabel_radian( gca, 'x', 1 );
  set( gca, 'ytick', [-1 1] )
  set( gca, 'position', [ 0.05 0.05 0.9 0.9 ] )
  axis_math
  axis_commas
  hold off

  tex = latex_add_figure( tex, 'Função', 'fig_functions_sin' );
  
  %----------------------------------------------------------------------------%

  clf 
  hold on

  x = linspace( -3.1*pi, 3.1*pi, 150 );
  y = cos(x);
  plot( [ -3.4*pi 3.4*pi ], [  1  1 ], '-', 'color', [0.9 0.9 0.9] )
  plot( [ -3.4*pi 3.4*pi ], [ -1 -1 ], '-', 'color', [0.9 0.9 0.9] )
  plot( x, y, 'b', 'linewidth', 1 );

  text( 0.6,     1.45, '$\cos(x)$' )
  text( 3.3*pi, -0.2, '$x$' )

  axis([ -3.4*pi 3.4*pi -1.7, 1.7 ])
  latex_ticklabel_radian( gca, 'x', 1 );
  set( gca, 'ytick', [-1 1] )
  set( gca, 'position', [ 0.05 0.05 0.9 0.9 ] )
  axis_math
  axis_commas
  hold off

  tex = latex_add_figure( tex, 'Função', 'fig_functions_cos' );
  
  %----------------------------------------------------------------------------%
  %----------------------------------------------------------------------------%
  %----------------------------------------------------------------------------%

  clf 
  hold on

  x = linspace( -0.49*pi, 0.49*pi, 150 );
  y = tan(x);
  plot_periodic( x, y, 'b', 'linewidth', 1 );

  text( 2.2, 4, '$\tan(x)$' )
  text( 1.45*pi, -0.5, '$x$' )

  plot_jump( -0.5*pi, -5, 5, 5, 4, 'b' );
  plot_jump(  0.5*pi, -5, 5, 5, 4, 'b' );

  axis([ -1.5*pi 1.5*pi -4.1, 4.1 ])
  latex_ticklabel_radian( gca, 'x', 1 );
  set( gca, 'ytick', [ -4 -1 1 4] )
  set( gca, 'position', [ 0.05 0.05 0.9 0.9 ] )
  axis_math
  axis_commas
  hold off

  tex = latex_add_content( tex, '\clearpage' );
  tex = latex_add_figure( tex, 'Função', 'fig_functions_tan' );
  
  %----------------------------------------------------------------------------%

  clf 
  hold on

  x = linspace( 0.01*pi, 0.99*pi, 150 );
  y = cot(x);
  plot_odd( x, y, 'b', 'linewidth', 1 );

  text( 0.8, 4, '$\cot(x)$' )
  text( 1.45*pi, -0.5, '$x$' )

  plot_periodic_jump( pi, pi, -5, 5, 5, 4, 'b' );

  axis([ -1.5*pi 1.5*pi -4.1, 4.1 ])
  latex_ticklabel_radian( gca, 'x', 1 );
  set( gca, 'ytick', [ -4 -1 1 4] )
  set( gca, 'position', [ 0.05 0.05 0.9 0.9 ] )
  axis_math
  axis_commas
  hold off

  tex = latex_add_figure( tex, 'Função', 'fig_functions_cot' );
  
  %----------------------------------------------------------------------------%
  %----------------------------------------------------------------------------%
  %----------------------------------------------------------------------------%

  clf 
  hold on

  x = linspace( -2*pi, 2*pi, 150 );
  y = sec(x);
  y( y>6) = NaN;
  plot( [ -3.4*pi 3.4*pi ], [  1  1 ], '-', 'color', [0.9 0.9 0.9] )
  plot( [ -3.4*pi 3.4*pi ], [ -1 -1 ], '-', 'color', [0.9 0.9 0.9] )
  plot( x, y, 'b', 'linewidth', 1 );

  text( 2,       4.0, '$\sec(x)$' )
  text( 2.2*pi, -0.3, '$x$' )

  plot_periodic_jump( pi/2, pi/2, -5, 5, 5, 4, 'b' );

  axis([ -2.2*pi 2.2*pi -4.1, 4.1 ])
  latex_ticklabel_radian( gca, 'x', 1 );
  set( gca, 'ytick', [ -4 -1 1 4] )
  set( gca, 'position', [ 0.05 0.05 0.9 0.9 ] )
  axis_math
  axis_commas
  hold off

  tex = latex_add_content( tex, '\clearpage' );
  tex = latex_add_figure( tex, 'Função', 'fig_functions_sec' );
  
  %----------------------------------------------------------------------------%

  clf 
  hold on

  x = linspace( -2*pi, 2*pi, 150 );
  y = csc(x);
  y( y>7) = NaN;
  plot( [ -3.4*pi 3.4*pi ], [  1  1 ], '-', 'color', [0.9 0.9 0.9] )
  plot( [ -3.4*pi 3.4*pi ], [ -1 -1 ], '-', 'color', [0.9 0.9 0.9] )
  plot( x, y, 'b', 'linewidth', 1 );

  text( 3.4,     4.0, '$\csc(x)$' )
  text( 2.2*pi, -0.3, '$x$' )

  plot_periodic_jump(   pi,   pi, -5, 5, 5, 4, 'b' );
  plot_periodic_jump( 2*pi, 2*pi, -5, 5, 5, 4, 'b' );

  axis([ -2.2*pi 2.2*pi -4.1, 4.1 ])
  latex_ticklabel_radian( gca, 'x', 1 );
  set( gca, 'ytick', [ -4 -1 1 4] )
  set( gca, 'position', [ 0.05 0.05 0.9 0.9 ] )
  axis_math
  axis_commas
  hold off

  tex = latex_add_figure( tex, 'Função', 'fig_functions_csc' );
  
  %----------------------------------------------------------------------------%

  latex_compile( tex );

end

%------------------------------------------------------------------------------%
