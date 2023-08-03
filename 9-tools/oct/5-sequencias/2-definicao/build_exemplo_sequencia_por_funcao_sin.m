
function build_exemplo_sequencia_por_funcao_sin

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

  f = @(x) sin( pi * x );

  x = linspace( -5.3, 10.8, 300 );
  y = f(x);

  k = 1:10;
  a = f(k);

  plot( x, y, 'm' );
  scatter( k, a, 16, 'b', 'filled' ) 

  axis([ -6 11 -1.3 1.3 ])
  set( gca, 'xtick', -4:2:12, 'ytick', [-1 1] );
  set( gca, 'position', [0.05 0.05 0.9 0.9] )

  axis_commas
  axis_math

  text( 1.0, 1.0, '$f(x)$', 'verticalalignment', 'middle', 'horizontalalignment', 'left' )
  text( 7.2, 0.1, '$a_n$',  'verticalalignment', 'bottom', 'horizontalalignment', 'left' )

  hold off

  tex = latex_add_figure ( tex, 'Sequência', 'fig_exemplo_sequencia_por_funcao_sin' ); 
  tex = latex_add_content( tex, '\blindtext' );

  %---------------------------------------------------------------------------%

  latex_compile( tex );

end

%-----------------------------------------------------------------------------%
