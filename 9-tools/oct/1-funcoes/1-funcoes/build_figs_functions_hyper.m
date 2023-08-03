
function build_figs_functions_hyper

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

  tex = latex_figure_properties( tex, 'size', [8 8], 'type', 'tex', 'device', 'png' );

  %----------------------------------------------------------------------------%

  clf 
  hold on

  x = linspace( -3, 3, 90 );
  y = sinh(x);
  plot( x, y, 'b', 'linewidth', 1 );

  text( 0.3, 10.5, '$\sinh(x)$' )
  text( 2.8, -0.8, '$x$' )

  % axis equal
  axis([ -3 3 -11, 11 ])
  set( gca, 'xtick', -2:2 )
  set( gca, 'position', [ 0.05 0.05 0.9 0.9 ] )
  axis_math
  axis_commas
  hold off

  tex = latex_add_figure( tex, 'Função', 'fig_functions_sinh' );
  
  %----------------------------------------------------------------------------%

  clf 
  hold on

  x = linspace( -3, 3, 90 );
  y = cosh(x);
  plot( x, y, 'b', 'linewidth', 1 );

  text( 0.3, 10.5, '$\cosh(x)$' )
  text( 2.8, -0.8, '$x$' )

  % axis equal
  axis([ -3 3 -11, 11 ])
  set( gca, 'xtick', -2:2 )
  set( gca, 'position', [ 0.05 0.05 0.9 0.9 ] )
  axis_math
  axis_commas
  hold off

  tex = latex_add_figure( tex, 'Função', 'fig_functions_cosh' );
  
  %----------------------------------------------------------------------------%

  latex_compile( tex );

end

%------------------------------------------------------------------------------%
