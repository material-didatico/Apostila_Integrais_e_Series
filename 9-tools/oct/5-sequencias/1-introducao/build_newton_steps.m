
function build_newton_steps

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

  % tex = latex_add_preamble( tex, '\usepackage{blindtext}' );                    

  figure_position( 1, 1, 2, 2 );

  tex = latex_figure_properties( tex, 'size', [8 4.6], 'type', 'tex', 'device', 'png' );

  %---------------------------------------------------------------------------%

  clf
  hold on

  x = linspace( 0, 6, 100 );
  y = (x+2).^3/40 -2.5;

  plot( x, y, 'b', 'linewidth', 2 )

  axis([ -0.2 5 -3 4 ])
  daspect([1 2.5]) 

  set( gca, 'ytick', [], 'xtick', [], 'position', [0.01 0.01 0.98 0.98] )
  axis_math
  axis_commas

  %---------------------------------------------------------------------------%
  
  X = 1;

  text( X,  0.3, '$x_0$', 'fontsize', 10, 'verticalalignment', 'bottom', 'horizontalalignment', 'center' )
  [ X h ] = plot_newton( X );
  text( X, -0.3, '$x_1$', 'fontsize', 10, 'verticalalignment', 'top', 'horizontalalignment', 'left' )

  tex = latex_add_figure ( tex, 'Newton passo 1', 'fig_newton_step_1' ); 
  % tex = latex_add_content( tex, '\blindtext' );

  %---------------------------------------------------------------------------%

  set( h, 'color', [0.7 0.7 0.7], 'linewidth', 1 )

  [ X h ] = plot_newton( X );
  text( X, 0.6, '$x_2$', 'fontsize', 10, 'verticalalignment', 'bottom', 'horizontalalignment', 'right' )

  tex = latex_add_figure ( tex, 'Newton passo 2', 'fig_newton_step_2' ); 

  %---------------------------------------------------------------------------%

  hold off

  latex_compile( tex );

end

%-----------------------------------------------------------------------------%
function [ x1 h ] = plot_newton( xo )

  yo =   (xo+2).^3/40 -2.5;
  dy = 3*(xo+2).^2/40;

  x = [ 0 6 ];
  y = yo + (x-xo)*dy;

  x1 = xo - yo/dy;
  
  h = plot( x, y, 'm', 'linewidth', 1.5 );
  plot( [ xo xo    ], [ 0 yo   ], 'k:', 'linewidth', 0.5 )
  plot( [ xo xo x1 ], [ 0 yo 0 ], 'k.', 'markersize', 14 )

end

%-----------------------------------------------------------------------------%





