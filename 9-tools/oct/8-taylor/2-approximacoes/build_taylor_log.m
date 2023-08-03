
function build_taylor_log

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

  f  = @(x) log(x);
  a  = 1;
  r  = 2.1;
  xo = 0.01;
  xf = 3.1;

  n = 6;
  C = [ 0 (-1).^(0:n-1) ] ./ [1 1:n];

  plot_taylor_approx( f, a, r, C, xo, xf, [ 1 2 3 6 ]);
  plot( [ 2 2 ], [-3 3], 'k:' );

  text(  2.15, 1.34, '$P_1$' )
  text(  2.33, 1.30, '$P_3$' )

  text(  3.13, -0.20, '$P_2$' )
  text(  2.83, -2.14, '$P_6$' )

  set( gca, 'ytick', -2:1);
  axis([ -0.1 3.2 -2.2 1.2 ])

  set( gca, 'position', [0.01 0.05 0.96 0.94 ] )

  axis_math
  axis_commas
  hold off

  tex = latex_add_figure ( tex, 'Taylor', 'fig_taylor_log' ); 
  tex = latex_add_content( tex, '\blindtext' );

  %---------------------------------------------------------------------------%

  latex_compile( tex );

end

%-----------------------------------------------------------------------------%
