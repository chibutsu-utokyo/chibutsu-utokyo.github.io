verbatimtex
%&platex
%%  \documentclass[10pt]{jsarticle}
  \documentclass[10pt]{article}
  \usepackage[dvipdfm]{graphicx, color}
  \usepackage[T1]{fontenc}
  \usepackage{amsmath, txfonts}
  \usepackage{textcomp}
  \renewcommand{\-}{\texttt{-}}
  %\newcommand{\mybox}[1]{\makebox[.32em]{\rule[-.2ex]{0pt}{1.4ex}\smash{#1}}}
  \newcommand{\mybox}[1]{\makebox[.32em]{\texttt{#1}}}
  \begin{document}
etex;

input boxes;

prologues := 0;
u := 10pt;

def narrow = withpen pencircle scaled  .6pt enddef;
def middle = withpen pencircle scaled 1.0pt enddef;
def bold   = withpen pencircle scaled 1.5pt enddef;

beginfig(0)
  boxjoin(a.ne = b.nw; a.se = b.sw);
  boxit.FT(btex \mybox{\-} etex);
  boxit.UR(btex \mybox{r}  etex);
  boxit.UW(btex \mybox{w}  etex);
  boxit.UX(btex \mybox{x}  etex);
  boxit.GR(btex \mybox{r}  etex);
  boxit.GW(btex \mybox{\-} etex);
  boxit.GX(btex \mybox{\-} etex);
  boxit.OR(btex \mybox{r}  etex);
  boxit.OW(btex \mybox{\-} etex);
  boxit.OX(btex \mybox{x}  etex);
  drawboxed(FT, UR, UW, UX, GR, GW, GX, OR, OW, OX);

  currentpen := pencircle scaled 1.2pt;
  h := 1u;
  pair urn[], uwn, uxn, grn[], gwn, gxn, orn[], own, oxn;
  color owner, group, other;
  owner = red + blue;
  group = .7*(.4red + .9green + .8blue);
  other = .7*(.8red + .7green + .5blue);
  urn0 = UR.n + 6.0h*up; uwn = UW.n + .8h*up; uxn = UX.n + .8h*up;
  grn0 = GR.n + 4.5h*up; gwn = GW.n + .8h*up; gxn = GX.n + .8h*up;
  orn0 = OR.n + 3.0h*up; own = OW.n + .8h*up; oxn = OX.n + .8h*up;

  urn1 = uwn + whatever*dir 140; urn1 = urn0 + whatever*down;
  urn2 = uxn + whatever*dir 140; urn2 = urn0 + whatever*down;

  grn1 = gwn + whatever*dir 140; grn1 = grn0 + whatever*down;
  grn2 = gxn + whatever*dir 140; grn2 = grn0 + whatever*down;

  orn1 = own + whatever*dir 140; orn1 = orn0 + whatever*down;
  orn2 = oxn + whatever*dir 140; orn2 = orn0 + whatever*down;

  drawarrow UR.n -- urn0 -- (urn0 + h*right) withcolor owner;
  draw UW.n -- uwn -- urn1 withcolor owner;
  draw UX.n -- uxn -- urn2 withcolor owner;

  drawarrow GR.n -- grn0 -- (grn0 + h*right) withcolor group;
  draw GW.n -- gwn -- grn1 withcolor group;
  draw GX.n -- gxn -- grn2 withcolor group;

  drawarrow OR.n -- orn0 -- (orn0 + h*right) withcolor other;
  draw OW.n -- own -- orn1 withcolor other;
  draw OX.n -- oxn -- orn2 withcolor other;

  label.rt(btex \strut{}owner etex, (urn0 + h*right)) withcolor owner;
  label.rt(btex \strut{}group etex, (grn0 + h*right)) withcolor group;
  label.rt(btex \strut{}other etex, (orn0 + h*right)) withcolor other;

  pair vec;
  pair rp[], wp[], xp[];
  color read, writ, exec;
  read = blue;
  writ = .8green + .2blue;
  exec = red;
  rp[0] = UR.s + 7.0h*down; wp[0] = UW.s + 5.5h*down; xp[0] = UX.s + 4.0h*down;
  vec := 0.7h*down; rp1 = UR.s + vec; rp2 = GR.s + vec; rp3 = OR.s + vec;
  vec := 1.4h*down; wp1 = UW.s + vec; wp2 = GW.s + vec; wp3 = OW.s + vec;
  vec := 2.1h*down; xp1 = UX.s + vec; xp2 = GX.s + vec; xp3 = OX.s + vec;

  draw OR.s -- rp3 -- rp1 withcolor read;
  draw GR.s -- rp2 withcolor read;
  drawarrow UR.s -- rp0 -- (rp0 + 1h*right) withcolor read;

  draw OW.s -- wp3 -- wp1 withcolor writ;
  draw GW.s -- wp2 withcolor writ;
  drawarrow UW.s -- wp0 -- (wp0 + 2h*right) withcolor writ;

  draw OX.s -- xp3 -- xp1 withcolor exec;
  draw GX.s -- xp2 withcolor exec;
  drawarrow UX.s -- xp0 -- (xp0 + 3h*right) withcolor exec;

  label.rt(btex \strut{}read    etex, (rp0 + 1h*right)) withcolor read;
  label.rt(btex \strut{}write   etex, (wp0 + 2h*right)) withcolor writ;
  label.rt(btex \strut{}execute etex, (xp0 + 3h*right)) withcolor exec;

  drawarrow FT.w -- (FT.w + 1.5h*left) -- (FT.w + 1.5h*left + 1.5h*up);
  label.top(btex file type etex, FT.w + 1.5h*left + 1.5h*up);

  picture whole;
  whole = currentpicture;
endfig;

beginfig(1);
  draw whole withcolor black;
endfig;

end.
