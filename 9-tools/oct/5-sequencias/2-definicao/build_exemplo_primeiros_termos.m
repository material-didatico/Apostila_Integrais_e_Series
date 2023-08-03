
function build_exemplo_primeiros_termos

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
  plot_sequence( N, k, a, -0.1, 1.6, 1 );

  tex = latex_add_figure ( tex, 'Sequência', 'fig_exemplo_primeiros_termos_1' ); 
  tex = latex_add_content( tex, '\blindtext' );

  %---------------------------------------------------------------------------%

  a = ones(size(k)) + (-1).^k;
  plot_sequence( N, k, a, -0.1, 2.2, 1:2 );

  tex = latex_add_figure ( tex, 'Sequência', 'fig_exemplo_primeiros_termos_2' ); 
  tex = latex_add_content( tex, '\blindtext' );

  %---------------------------------------------------------------------------%

  a = 1./k;
  plot_sequence( N, k, a, -0.1, 1.1, 1 );

  tex = latex_add_figure ( tex, 'Sequência', 'fig_exemplo_primeiros_termos_3' ); 
  tex = latex_add_content( tex, '\blindtext' );

  %---------------------------------------------------------------------------%

  a = (-1).^k./k.^2;
  plot_sequence( N, k, a, -1.1, 1.1, [-1 1] );

  tex = latex_add_figure ( tex, 'Sequência', 'fig_exemplo_primeiros_termos_6' ); 
  tex = latex_add_content( tex, '\blindtext' );

  %---------------------------------------------------------------------------%

  k = 0:(N+1);

  a = k.^2;
  plot_sequence( N, k, a, -10, 130, 100 );

  tex = latex_add_figure ( tex, 'Sequência', 'fig_exemplo_primeiros_termos_4' ); 
  tex = latex_add_content( tex, '\blindtext' );

  %---------------------------------------------------------------------------%

  a = (-1).^k.*k.^2;
  plot_sequence( N, k, a, -130, 130, [ -100 100 ] );

  tex = latex_add_figure ( tex, 'Sequência', 'fig_exemplo_primeiros_termos_5' ); 
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
