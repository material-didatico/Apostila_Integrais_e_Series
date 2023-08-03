
function build_figs_teste_integral

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

  tex = latex_figure_properties( tex, 'size', [8.5 4], 'type', 'tex', 'device', 'png' );

  figure_position( 1, 2, 2, 2 );

  %---------------------------------------------------------------------------%

  f = @(x) (x/3).^(-1)/2 + 4.2 - x.*exp(-x/9);

  clf
  hold on
  plot_serie_right( f )
  plot_function   ( f )
  hold off

  tex = latex_add_figure( tex, 'Teste Integral 1', 'fig_teste_integral_right' );

  %---------------------------------------------------------------------------%

  figure_position( 2, 2, 2, 4 );

  clf
  hold on
  plot_serie_left( f )
  plot_function  ( f )
  hold off

  tex = latex_add_figure( tex, 'Teste Integral 2', 'fig_teste_integral_left' );

  %---------------------------------------------------------------------------%

  latex_compile( tex );

end

%-----------------------------------------------------------------------------%
function plot_function( f )

  L = 8;

  x = linspace( 0.1, L, 100 );
  y = f(x);

  plot( x, y, 'b', 'linewidth', 2 )
  axis([ 0 L 0 5 ] )
  grid on

  set( gca,
       'position', [ 0.1 0.1 0.8 0.8 ], 
       'yticklabel', {},
       'xtick', 0:L ); 

  white_background( 1.05, 1.95, 4.05, 4.95 )
  text( 1.5, 4.2, '$f(x)$',
        'horizontalalignment', 'center',
        'verticalalignment', 'baseline' )

  axis_math

end

%-----------------------------------------------------------------------------%
function plot_serie_right( f )

  for k = 2:6

    y = f(k);

    draw_rect( k, 0, k+1, y );

    text( k+0.5, y/2.5, sprintf( '$a_%d$', k), 
          'horizontalalignment', 'center',
          'verticalalignment', 'baseline' )

  end

end

%-----------------------------------------------------------------------------%
function plot_serie_left( f )

  for k = 2:6

    y = f(k);

    draw_rect( k-1, 0, k, y );

    text( k-0.5, y/2.5, sprintf( '$a_%d$', k), 
          'horizontalalignment', 'center',
          'verticalalignment', 'baseline' )

  end

end

%-----------------------------------------------------------------------------%
function draw_rect( xo, yo, xf, yf )

  X = [ xo xf xf xo xo ];
  Y = [ yo yo yf yf yo ];

  fill( X, Y, [ 0.8 0.8 1 ], 'facealpha', 0.5 )

end

%-----------------------------------------------------------------------------%
