
function build_figs_functions_hyper_2

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
                      %'dryrun', true,
                      'class', 'article',  
                      'model', latex_model );

  % tex = latex_add_preamble( tex, '\usepackage{blindtext}' );                    

  tex = latex_figure_properties( tex, 'size', [8 4], 'type', 'tex', 'device', 'png' );
  tex = latex_set_subfigure    ( tex, 2, 2, 'Funções' );

  %----------------------------------------------------------------------------%

  figure_position( 1, 2, 4, 3 );
  clf 
  hold on

  x = linspace( -3, 3, 401 );
  y = tanh(x);
  plot( [-3 3], [ 1  1], 'linewidth', 0.5, 'color', [.9 .9 .9] )
  plot( [-3 3], [-1 -1], 'linewidth', 0.5, 'color', [.9 .9 .9] )
  plot( x, y, 'b', 'linewidth', 1 );

  text( 0.3,  1.3, '$\tanh(x)$', 'horizontalalignment', 'left' )
  text( 2.8, -0.1, '$x$' )

  % axis equal
  axis([ -3 3 -1.3, 1.3 ])
  set( gca, 'xtick', -2:2, 'ytick', [-1 1] )
  set( gca, 'position', [ 0.05 0.05 0.9 0.9 ] )
  axis_math
  hold off

  tex = latex_add_figure( tex, 'Função', 'fig_functions_tanh' );
  
  %----------------------------------------------------------------------------%

  figure_position( 2, 2, 4, 4 );
  clf 
  hold on

  x = linspace( 0, 3, 201 );
  x = [ -x(end:-1:2) NaN x(2:end) ];
  y = coth(x);
  plot( [-3 3], [ 1  1], 'linewidth', 0.5, 'color', [.9 .9 .9] )
  plot( [-3 3], [-1 -1], 'linewidth', 0.5, 'color', [.9 .9 .9] )
  plot( x, y, 'b', 'linewidth', 1 );

  text( 0.4,  4.0, '$\coth(x)$', 'horizontalalignment', 'left' )
  text( 2.8, -0.3, '$x$' )

  % axis equal
  axis([ -3 3 -4.1, 4.1 ])
  set( gca, 'xtick', -2:2, 'ytick', [ -4 -1 1 4 ] )
  set( gca, 'position', [ 0.05 0.05 0.9 0.9 ] )
  axis_math
  hold off

  tex = latex_add_figure( tex, 'Função', 'fig_functions_coth' );

  %----------------------------------------------------------------------------%

  figure_position( 3, 2, 4, 7 );
  clf 
  hold on

  x = linspace( -3, 3, 401 );
  y = sech(x);
  plot( [-3 3], [ 1  1], 'linewidth', 0.5, 'color', [.9 .9 .9] )
  plot( x, y, 'b', 'linewidth', 1 );

  text( 0.3,  1.3, '$\sech(x)$', 'horizontalalignment', 'left' )
  text( 2.8, -0.1, '$x$' )

  % axis equal
  axis([ -3 3 -1.3, 1.3 ])
  set( gca, 'xtick', -2:2, 'ytick', [-1 1] )
  set( gca, 'position', [ 0.05 0.05 0.9 0.9 ] )
  axis_math
  hold off

  tex = latex_add_figure( tex, 'Função', 'fig_functions_sech' );
  
  %----------------------------------------------------------------------------%

  figure_position( 4, 2, 4, 8 );
  clf 
  hold on

  x = linspace( -3, 3, 401 );
  y = csch(x);
  plot( x, y, 'b', 'linewidth', 1 );

  text( 0.4,  4.0, '$\csch(x)$', 'horizontalalignment', 'left' )
  text( 2.8, -0.3, '$x$' )

  % axis equal
  axis([ -3 3 -4.1, 4.1 ])
  set( gca, 'xtick', -2:2, 'ytick', [ -4 -1 1 4 ] )
  set( gca, 'position', [ 0.05 0.05 0.9 0.9 ] )
  axis_math
  hold off

  tex = latex_add_figure( tex, 'Função', 'fig_functions_csch' );
  
  %----------------------------------------------------------------------------%

  latex_compile( tex );

end

%------------------------------------------------------------------------------%
