function X = compute3DPosition(o, vl, vp, b, t, alpha)
deno = o * vl * norm(cross(b, t), 2);
mole = b * vl * norm(cross(vp, t), 2) * alpha;
X = deno / mole;