
function build_taylor_bessel

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
  
  f  = @(x) besselj( 0, x );
  a  =  0;
  r  =  32;
  xo =  0;
  xf =  31;

  N = 36;

  C = zeros( 1, 2*N );
  C(1) = 1;

  for k = 1:N
    C(2*k+1) = -C(2*(k-1)+1) / (4*k^2);
  end

  plot_taylor_approx( f, a, r, C, xo, xf, 2*[ 1 5 10 15 20 25 30 35 ] );

  text( 0.5, 1.05, '$J_0(x)$', 'horizontalalignment', 'left' )

  text( 10.5, 0.8, '$P_{20}$', 'horizontalalignment', 'left' )
  text( 18.0, 0.8, '$P_{40}$', 'horizontalalignment', 'left' )
  text( 25.5, 0.8, '$P_{60}$', 'horizontalalignment', 'left' )

  text(  1.9, -0.4, '$P_{2}$',  'horizontalalignment', 'right' )
  text(  6.1, -0.4, '$P_{10}$', 'horizontalalignment', 'left' )
  text( 14.0, -0.4, '$P_{30}$', 'horizontalalignment', 'left' )
  text( 21.5, -0.4, '$P_{50}$', 'horizontalalignment', 'left' )
  text( 29.0, -0.4, '$P_{70}$', 'horizontalalignment', 'left' )

  axis([ -1 32 -0.6 1.1 ])

  set( gca, 'position', [0.01 0.05 0.96 0.94 ] )

  axis_math
  axis_commas
  hold off

  tex = latex_add_figure ( tex, 'Taylor', 'fig_taylor_bessel' ); 
  tex = latex_add_content( tex, '\blindtext' );

  %---------------------------------------------------------------------------%

  latex_compile( tex );

end

%-----------------------------------------------------------------------------%
