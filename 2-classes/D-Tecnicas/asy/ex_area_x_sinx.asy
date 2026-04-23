//-----------------------------------------------------------------------------

import "../../0-common/asy/utils.ah" as utils;

size(150mm, 75mm, IgnoreAspect);

real R = 2;               

real xmin = -1;
real xmax =  7;
real ymin = -5;
real ymax =  2;

real f(real x)
{
  return x * sin(x);
}

draw_axes(xmin, xmax, 1, ymin, ymax, 1);

path quadrante = box((0, 0), (xmax, ymax));

filldraw( quadrante, gray + opacity(0.2), invisible);

fill( graph(f, 0, pi) -- cycle, pens[0] + opacity(0.3) );

draw(graph(f, 0, xmax), pens[0]);

label("\large $\pi$",  (3.2, 0.1), N);
label("\large $2\pi$", (2pi, 0.1), NW);

clip_to_axis();

//-----------------------------------------------------------------------------
