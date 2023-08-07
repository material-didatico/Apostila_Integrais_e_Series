
function build_riemman

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

  % tex = latex_add_preamble( tex, '\usepackage{blindtext}' );
  tex = latex_add_preamble( tex, '\usepackage{xcolor}\definecolor{background}{HTML}{EEEEEE}\pagecolor{background}' );

  figure_position( 1, 2, 2, 2 );

  tex = latex_figure_properties( tex, 'size', [14 5], 'type', 'tex', 'device', 'png' );

  %---------------------------------------------------------------------------%

  a = 0.5;
  b = 4;

  x = linspace( a, b, 200);
  y = poly3( a, b, 5, 4.5, 7, 25, x );

  r = y(1);
  s = y(end);

  [ My Mi ] = max(y);
  [ my mi ] = min(y);

  Mx = x(Mi);
  mx = x(mi);

  C  = 0.95*[ 1 1 1 ];
  aa = [ -0.2 5 -0.1*My 1.1*My ];

  %---------------------------------------------------------------------------%

  clf
  hold on

  ii = resample_index(200, 9);
  px = x(ii);
  py = y(ii);


  plot( [a a], [0 r], 'k', 'linewidth', 0.2)
  plot( [b b], [0 s], 'k', 'linewidth', 0.2)
  plot( x, y, 'b' )

  h = plot( px([1:6 8:9]), zeros(1,8), 'm.', 'markersize', 12 );

  text( b+0.2, s+0.2, '$y=f(x)$' )

  axis(aa)
  set(gca, 'ytick', [], 'xtick', [] )

  tx = px + 0.05;
  tx(1) -= 0.04;
  tx(9) += 0.08;

  text( tx(1), -0.9, '$a=x_0$',   'horizontalalignment', 'center', 'verticalalignment', 'bottom' )
  text( tx(2), -0.9, '$x_1$',     'horizontalalignment', 'center', 'verticalalignment', 'bottom' )
  text( tx(3), -0.9, '$x_2$',     'horizontalalignment', 'center', 'verticalalignment', 'bottom' )
  text( tx(4), -0.9, '$x_3$',     'horizontalalignment', 'center', 'verticalalignment', 'bottom' )
  text( tx(5), -0.9, '$x_4$',     'horizontalalignment', 'center', 'verticalalignment', 'bottom' )
  text( tx(6), -0.9, '$x_5$',     'horizontalalignment', 'center', 'verticalalignment', 'bottom' )
  text( tx(7), -0.9, '$\cdots$',  'horizontalalignment', 'center', 'verticalalignment', 'bottom' )
  text( tx(8), -0.9, '$x_{n-1}$', 'horizontalalignment', 'center', 'verticalalignment', 'bottom' )
  text( tx(9), -0.9, '$b=x_n$',   'horizontalalignment', 'center', 'verticalalignment', 'bottom' )

  axis_math
  axis_commas

  tex = latex_add_figure ( tex, 'Soma de Riemman - partição', 'fig_soma_riemman_particao' );
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
  text( tx(1), 0.6, '$A_1$', 'horizontalalignment', 'left', 'verticalalignment', 'bottom' )
  text( tx(2), 0.6, '$A_2$', 'horizontalalignment', 'left', 'verticalalignment', 'bottom' )
  text( tx(3), 0.6, '$A_3$', 'horizontalalignment', 'left', 'verticalalignment', 'bottom' )
  text( tx(4), 0.6, '$A_4$', 'horizontalalignment', 'left', 'verticalalignment', 'bottom' )
  text( tx(5), 0.6, '$A_5$', 'horizontalalignment', 'left', 'verticalalignment', 'bottom' )
  text( tx(8), 0.6, '$A_n$', 'horizontalalignment', 'left', 'verticalalignment', 'bottom' )

  plot( x, y, 'b' )
  set(h, 'visible', 'off')

  tex = latex_add_figure ( tex, 'Soma de Riemman - retângulos', 'fig_soma_riemman_retangulos' );
  % tex = latex_add_content( tex, '\blindtext' );

  %---------------------------------------------------------------------------%

  hold off

  latex_compile( tex );

end

%-----------------------------------------------------------------------------%





