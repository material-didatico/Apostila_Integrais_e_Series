
function build_taylor_cos

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

  L = 3.1;

  f  = @(x) cos(x);
  a  = 0;
  r  =  L*pi;
  xo = -L*pi;
  xf =  L*pi;

  n = 8;
  s = (-1).^(0:n) ./ factorial( 2*(0:n) );
  C = reshape( [ s ; zeros(1,n+1) ], 1, 2*(n+1) );

  plot( [ -(L+0.1)*pi (L+0.1)*pi ], [  1  1 ], '-', 'color', [0.9 0.9 0.9] )
  plot( [ -(L+0.1)*pi (L+0.1)*pi ], [ -1 -1 ], '-', 'color', [0.9 0.9 0.9] )

  plot_taylor_approx( f, a, r, C(1:17), xo, xf, [4 8 12 16] );

  text( 3.28, 1.17, '$P_4$' )
  text( 4.50, 1.17, '$P_8$' )
  text( 5.45, 1.17, '$P_{12}$' )
  text( 7.30, 1.17, '$P_{16}$' )

  set( gca, 'ytick', -1:1);
  latex_ticklabel_radian( gca, 'x', 1 );
  axis([ -(L+0.1)*pi (L+0.1)*pi -1.1 1.1 ])

  set( gca, 'position', [0.01 0.05 0.96 0.94 ] )

  axis_math
  axis_commas
  hold off

  tex = latex_add_figure ( tex, 'Taylor', 'fig_taylor_cos' ); 
  tex = latex_add_content( tex, '\blindtext' );

  %---------------------------------------------------------------------------%

  latex_compile( tex );

end

%-----------------------------------------------------------------------------%
