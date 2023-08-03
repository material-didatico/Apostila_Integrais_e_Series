
function build_sequencia_divergente

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

  tex = latex_figure_properties( tex, 'size', [16 4], 'type', 'tex', 'device', 'png' );

  N = 51;
  k = 1:N;

  %---------------------------------------------------------------------------%

  a = k.^2/N.^1.8 + 0.05;
  plot_sequence( k, a, -0.1, 1.6 );

  tex = latex_add_figure ( tex, 'Sequência divergente', 'fig_sequencia_divergente_1' ); 
  tex = latex_add_content( tex, '\blindtext' );

  %---------------------------------------------------------------------------%

  a = 1.35 - k.^2.3/N.^2;
  plot_sequence( k, a, -0.7, 1.7 );

  tex = latex_add_figure ( tex, 'Sequência divergente', 'fig_sequencia_divergente_2' ); 
  tex = latex_add_content( tex, '\blindtext' );

  %---------------------------------------------------------------------------%

  a = sin( (pi/2) * k ) + 1.7;
  plot_sequence( k, a, -0.3, 3.5 );

  tex = latex_add_figure ( tex, 'Sequência divergente', 'fig_sequencia_divergente_3' ); 
  tex = latex_add_content( tex, '\blindtext' );

  %---------------------------------------------------------------------------%

  r = 3.7;

  a = zeros( size(k));
  a(1) = 0.5;

  for ii = 1:N-1
    a(ii+1) = r * a(ii) * ( 1 - a(ii)  );
  end
  
  plot_sequence( k, a, -0.1, 1.2 );

  tex = latex_add_figure ( tex, 'Sequência divergente', 'fig_sequencia_divergente_4' ); 
  tex = latex_add_content( tex, '\blindtext' );

  %---------------------------------------------------------------------------%

  latex_compile( tex );

end

%-----------------------------------------------------------------------------%
function plot_sequence( k, a, yo, yf )

  clf
  hold on

  plot   ( k,            a,         'linewidth', 0.5, 'color', [.8 .8 .8] )
  scatter( k(1:end-1),   a(1:end-1), 16, 'b', 'filled' )

  axis([ -0.5 k(end) yo yf ])

  set( gca, 'xtick', [], 'ytick', [] );
  set( gca, 'position', [0.05 0.05 0.9 0.9] )

  axis_math

  text( k(end), -0.04*(yf-yo), '$k$', 'verticalalignment', 'top',    'horizontalalignment', 'center' )
  text(    0.2,  0.95*yf,    '$a_k$', 'verticalalignment', 'middle', 'horizontalalignment', 'left'  )

  hold off

end

%-----------------------------------------------------------------------------%
