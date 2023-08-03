
function build_sequencia_limite

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
  tex = latex_add_content ( tex, '\blindtext' );

  figure_position( 1, 2, 2, 2 );

  tex = latex_figure_properties( tex, 'size', [16 5], 'type', 'tex', 'device', 'png' );

  n = 31;
  k = 1:(n+1);

  %---------------------------------------------------------------------------%

  a = min( 1.3, atan( k-10 )/pi + 3*sin(k) ./ k.^1.2 + 0.5 );
  a(2) = 0.9;

  N = 16;

  clf
  hold on

  plot( [0 n+1], [1.2 1.2], 'linewidth', 0.5, 'color', 'm' )
  plot( [0 n+1], [1.0 1.0], 'linewidth', 0.5, 'color', [ 0.7 0.7 0.7 ] )
  plot( [0 n+1], [0.8 0.8], 'linewidth', 0.5, 'color', 'm' )
  plot( [N N],   [ 0 a(N)], 'linewidth', 0.5, 'color', [ 0.7 0.7 0.7 ] )
  plot_sequence( n, k, a );

  text( -0.4, 1.5, '$a_n$',           'verticalalignment', 'middle', 'horizontalalignment', 'right'  )
  text( -0.4, 1.2, '$L+\varepsilon$', 'verticalalignment', 'bottom', 'horizontalalignment', 'right'  )
  text( -0.4, 1.0, '$L\;\;\,$',       'verticalalignment', 'bottom', 'horizontalalignment', 'right'  )
  text( -0.4, 0.8, '$L-\varepsilon$', 'verticalalignment', 'bottom', 'horizontalalignment', 'right'  )
  text(  N, -0.08, '$N$',             'verticalalignment', 'top',    'horizontalalignment', 'center' )

  hold off

  tex = latex_add_figure ( tex, 'Sequência', 'fig_sequencia_limite' ); 

  %---------------------------------------------------------------------------%

  a = k.^1.65 / 13^2 - sin(k+2)./k.^0.6 + 0.2;

  M = 1.23;
  N = 27;

  clf
  hold on

  plot( [0 n+1], [M M],     'linewidth', 0.5, 'color', 'm' )
  plot( [N N],   [ 0 a(N)], 'linewidth', 0.5, 'color', [ 0.7 0.7 0.7 ] )
  plot_sequence( n, k, a );
  ylim([ -0.2 2 ])

  text( -0.4, 1.9, '$a_n$', 'verticalalignment', 'middle', 'horizontalalignment', 'right'  )
  text( -0.4,   M, '$M$',   'verticalalignment', 'bottom', 'horizontalalignment', 'right'  )
  text(  N, -0.08, '$N$',   'verticalalignment', 'top',    'horizontalalignment', 'center' )

  hold off

  tex = latex_add_figure ( tex, 'Sequência', 'fig_sequencia_infinity' ); 

  %---------------------------------------------------------------------------%

  tex = latex_add_content( tex, '\blindtext' );
  latex_compile( tex );

end

%-----------------------------------------------------------------------------%
function plot_sequence( N, k, a )

  plot   ( k(1:end-1),   a(1:end-1),    'linewidth', 0.5, 'color', [.8 .8 .8] )
  plot   ( k(end-1:end), a(end-1:end),  'linewidth', 0.5, 'color', [.8 .8 .8] )
  scatter( k(1:end-1),   a(1:end-1), 16, 'b', 'filled' )

  axis([ -0.5 N+1 -0.5 1.5 ])

  set( gca, 'xtick', [], 'ytick', [] );
  set( gca, 'position', [0.05 0.05 0.9 0.9] )

  axis_commas
  axis_math

  text(  N+1, -0.08, '$n$',   'verticalalignment', 'top',    'horizontalalignment', 'center' )

end

%-----------------------------------------------------------------------------%
