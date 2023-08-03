
function build_figs_functions_exp

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

  x = linspace( -3.2, 2, 90 );
  y = exp(x);
  plot( x, y, 'b', 'linewidth', 1 );

  text( 0.2, 3.8, '$e^{x}$' )
  text( 3.3, -0.3, '$x$' )

  % axis equal
  axis([ -3.4 3.4 -0.8, 4 ])
  set( gca, 'xtick', -3:3, 'ytick', 1:3 )
  set( gca, 'position', [ 0.05 0.05 0.9 0.9 ] )
  axis_math
  axis_commas
  hold off

  tex = latex_add_figure( tex, 'Função', 'fig_functions_exp_1' );
  
  %----------------------------------------------------------------------------%

  clf 
  hold on

  x = linspace( -2, 3.2, 90 );
  y = exp(-x);
  plot( x, y, 'b', 'linewidth', 1 );

  text( 0.2,  3.8, '$e^{-x}$' )
  text( 3.3, -0.3, '$x$' )

  % axis equal
  axis([ -3.4 3.4 -0.8, 4 ])
  set( gca, 'xtick', -3:3, 'ytick', 1:3 )
  set( gca, 'position', [ 0.05 0.05 0.9 0.9 ] )
  axis_math
  axis_commas
  hold off

  tex = latex_add_figure( tex, 'Função', 'fig_functions_exp_2' );
  
  %----------------------------------------------------------------------------%

  latex_compile( tex );

end

%------------------------------------------------------------------------------%
