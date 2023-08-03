
function build_taylor_1div1mx

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
                      % 'dryrun',   true,
                      'class', 'article',  
                      'model', latex_model );

  tex = latex_add_preamble( tex, '\usepackage{blindtext}' );                    
  tex = latex_add_content ( tex, '\blindtext' );

  figure_position( 1, 2, 2, 2 );

  tex = latex_figure_properties( tex, 'size', [17 7], 'type', 'tex', 'device', 'png' );

  %---------------------------------------------------------------------------%
  clf
  hold on
  
  f  = @(x) 1 ./ ( 1 - x );
  a  =  0;
  r  =  3;
  xo = -3.1;
  xf =  0.99;

  C = ones( 1, 5 );

  plot_taylor_approx( f, a, r, C, xo, xf );
  plot( [ -1 -1 ], [0 5], 'k:' );
  plot( [  1  1 ], [0 5], 'k:' );

  text( 1.05, 2.0, '$P_1$', 'horizontalalignment', 'left' )
  text( 1.05, 3.0, '$P_2$', 'horizontalalignment', 'left' )
  text( 1.05, 4.0, '$P_3$', 'horizontalalignment', 'left' )
  text( 1.05, 4.8, '$P_4$', 'horizontalalignment', 'left' )

  text( 0.73, 4.5, '\(\dfrac{1}{1-x}\)', 'horizontalalignment', 'right' )

  axis([ -1.2 1.2 -0.5 4.8 ])

  set( gca, 'xtick', [ -1 1 ] );

  set( gca, 'position', [0.01 0.05 0.96 0.94] )

  axis_math
  hold off

  tex = latex_add_figure ( tex, 'Taylor', 'fig_taylor_1div1mx' ); 
  tex = latex_add_content( tex, '\blindtext' );

  %---------------------------------------------------------------------------%

  latex_compile( tex );

end

%-----------------------------------------------------------------------------%
