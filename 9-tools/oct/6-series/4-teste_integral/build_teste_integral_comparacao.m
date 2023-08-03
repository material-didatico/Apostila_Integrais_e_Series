
function build_teste_integral_comparacao

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

  tex = latex_figure_properties( tex, 'size', [14 5], 'type', 'tex', 'device', 'png' );

  %---------------------------------------------------------------------------%

  figure_position( 2, 2, 2, 2 );
  plot_serie_and_function( 'right' )

  tex = latex_add_figure( tex, 'Teste Integral 2', 'fig_teste_integral_comparacao', true );

  %---------------------------------------------------------------------------%

  tex = latex_add_content( tex, 'Comparação', {
      '\[ a_n = \frac{1}{x^2}\]' 
      '\[ I_n = \int_n^{n+1} \frac{1}{x^2} dx = \frac{1}{n^2+n}\]' 
    } );

  N = 7;

  n = (1:N);

  a = n.^(-2);
  I = 1./(n.^2+n);

  A = cell( N+2, 4 );
  A{1,1} = '$n$';
  A{1,2} = '$a_n$';
  A{1,3} = '$I_n$';
  A{1,4} = '$a_n-I_n$';

  for n = 1:N

    A{n+1,1} = num2str(n);
    A{n+1,2} = num2str(a(n),      '%.3f');
    A{n+1,3} = num2str(I(n),      '%.3f');
    A{n+1,4} = num2str(a(n)-I(n), '%.3f');

  end

  A{N+2,1} = 'Soma';
  A{N+2,2} = num2str( sum(a),   '%.3f' );
  A{N+2,3} = num2str( sum(I),   '%.3f' );
  A{N+2,4} = num2str( sum(a-I), '%.3f' );

  tex = latex_add_content( tex, A );

  %---------------------------------------------------------------------------%

  latex_compile( tex );

end


%-----------------------------------------------------------------------------%
function plot_serie_and_function( s )

  clf
  hold on

  f = @(x) x.^(-2);
  M = 11;
  n = 1:M;
  a = f(n);

  h = plot_serie( a, s, [-0.5 M-0.3] );
  
  x = linspace( 0.1, M-0.3, 100 );
  y = f(x);

  plot( x, y, 'm', 'linewidth', 1 )

  scatter( 1:M, a, 16, 'm', 'filled' )

  ylim([ -0.1 1.1 ])
  set( gca, 'ytick', [0.5 1],
            'yticklabel', {'0,5' '1,0' },
            'xtick', 1:2:M )

  axis_math

  set( gca, 'position', [0.01 0.05 0.98 0.94 ] )
  
  hold off

end

%-----------------------------------------------------------------------------%

