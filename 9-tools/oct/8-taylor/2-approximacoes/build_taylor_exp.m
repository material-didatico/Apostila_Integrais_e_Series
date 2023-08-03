
function build_taylor_exp

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
  
  f  = @(x) exp(x);
  a  =  0;
  r  =  3.1;
  xo = -3.1;
  xf =  2.1;

  C = 1 ./ factorial( 0:5 );

  plot_taylor_approx( f, a, r, C, xo, xf );

  text( -1.86, -0.7, '$P_1$' )
  text( -2.48, -0.7, '$P_3$' )
  text( -3.21, -0.7, '$P_5$' )

  text( -3.12, 1.65, '$P_2$', 'horizontalalignment', 'right' )
  text( -3.12, 2.75, '$P_4$', 'horizontalalignment', 'right' )

  axis([ -3.2 2.2 -0.7 4.2 ])

  set( gca, 'position', [0.01 0.05 0.96 0.94 ] )

  axis_math
  axis_commas
  hold off

  tex = latex_add_figure ( tex, 'Taylor', 'fig_taylor_exp' ); 
  tex = latex_add_content( tex, '\blindtext' );

  %---------------------------------------------------------------------------%

  latex_compile( tex );

end

%-----------------------------------------------------------------------------%
