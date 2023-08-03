
function build_intervalos

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
                      % 'dryrun',   true,
                      'class', 'article',  
                      'model', latex_model );

  tex = latex_add_preamble( tex, '\usepackage{blindtext}' );                    
  tex = latex_add_content ( tex, '\blindtext' );

  figure_position( 1, 2, 2, 2 );

  tex = latex_figure_properties( tex, 'size', [12 2], 'type', 'tex', 'device', 'png' );

  %---------------------------------------------------------------------------%
  clf
  plot_interval( -3, -1, 1, 3, 0, 0 );
  set( gca, 'xtick', [] )

  text(  0, 0.2, '$a$',   'verticalalignment', 'baseline', 'horizontalalignment', 'center' )
  text( -1, 0.2, '$a-R$', 'verticalalignment', 'baseline', 'horizontalalignment', 'center' )
  text(  1, 0.2, '$a+R$', 'verticalalignment', 'baseline', 'horizontalalignment', 'center' )

  tex = latex_add_figure ( tex, 'Intervalo', 'fig_interval_raio_convergencia' ); 
  tex = latex_add_content( tex, '\blindtext' );

  %---------------------------------------------------------------------------%

  clf
  plot_interval( -1.5, 1, 3, 6.5, 0, 1 );
  set( gca, 'xtick', -1:6 )

  tex = latex_add_figure ( tex, 'Intervalo', 'fig_interval_exemplo_1', true ); 
  tex = latex_add_content( tex, '\blindtext' );

  %---------------------------------------------------------------------------%

  clf
  plot_interval( -13, -8, 12, 21, 0, 0 );
  set( gca, 'xtick', -12:4:20 )

  tex = latex_add_figure ( tex, 'Intervalo', 'fig_interval_exemplo_2', true ); 
  tex = latex_add_content( tex, '\blindtext' );

  %---------------------------------------------------------------------------%

  latex_compile( tex );

end

%-----------------------------------------------------------------------------%
function plot_interval( xo, a, b, xf, a_open, b_open )

  plot1d(             [ a      b      ], 
          'Interval', [ a_open b_open ], 
          'LineWidth',  2, 
          'MarkerSize', 16, 
          'xLim',     [xo xf] )

  set( gca, 'position', [0.05 0.5 0.9 0.5] )

end

%-----------------------------------------------------------------------------%
