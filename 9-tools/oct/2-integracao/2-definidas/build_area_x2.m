
function build_area_x2

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

  tex = latex_add_preamble( tex, '\usepackage{xcolor}\definecolor{background}{HTML}{EEEEEE}\pagecolor{background}' );

  figure_position( 1, 2, 2, 2 );

  tex = latex_figure_properties( tex, 'size', [14 5], 'type', 'tex', 'device', 'png' );

  %---------------------------------------------------------------------------%

  a = 0;
  b = 3;

  x = linspace( a, b, 200);
  y = x.^2;

  Vx = [ b a x b ];
  Vy = [ 0 0 y 0 ];

  x = linspace( a, b+0.5, 200);
  y = x.^2;

  r = y(1);
  s = b^2;

  [ My Mi ] = max(y);
  [ my mi ] = min(y);

  Mx = x(Mi);
  mx = x(mi);

  C  = 0.95*[ 1 1 1 ];
  aa = [ -0.2 3.6 -0.1*My 1.1*My ];

  %---------------------------------------------------------------------------%

  clf
  hold on

  px = linspace(0, b, 9 );
  py = px.^2;

  hf = fill( Vx, Vy, C, 'linewidth', 0.1 );
  % hp = plot( px([1:6 8:9]), zeros(1,8), 'm.', 'markersize', 12 );

  text( 3.6, 13, '$y=x^2$' )

  axis(aa)
  set(gca, 'ytick', [], 'xtick', b, 'xticklabel', '$b$' )

  plot( x, y, 'b' )

  axis_math
  axis_commas

  tex = latex_add_figure ( tex, 'Área $x^2$', 'fig_area_x2' );

  tx = px + 0.05;
  tx(1) -= 0.04;
  tx(9) += 0.1;

  text( tx(2), -1.9, '$x_1$',     'horizontalalignment', 'center', 'verticalalignment', 'bottom' )
  text( tx(3), -1.9, '$x_2$',     'horizontalalignment', 'center', 'verticalalignment', 'bottom' )
  text( tx(4), -1.9, '$x_3$',     'horizontalalignment', 'center', 'verticalalignment', 'bottom' )
  text( tx(5), -1.9, '$x_4$',     'horizontalalignment', 'center', 'verticalalignment', 'bottom' )
  text( tx(6), -1.9, '$x_5$',     'horizontalalignment', 'center', 'verticalalignment', 'bottom' )
  text( tx(7), -1.9, '$\cdots$',  'horizontalalignment', 'center', 'verticalalignment', 'bottom' )
  text( tx(8), -1.9, '$x_{n-1}$', 'horizontalalignment', 'center', 'verticalalignment', 'bottom' )
  text( tx(9), -1.9, '$b=x_n$',   'horizontalalignment', 'center', 'verticalalignment', 'bottom' )

  % tex = latex_add_figure ( tex, 'Soma de Riemman - partição', 'fig_soma_riemman_particao' );
  % tex = latex_add_content( tex, '\blindtext' );

  %---------------------------------------------------------------------------%


  jj = [ 1:5 8 ];

  for kk = 1:length(jj)

    ll = jj(kk);

    fill( px([ll ll ll+1 ll+1 ll]), [0 py(ll+1) py(ll+1) 0 0 ], C,
          'edgecolor', 'm',
          'linewidth', 0.3 )
  end

  tx += 0.1;
  text( tx(1), py(1)+0.4, '$A_1$', 'horizontalalignment', 'left', 'verticalalignment', 'bottom' )
  text( tx(2), py(2)+0.9, '$A_2$', 'horizontalalignment', 'left', 'verticalalignment', 'bottom' )
  text( tx(3), py(3)+1.1, '$A_3$', 'horizontalalignment', 'left', 'verticalalignment', 'bottom' )
  text( tx(4), py(4)+1.5, '$A_4$', 'horizontalalignment', 'left', 'verticalalignment', 'bottom' )
  text( tx(5), py(5)+1.8, '$A_5$', 'horizontalalignment', 'left', 'verticalalignment', 'bottom' )
  text( tx(8), py(8)+2.4, '$A_n$', 'horizontalalignment', 'left', 'verticalalignment', 'bottom' )

  plot( x, y, 'b' )
  set(gca, 'xtick', [] )
  set( hf, 'visible', 'off')

  tex = latex_add_figure ( tex, 'Área $x^2$ - retângulos', 'fig_area_x2_retangulos' );
  % tex = latex_add_content( tex, '\blindtext' );

  %---------------------------------------------------------------------------%

  hold off

  latex_compile( tex );

end

%-----------------------------------------------------------------------------%





