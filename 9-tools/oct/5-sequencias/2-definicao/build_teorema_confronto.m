
function build_teorema_confronto

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

  tex = latex_figure_properties( tex, 'size', [14 5], 'type', 'tex', 'device', 'png' );

  N = 31;
  k = 1:(N+1);

  %---------------------------------------------------------------------------%

  clf
  hold on

  a = (k+2).^(-0.5) - N^(-0.5) + 0.6 + sin(k)./(k+1);
  a(end-2:end) = a(end-2);
  c = atan(k-10)/4 + 0.05;

  r = 0.4 * cos(k/5).^2 + 0.3;
  s = 1 - r;
  b = a .* r + c .* s;

  L = (a(end) + c(end)) / 2;

  plot( [0 N+1], [L L], 'linewidth', 0.5, 'color', [.9 .9 .9] )
  text( -0.4, L, '$L$', 'verticalalignment', 'middle', 'horizontalalignment', 'right'  )

  plot_sequence( k(1:2:end), a(1:2:end), 'b' );
  plot_sequence( k(1:2:end), b(1:2:end), 'm' );
  plot_sequence( k(1:2:end), c(1:2:end), 'b' );

  axis([ -0.5 N+1 -0.5 1.5 ])
  set( gca, 'xtick', [], 'ytick', [] );
  set( gca, 'position', [0.05 0.05 0.9 0.9] )

  axis_math

  text( N+1, -0.08, '$n$',   'verticalalignment', 'top',    'horizontalalignment', 'center' )
  text( 2.7,  1.10, '$c_n$', 'verticalalignment', 'middle', 'horizontalalignment', 'left'   )
  text( 3.6,  0.38, '$b_n$', 'verticalalignment', 'middle', 'horizontalalignment', 'left'   )
  text( 2.2, -0.42, '$a_n$', 'verticalalignment', 'middle', 'horizontalalignment', 'left'   )

  hold off

  tex = latex_add_figure ( tex, 'Sequência', 'fig_teorema_confronto' ); 

  %---------------------------------------------------------------------------%

  tex = latex_add_content( tex, '\blindtext' );
  latex_compile( tex );

end

%-----------------------------------------------------------------------------%
function plot_sequence( k, a, c )

  plot   ( k(1:end-1),   a(1:end-1),    'linewidth', 0.5, 'color', [.8 .8 .8] )
  plot   ( k(end-1:end), a(end-1:end),  'linewidth', 0.5, 'color', [.8 .8 .8] )
  scatter( k(1:end-1),   a(1:end-1), 5, c, 'filled' )


end

%-----------------------------------------------------------------------------%
