
function build_figs_functions_trig_inv

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
  %----------------------------------------------------------------------------%
  %----------------------------------------------------------------------------%

  clf 
  hold on

  x = linspace( -1, 1, 150 );
  y = asin(x);
  plot( [ -1 -1 0 ], [ 0 -pi/2 -pi/2 ], '-', 'color', [0.9 0.9 0.9] )
  plot( [  1  1 0 ], [ 0  pi/2  pi/2 ], '-', 'color', [0.9 0.9 0.9] )
  plot( x, y, 'b', 'linewidth', 1 );

  text( 0.1,  1.9, '$\arcsin(x)$' )
  text( 1.1, -0.3, '$x$' )

  axis([ -1.1 1.1 -0.6*pi 0.6*pi ])
  latex_ticklabel_radian( gca, 'y', 1/2 );
  set( gca, 'position', [ 0.05 0.05 0.9 0.9 ] )
  axis_math
  axis_commas
  hold off

  tex = latex_add_figure( tex, 'Função', 'fig_functions_asin' );
  
  % %----------------------------------------------------------------------------%

  clf 
  hold on

  x = linspace( -1, 1, 150 );
  y = acos(x);
  plot( [ -1 -1 0 ], [ 0 pi pi ], '-', 'color', [0.9 0.9 0.9] )
  plot( x, y, 'b', 'linewidth', 1 );

  text( 0.1,  3.3, '$\arccos(x)$' )
  text( 1.1, -0.3, '$x$' )

  axis([ -1.1 1.1 -0.2 1.1*pi ])
  latex_ticklabel_radian( gca, 'y', 1/2 );
  set( gca, 'position', [ 0.05 0.05 0.9 0.9 ] )
  axis_math
  axis_commas
  hold off

  tex = latex_add_figure( tex, 'Função', 'fig_functions_acos' );
  
  %----------------------------------------------------------------------------%
  %----------------------------------------------------------------------------%
  %----------------------------------------------------------------------------%

  clf 
  hold on

  x = linspace( -10.5, 10.5, 150 );
  y = atan(x);
  plot( [ -11 11 ], [  pi/2   pi/2 ], '-', 'color', [0.9 0.9 0.9] )
  plot( [ -11 11 ], [ -pi/2  -pi/2 ], '-', 'color', [0.9 0.9 0.9] )
  plot( x, y, 'b', 'linewidth', 1 );

  text( 0.5, 0.6*pi, '$\arctan(x)$' )
  text( 11, -0.3, '$x$' )

  axis([ -11 11 -0.6*pi 0.6*pi ])
  latex_ticklabel_radian( gca, 'y', 1/2 );
  set( gca, 'position', [ 0.05 0.05 0.9 0.9 ] )
  axis_math
  axis_commas
  hold off

  tex = latex_add_content( tex, '\clearpage' );
  tex = latex_add_figure ( tex, 'Função', 'fig_functions_atan' );
  
  %----------------------------------------------------------------------------%

  clf 
  hold on

  x = linspace( -10.5, 10.5, 150 );
  y = acot(x);
  plot( [ -11 11 ], [ pi pi ], '-', 'color', [0.9 0.9 0.9] )
  y( x<0 ) = y(x<0) + pi;
  plot( x, y, 'b', 'linewidth', 1 );

  text( 0.5, 1.1*pi, '$\arccot(x)$' )
  text( 11, -0.3, '$x$' )

  axis([ -11 11 -0.2 1.1*pi ])
  latex_ticklabel_radian( gca, 'y', 1/2 );
  set( gca, 'position', [ 0.05 0.05 0.9 0.9 ] )
  axis_math
  axis_commas
  hold off

  tex = latex_add_figure( tex, 'Função', 'fig_functions_acot' );
  
  %----------------------------------------------------------------------------%
  %----------------------------------------------------------------------------%
  %----------------------------------------------------------------------------%

  clf 
  hold on

  x = linspace( 1, 10.5, 150 );
  y = asec(x);
  plot( [ -11 11 ], [  pi/2   pi/2 ], '-', 'color', [0.9 0.9 0.9] )
  plot(  x, y, 'b', 'linewidth', 1 );
  plot( -x, y, 'b', 'linewidth', 1 );

  text( 0.5, 0.6*pi, '$\arcsec(x)$' )
  text( 11, -0.2, '$x$' )

  axis([ -11 11 -0.2 0.6*pi ])
  latex_ticklabel_radian( gca, 'y', 1/2 );
  set( gca, 'xtick', [-10 -5 -1 1 5 10 ] )
  set( gca, 'position', [ 0.05 0.05 0.9 0.9 ] )
  axis_math
  axis_commas
  hold off

  tex = latex_add_content( tex, '\clearpage' );
  tex = latex_add_figure( tex, 'Função', 'fig_functions_asec' );
  
  %----------------------------------------------------------------------------%

  clf 
  hold on

  x = linspace( 1, 10.5, 150 );
  y = acsc(x);
  plot( [ -1 -1 0 ], [ 0 -pi/2 -pi/2 ], '-', 'color', [0.9 0.9 0.9] )
  plot( [  1  1 0 ], [ 0  pi/2  pi/2 ], '-', 'color', [0.9 0.9 0.9] )
  plot(  x,  y, 'b', 'linewidth', 1 );
  plot( -x, -y, 'b', 'linewidth', 1 );

  text( 0.5, 0.6*pi, '$\csc(x)$' )
  text( 11, -0.2, '$x$' )

  axis([ -11 11 -0.6*pi 0.6*pi ])
  latex_ticklabel_radian( gca, 'y', 1/2 );
  set( gca, 'xtick', [-10 -5 -1 1 5 10 ] )
  set( gca, 'position', [ 0.05 0.05 0.9 0.9 ] )
  axis_math
  axis_commas
  hold off

  tex = latex_add_figure( tex, 'Função', 'fig_functions_acsc' );
  
  %----------------------------------------------------------------------------%

  latex_compile( tex );

end

%------------------------------------------------------------------------------%
