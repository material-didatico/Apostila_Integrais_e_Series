
function build_exemplo_sqrt_2

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

  tex = latex_figure_properties( tex, 'size', [14 3], 'type', 'tex', 'device', 'png' );

  N = 11;
  k = 1:(N+1);

  %---------------------------------------------------------------------------%

  a = ones(size(k));
  a(1) = 2;

  for ii = 2:N+1
    a(ii) = ( a(ii-1) + 2 / a(ii-1) ) / 2;
  end

  plot_sequence( N, k, a, -0.1, 2.2, 0:3 );

  k(end+1) = 0;
  a(end+1) = sqrt(2);
  erro = abs(a-sqrt(2));

  values = [ k' a' erro'];
  values(end+1,2) = sqrt(2);

  tex = latex_add_figure ( tex, 'Sequência que converge para $\sqrt{2}$', 'fig_exemplo_sqrt_2' );
  tex = latex_add_content( tex, [ '\[' array2latex( values, '%.16f' ) '\]' ]);
  tex = latex_add_content( tex, '\blindtext' );

  %---------------------------------------------------------------------------%

  latex_compile( tex );

end

%-----------------------------------------------------------------------------%
function plot_sequence( N, k, a, yo, yf, ytick )

  clf
  hold on

  s2 = sqrt(2);

  plot   ( [0 11],       [s2 s2],           'linewidth', 0.5, 'color', [.8 .8 .8] )
  plot   ( k(1:end-1),   a(1:end-1),        'linewidth', 0.5, 'color', [.8 .8 .8] )
  plot   ( k(end-1:end), a(end-1:end), ':', 'linewidth', 0.5, 'color', [.8 .8 .8] )
  scatter( k(1:end-1),   a(1:end-1), 16, 'b', 'filled' )

  axis([ -0.5 N+1 yo yf ])

  set( gca, 'xtick', 1:2:N, 'ytick', [1 s2 2], 'yticklabel', { '1', '$\sqrt{2}$', '2'} );
  set( gca, 'position', [0.05 0.05 0.9 0.9] )

  axis_commas
  axis_math

  text( N+1, -0.04*(yf-yo), '$k$', 'verticalalignment', 'top',    'horizontalalignment', 'center' )
  text( 0.2,  0.95*yf,    '$a_k$', 'verticalalignment', 'middle', 'horizontalalignment', 'left'  )

  hold off

end

%-----------------------------------------------------------------------------%
