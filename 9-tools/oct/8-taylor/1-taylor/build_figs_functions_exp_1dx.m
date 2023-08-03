
function build_figs_functions_exp_1dx

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

  L = 8;

  x = [ linspace( 0.01, 0.5, 50 ) linspace( 0.5, L+0.1, 100 ) ];
  y = exp( -1./x );

  plot( [ -2.1 0 x ], [ 0 0 y ], 'b', 'linewidth', 2 );
  plot( [ -2.2 L+0.2 ], [ 1 1 ], '-', 'color', [ 0.9 0.9 0.9 ] )

  % text( 1.5, 1, '$\sinc(x)$' )
  % text( 6.7*pi, -0.07, '$x$' )

  axis([ -2.2 L+0.2 -0.2 1.1 ])
  set( gca, 'ytick', 0:0.5:1 )
  % set( gca, 'xtick', [ -2 5:5:15 ] )
  set( gca, 'position', [ 0.05 0.05 0.9 0.9 ] )
  axis_math
  axis_commas
  hold off

  tex = latex_add_figure( tex, 'Função', 'fig_functions_exp_1dx' );
  
  %----------------------------------------------------------------------------%

  latex_compile( tex );

end

%------------------------------------------------------------------------------%
