
function build_integral_definida

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

  Vx = [ b a x b ];
  Vy = [ 0 0 y 0 ];

  %---------------------------------------------------------------------------%

  clf
  hold on

  fill( Vx, Vy, C, 'linewidth', 0.1 )

  plot( [a a], [0 r], 'k', 'linewidth', 0.2)
  plot( [b b], [0 s], 'k', 'linewidth', 0.2)
  plot( x, y, 'b' )

  text( b+0.2, s+0.2, '$y=f(x)$' )
  h = text( 1.2, 1.9, '\(A\)' );

  axis(aa)
  set(gca, 'ytick', [],
           'xtick', [a b], 'xticklabel', {'$a$', '$\;b$'} )

  axis_math
  axis_commas

  tex = latex_add_figure ( tex, 'Integral definida - área', 'fig_integral_definida_area' );
  % tex = latex_add_content( tex, '\blindtext' );

  set( h, 'string', '\(\displaystyle A=\int_a^b f(x)\,dx\)',
          'position', [0.8 1.9 0]);

  tex = latex_add_figure ( tex, 'Integral definida - integral', 'fig_integral_definida' );
  % tex = latex_add_content( tex, '\blindtext' );

  %---------------------------------------------------------------------------%

  hold off

  latex_compile( tex );

end

%-----------------------------------------------------------------------------%





