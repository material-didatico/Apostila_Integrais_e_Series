
function build_valor_medio

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

  hf = fill( [a b b a a], [0 0 My My 0], C, 'linewidth', 0.1 );

  plot( [a a], [0 r], 'k', 'linewidth', 0.2)
  plot( [b b], [0 s], 'k', 'linewidth', 0.2)
  plot( [Mx Mx 0], [0 My My], 'k', 'linewidth', 0.2)
  plot( [mx mx 0], [0 my my], 'k', 'linewidth', 0.2)
  plot( [Mx mx], [My my], 'b.', 'markersize', 12)
  plot( x, y, 'b' )

  text( b+0.2, s+0.2, '$y=f(x)$' )
  % h = text( 2.2, 2.1, '\(A\)' );

  axis(aa)
  set(gca, 'ytick', [My my],     'yticklabel', {'$f(u)$', '$f(v)$'},
           'xtick', [a b Mx mx], 'xticklabel', {'$a$', '$\;b$', '$u$', '$v$'} )

  axis_math
  axis_commas

  tex = latex_add_figure ( tex, 'Máximo', 'fig_valor_medio_maximo' );

  set(hf, 'ydata', [0 0 my my 0]')

  tex = latex_add_figure ( tex, 'Mínimo', 'fig_valor_medio_minimo' );

  Y = sum(y)/200;
  Y = abs( y-Y );

  [ nn ci ] = min(Y(1:150));

  Yc = y(ci);
  Xc = x(ci);

  set(hf, 'ydata', [0 0 Yc Yc 0]')

  plot( [Xc Xc 0], [0 Yc Yc], 'k', 'linewidth', 0.2)
  plot( Xc, Yc, 'b.', 'markersize', 12)

  set(gca, 'ytick', [My my Yc],     'yticklabel', {'$f(u)$', '$f(v)$', '$f(c)$'},
           'xtick', [a b Mx mx Xc], 'xticklabel', {'$a$', '$\;b$', '$u$', '$v$', '$c$'} )

  tex = latex_add_figure ( tex, 'Média', 'fig_valor_medio_media' );

  %---------------------------------------------------------------------------%

  hold off

  latex_compile( tex );

end

%-----------------------------------------------------------------------------%





