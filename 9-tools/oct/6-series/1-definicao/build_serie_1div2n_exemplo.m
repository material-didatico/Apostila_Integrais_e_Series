
function build_serie_1div2n_exemplo

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

  %---------------------------------------------------------------------------%

  N = 9;
  n = 1:N;
  a = 1 ./ 2.^(n);

  clf
  hold on

  plot_serie( a, 'right', [-0.2  N+0.5] );

  ylim([ -0.05 0.6 ])

  set( gca, 'xtick', 1:N, 'ytick', [0.25 0.5], 'yticklabel', { '0,25' '0,50' } );
  set( gca, 'position', [0.05 0.05 0.9 0.9] )

  axis_math

  text( N+0.5, -0.05, '$n$', 'verticalalignment', 'top', 'horizontalalignment', 'center' )

  for n = 1:N-1
    text( n+0.5, a(n)+0.02, 
          sprintf( '$a_{%d}$', n ), 
          'verticalalignment', 'baseline', 
          'horizontalalignment', 'center' )
  end

  hold off

  tex = latex_add_figure ( tex, 'Série', 'fig_serie_1div2n_exemplo_1' ); 
  tex = latex_add_content( tex, '\blindtext' );

  %---------------------------------------------------------------------------%

  N = 9;
  n = 1:N;
  a = 1 ./ 2.^(n);
  s = cumsum( a );

  clf
  hold on

  plot( [0 N+1], [1 1],          'linewidth', 0.5, 'color', [.8 .8 .8] )
  plot( [0 1 1], [.5 .5 0], ':', 'linewidth', 0.5, 'color', [.8 .8 .8] )

  plot   ( n, s, 'linewidth', 0.5, 'color', [.8 .8 .8] )
  scatter( n, s, 16, 'b', 'filled' )

  axis([ -0.2 N+0.5 -0.2 1.2 ])

  set( gca, 'xtick', 1:N, 'ytick', [0.5 1], 'yticklabel', { '0,5' '1,0' } );
  set( gca, 'position', [0.05 0.05 0.9 0.9] )

  axis_math

  text( N+0.5, -0.05, '$n$',   'verticalalignment', 'top',    'horizontalalignment', 'center' )
  text(   0.1,  1.10, '$S_n$', 'verticalalignment', 'bottom', 'horizontalalignment', 'left'   )

  hold off

  tex = latex_add_figure ( tex, 'Série', 'fig_serie_1div2n_exemplo_S' ); 
  tex = latex_add_content( tex, '\blindtext' );

  %---------------------------------------------------------------------------%

  latex_compile( tex );

end

%-----------------------------------------------------------------------------%
