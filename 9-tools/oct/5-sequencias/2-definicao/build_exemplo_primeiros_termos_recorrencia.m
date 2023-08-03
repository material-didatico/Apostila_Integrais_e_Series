
function build_exemplo_primeiros_termos_recorrencia

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

  a = repmat(0.8, size(k)).^k;
  plot_sequence( N, k, a, -0.1, 1.0, 0.4:0.4:0.8 );

  tex = latex_add_figure ( tex, 'Sequência', 'fig_exemplo_primeiros_termos_recorrencia_1' );
  tex = latex_add_content( tex, '\blindtext' );

  %---------------------------------------------------------------------------%

  a = ones(size(k));
  for ii = 3:N+1
    a(ii) = a(ii-1) + a(ii-2);
  end
  plot_sequence( N, k, a, 0, 110, 50:50:100 );

  tex = latex_add_figure ( tex, 'Sequência', 'fig_exemplo_primeiros_termos_recorrencia_2' );
  tex = latex_add_content( tex, '\blindtext' );

  %---------------------------------------------------------------------------%

  a = ones(size(k));
  for ii = 2:N+1
    a(ii) = a(ii-1) / ii;
  end
  plot_sequence( N, k, a, -0.1, 1.1, 0.5:0.5:1 );

  tex = latex_add_figure ( tex, 'Sequência', 'fig_exemplo_primeiros_termos_recorrencia_3' );
  tex = latex_add_content( tex, '\blindtext' );

  %---------------------------------------------------------------------------%

  latex_compile( tex );

end

%-----------------------------------------------------------------------------%
function plot_sequence( N, k, a, yo, yf, ytick )

  clf
  hold on

  plot   ( k(1:end-1),   a(1:end-1),        'linewidth', 0.5, 'color', [.8 .8 .8] )
  plot   ( k(end-1:end), a(end-1:end), ':', 'linewidth', 0.5, 'color', [.8 .8 .8] )
  scatter( k(1:end-1),   a(1:end-1), 16, 'b', 'filled' )

  axis([ -0.5 N+1 yo yf ])

  set( gca, 'xtick', 1:2:N, 'ytick', ytick );
  set( gca, 'position', [0.05 0.05 0.9 0.9] )

  axis_commas
  axis_math

  text( N+1, -0.04*(yf-yo), '$k$', 'verticalalignment', 'top',    'horizontalalignment', 'center' )
  text( 0.2,  0.95*yf,    '$a_k$', 'verticalalignment', 'middle', 'horizontalalignment', 'left'  )

  hold off

end

%-----------------------------------------------------------------------------%
