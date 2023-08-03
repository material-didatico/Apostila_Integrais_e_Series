
figure_position( 1, 1, 2, 2 )
clf

N = 11;

n = 1:N;

A = 1 ./ n;

B = A;
B(6:7) = 0;

C = (-1).^(n+1) ./ n;

subplot( 3, 1, 1 );     plot_serie( A         ); axis_math
subplot( 3, 1, 2 );     plot_serie( B, 'left' ); axis_math
subplot( 3, 1, 3 ); h = plot_serie( C         ); axis_math

set( h(2:2:N), 'FaceColor', [ 1 0.6 1 ] );
