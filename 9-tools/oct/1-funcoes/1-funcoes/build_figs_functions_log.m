
function build_figs_functions_log

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

  tex = latex_figure_properties( tex, 'size', [17 5], 'type', 'tex', 'device', 'png' );

  %----------------------------------------------------------------------------%

  clf 
  hold on

  x = linspace( -6.6, 6.6, 150 );
  y = log(abs(x));
  plot( x, y, 'b', 'linewidth', 1 );

  text( 0.2,  2.2, '$\ln\abs{x}$' )
  text( 6.8, -0.3, '$x$' )

  axis equal
  axis([ -6.9 6.9 -2.5, 2.5 ])
  set( gca, 'position', [ 0.05 0.05 0.9 0.9 ] )
  axis_math
  axis_commas
  hold off

  tex = latex_add_figure( tex, 'Função', 'fig_functions_log' );
  
  %----------------------------------------------------------------------------%

  latex_compile( tex );

end

%------------------------------------------------------------------------------%
