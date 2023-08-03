
function build_representacao

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

  tex = latex_figure_properties( tex, 'size', [8 4.5], 'type', 'tex', 'device', 'png' );

  %---------------------------------------------------------------------------%

  clf
  hold on

  N = 11;

  k = 1:N;
  x = 1-((-1).^k)./k.^1.5 + sin( 2*pi*k/10 ) ./ (k+2);

  for ii = k
    plot( [ii ii], [0 x(ii)], 'linewidth', 0.5, 'color', [ .9 .9 .9] )
  end

  plot( [0 N+0.6], [1 1], 'linewidth', 0.5, 'color', [ .8 .8 .8 ] )
  plot( [0 N+0.6], [2 2], 'linewidth', 0.5, 'color', [ .8 .8 .8 ] )
  scatter( k, x, 16, 'b', 'filled' )

  axis([ -0.5 N+1 -0.2 2.5 ])

  set( gca, 'xtick', 1:N, 'ytick', 1:2 );
  set( gca, 'position', [0.05 0.05 0.9 0.9] )

  axis_math

  text( 11.8, -0.07, '$k$', 'verticalalignment', 'top',    'horizontalalignment', 'center' )
  text( -0.2, 2.4, '$a_k$', 'verticalalignment', 'middle', 'horizontalalignment', 'right'  )

  hold off

  tex = latex_add_content( tex, '\blindtext' );
  tex = latex_add_figure ( tex, 'Representação no plano cartesiano', 'fig_representation_cartesian' ); 

  %---------------------------------------------------------------------------%

  tex = latex_figure_properties( tex, 'size', [8 3], 'type', 'tex', 'device', 'png' );

  figure_position( 2, 2, 2, 4 );

  clf
  hold on
  
  N = 7;
  k = 1:N;
  x = [ 1.0 2.2 9.4 7.5 3.2 5.6 4.8 ];
  L = { '$a_1$', '$a_2$', '$a_3$', '$a_4$', '$a_5$', '$a_6$', '$a_7$' };
  
  plot1d( x, L, 
          'color', 'b', 
          'FontSize', 10, 
          'MarkerSize', 16,
          'xTick', 0:5:10,
          'xLim', [ -1 11 ] )

  set( gca, 'position', [0.05 0.05 0.9 0.9] )

  tex = latex_add_figure ( tex, 'Representação em um eixo', 'fig_representation_axis' ); 
  tex = latex_add_content( tex, '\blindtext' );

  %---------------------------------------------------------------------------%

  latex_compile( tex );

end

%-----------------------------------------------------------------------------%
