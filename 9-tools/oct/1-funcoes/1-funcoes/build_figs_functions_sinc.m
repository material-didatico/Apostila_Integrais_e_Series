
function build_figs_functions_sinc

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

  tex = latex_figure_properties( tex, 'size', [17 6], 'type', 'tex', 'device', 'png' );

  %----------------------------------------------------------------------------%

  clf 
  hold on

  x = linspace( -6.6*pi, 6.6*pi, 200 );
  y = sinc(x/pi);
  plot( x, y, 'b', 'linewidth', 1 );

  text( 1.5, 1, '$\sinc(x)$' )
  text( 6.7*pi, -0.07, '$x$' )

  % axis equal
  axis([ -6.8*pi 6.8*pi -0.3 1.1 ])
  set( gca, 'ytick', 1 )
  latex_ticklabel_radian( gca, 'x', 1 );
  set( gca, 'position', [ 0.05 0.05 0.9 0.9 ] )
  axis_math
  axis_commas
  hold off

  tex = latex_add_figure( tex, 'Função', 'fig_functions_sinc' );
  
  %----------------------------------------------------------------------------%

  latex_compile( tex );

end

%------------------------------------------------------------------------------%
