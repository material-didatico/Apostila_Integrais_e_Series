
function build_taylor_sqrt3

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
  
  f  = @(x) (1+x).^(1/3);
  a  =  0;
  r  =  1.0;
  xo = -1.0;
  xf =  1.3;

  C = [ 1 1/3 -1/9 5/81 ];

  plot( [ 0.5 0.5 0 ], [ 0 f(0.5) f(0.5) ], 'linewidth', 0.5, 'color', [.8 .8 .8] )

  plot_taylor_approx( f, a, r, C, xo, xf, 3 );

  plot( 0.5, f(0.5), 'm.', 'markersize', 13 );

  text( -0.95, 0.65, '$P_3$',          'horizontalalignment', 'left' )
  text( -0.97, 0.2, '$\sqrt[3]{1+x}$', 'horizontalalignment', 'left' )

  axis([ -1.1 1.1 -0.1 1.3 ])

  set( gca, 'xtick', [ -1 0.5 1 ], 'xticklabel', {'-1,0' '0,5' '1,0'},
            'ytick', [ 1 1.1466 ], 'yticklabel', { '1' '1,1466'} );

  set( gca, 'position', [0.01 0.05 0.96 0.94 ] )

  axis_math
  hold off

  tex = latex_add_figure ( tex, 'Taylor', 'fig_taylor_sqrt3' ); 
  tex = latex_add_content( tex, '\blindtext' );

  %---------------------------------------------------------------------------%

  latex_compile( tex );

end

%-----------------------------------------------------------------------------%
