
function build_teorema_funcao_continua

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

  tex = latex_figure_properties( tex, 'size', [9 4], 'type', 'tex', 'device', 'png' );
  tex = latex_set_subfigure    ( tex, 1, 2, 'Sequência' );

  f = @(x) cos( x );
  g = @(x) sin( x );

  %---------------------------------------------------------------------------%

  clf
  hold on

  x = linspace( -3.3, 3.3, 100 );
  y = g(x);

  k = 1:20;
  a = (-1).^k./k.^1.5;
  b = g(a);

  an = a(2);
  fn = b(2);

  plot( [ an an 0 ], [ 0 fn fn ], 'linewidth', 0.5, 'color', [.7 .7 .7] )
  plot( x, y, 'm' );
  scatter( a, b, 6, 'b', 'filled' ) 

  axis([ -3.3 3.3 -1.1 1.1 ])
  set( gca, 'ytick', [-1 1] );
  set( gca, 'position', [0.05 0.05 0.9 0.9] )

  latex_ticklabel_radian( 'x', 1 );
  axis_commas
  axis_math

  text( -0.2, fn, '$b_n=f(a_n)$', 'verticalalignment', 'middle', 'horizontalalignment', 'right' )
  text( an, -0.1, '$a_n$',        'verticalalignment', 'top',    'horizontalalignment', 'left'  )

  hold off

  tex = latex_add_figure ( tex, 'Sequência', 'fig_teorema_funcao_continua_1' ); 

  %---------------------------------------------------------------------------%

  clf
  hold on

  s = linspace( 0, 3.3, 100 );
  r = -fliplr(s);
  x = [   r  NaN   s  ];
  y = [ f(r) NaN g(s) ];

  k = 1:10;
  a = [   1./k.^1.5    -1./k.^1.5  ];
  b = [ g(1./k.^1.5) f(-1./k.^1.5) ];

  an = a(2);
  fn = b(2);

  plot( [ an an 0 ], [ 0 fn fn ], 'linewidth', 0.5, 'color', [.7 .7 .7] )
  plot( x, y, 'm' );
  scatter( a, b, 6, 'b', 'filled' ) 

  axis([ -3.3 3.3 -1.1 1.1 ])
  set( gca, 'ytick', [-1 1] );
  set( gca, 'position', [0.05 0.05 0.9 0.9] )

  latex_ticklabel_radian( 'x', 1 );
  axis_commas
  axis_math

  text( -0.2, fn, '$c_n=g(a_n)$', 'verticalalignment', 'middle', 'horizontalalignment', 'right' )
  text( an, -0.1, '$a_n$',        'verticalalignment', 'top',    'horizontalalignment', 'left'  )

  hold off

  tex = latex_add_figure ( tex, 'Sequência', 'fig_teorema_funcao_continua_2' ); 

  %---------------------------------------------------------------------------%

  latex_compile( tex );

end

%-----------------------------------------------------------------------------%
