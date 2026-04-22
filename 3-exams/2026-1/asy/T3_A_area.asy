
import "./utils.ah" as utils;

size(6cm, 6cm, IgnoreAspect);

draw_axes(-1, 5, 1, -4, 20, 4);

real yu(real x) {return 8*sqrt(x);}
real yd(real x) {return x^2;}

path u = graph(yu, 0, 4);
path d = graph(yd, 0, 4);

fill( u -- reverse(d) -- cycle, pens[0] + opacity(0.2));

path u = graph(yu,  0, 5);
path d = graph(yd, -1, 5);

draw(u, pens[0] + 0.5pt);
draw(d, pens[1] + 0.5pt);

clip_to_axis();
