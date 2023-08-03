
function build_sequencia_monotona

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

  tex = latex_figure_properties( tex, 'size', [8 3.6], 'type', 'tex', 'device', 'png' );
  tex = latex_set_subfigure    ( tex, 1, 2, 'Sequência' );

  N = 31;
  k = 1:(N+1);

  %---------------------------------------------------------------------------%

  a = cumsum((2*cos(k/5)).^2)/40-0.4;
  plot_sequence( N, k, a );

  tex = latex_add_figure ( tex, 'Sequência', 'fig_sequencia_monotona_1' ); 

  %---------------------------------------------------------------------------%

  a = 0.5 - 0.5 * atan( 0.6*(k-10) );
  plot_sequence( N, k, a );

  tex = latex_add_figure ( tex, 'Sequência', 'fig_sequencia_monotona_2' ); 

  %---------------------------------------------------------------------------%

  tex = latex_add_content( tex, '\blindtext' );
  latex_compile( tex );

end

%-----------------------------------------------------------------------------%
function plot_sequence( N, k, a )

  clf
  hold on

  plot   ( k(1:end-1),   a(1:end-1),    'linewidth', 0.5, 'color', [.8 .8 .8] )
  plot   ( k(end-1:end), a(end-1:end),  'linewidth', 0.5, 'color', [.8 .8 .8] )
  scatter( k(1:end-1),   a(1:end-1), 4, 'b', 'filled' )

  axis([ -0.5 N+1 -0.5 1.5 ])

  set( gca, 'xtick', [], 'ytick', [] );
  set( gca, 'position', [0.05 0.05 0.9 0.9] )

  axis_commas
  axis_math

  text( N+1, -0.08, '$n$',  'verticalalignment', 'top',    'horizontalalignment', 'center' )
  text( 0.4, 1.42, '$a_n$', 'verticalalignment', 'middle', 'horizontalalignment', 'left'   )

  hold off

end

%-----------------------------------------------------------------------------%
