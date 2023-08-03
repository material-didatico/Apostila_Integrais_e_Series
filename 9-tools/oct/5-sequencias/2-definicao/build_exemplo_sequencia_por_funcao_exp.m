
function build_exemplo_sequencia_por_funcao_exp

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

  figure_position( 1, 2, 2, 2 );

  tex = latex_figure_properties( tex, 'size', [14 5], 'type', 'tex', 'device', 'png' );

  %---------------------------------------------------------------------------%

  clf
  hold on

  f = @(x) ( 1 - 1./x.^2 ).^x;

  M = 4;

  x = [ linspace( -6, -1, 100 ) linspace( 1, 11, 100 ) ];
  y = f(x);
  y( abs(y)>2*M ) = NaN;

  k = 1:10;
  a = f(k);

  plot( [ -6 11 ], [1 1], 'linewidth', 0.5, 'color', [.7 .7 .7 ] )
  plot( x, y, 'm' );
  scatter( k, a, 16, 'b', 'filled' ) 

  axis([ -6 11 -0.2 3.7 ])
  set( gca, 'xtick', [-5 -1 1 5 10], 'ytick', 1:3 );
  set( gca, 'position', [0.05 0.05 0.9 0.9] )

  axis_commas
  axis_math

  text( -1.4, 3.3, '$f(x)$', 'verticalalignment', 'middle', 'horizontalalignment', 'right' )
  text(    8, 0.7, '$a_n$',  'verticalalignment', 'top',    'horizontalalignment', 'left' )

  hold off

  tex = latex_add_figure ( tex, 'Sequência', 'fig_exemplo_sequencia_por_funcao_exp' ); 
  tex = latex_add_content( tex, '\blindtext' );

  %---------------------------------------------------------------------------%

  latex_compile( tex );

end

%-----------------------------------------------------------------------------%
