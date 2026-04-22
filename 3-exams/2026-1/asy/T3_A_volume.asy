
import "./utils.ah" as utils;

size(6cm, 6cm, IgnoreAspect);

draw_axes(-1, 4, 1, -2, 2, 1);

real yu(real x) {return 0;}
real yd(real x) {return x*(x-2);}

path u = graph(yu, 0, 2);
path d = graph(yd, 0, 2);

fill( u -- reverse(d) -- cycle, pens[0] + opacity(0.2));

path u = graph(yu, -1, 4);
path d = graph(yd, -1, 4);

draw(u, pens[1] + 0.5pt);
draw(d, pens[0] + 0.5pt);

clip_to_axis();
