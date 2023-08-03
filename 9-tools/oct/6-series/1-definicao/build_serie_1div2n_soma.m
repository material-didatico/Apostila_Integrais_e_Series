
function build_serie_1div2n_soma

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

  tex = latex_figure_properties( tex, 'size', [5 5], 'type', 'tex', 'device', 'png' );
  tex = latex_set_subfigure    ( tex, 2, 3, 'Soma da série' ); 

  %---------------------------------------------------------------------------%

  name_fmt = 'fig_serie_1div2n_sum_%02d';

  clf; N = 1; draw_soma( N ); tex = latex_add_figure( tex, '$S_n$', sprintf(name_fmt, N ) );
  clf; N = 2; draw_soma( N ); tex = latex_add_figure( tex, '$S_n$', sprintf(name_fmt, N ) );
  clf; N = 3; draw_soma( N ); tex = latex_add_figure( tex, '$S_n$', sprintf(name_fmt, N ) );
  clf; N = 4; draw_soma( N ); tex = latex_add_figure( tex, '$S_n$', sprintf(name_fmt, N ) );
  clf; N = 5; draw_soma( N ); tex = latex_add_figure( tex, '$S_n$', sprintf(name_fmt, N ) );

  clf; 
  draw_rect( 0, 0, 1, 1 );
  text( 0.5, 0.5, '$S = 1$', 'fontsize', 18, 'HorizontalAlignment', 'center' )
  set( gca, 'position', [0.05 0.05 0.9 0.9] )
  axis off equal

  tex = latex_add_figure( tex, '$S$', name_fmt(1:end-5) );

  close all
  latex_compile( tex );

end

%-----------------------------------------------------------------------------%
function draw_soma( n )

  clf
  hold on

  fill( [ 0 0 1 1 0 ], [ 0 1 1 0 0 ], [ .9 .9 .9 ], 'linewidth', 0.5 );

  % line( [ 0 0 1 1 0 ], [ 0 1 1 0 0 ], 'linewidth', 1, 'color', 'k' )

  M = floor( n / 2 );

  r  = 1;
  xb = 0;
  yb = 0;

  for ii = 1:M

    draw_rect( xb, yb,     xb+r,   yb+r/2 );
    draw_rect( xb, yb+r/2, xb+r/2, yb+r   );

    r  = r / 2;
    xb = xb + r;
    yb = yb + r;

  end

  if( rem( n, 2 ) == 1 )
    draw_rect( xb, yb, xb+r, yb+r/2 );
  end

  text( 0.5, 0.25, sprintf( '$S_{%d}$', n ), 'fontsize', 18, 'HorizontalAlignment', 'center' )

  set( gca, 'position', [0.05 0.05 0.9 0.9] )
  axis off equal
  hold off

end

%-----------------------------------------------------------------------------%
function draw_rect( xo, yo, xf, yf )

  X = [ xo xf xf xo xo ];
  Y = [ yo yo yf yf yo ];

  fill( X, Y, [ 0.8 0.8 1 ] )

end

%-----------------------------------------------------------------------------%
