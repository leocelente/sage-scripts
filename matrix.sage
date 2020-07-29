def lsolve(matrix, v):
    matrix = Matrix(matrix)
    v = vector(v)
    result = []
    try:
        result = matrix \ v
    except ValueError:
        print("No solutions or Error")
        return None
    return result

def val(x):
    return numerical_approx(x)

def autovv(A):
    A = Matrix(A)
    for vector in A.eigenvectors_right():
        print("Value: ", vector[0], "-> Vector: " , str(vector[1][0]))



def cylindrical(f):
    print("Don't forget to include the Jacobian 'r' when integrating")
    return (f(x=r*cos(theta), y=r*sin(theta)).full_simplify())


def spherical(f):
    print("Don't forget to include the Jacobian 'r^2 * sin(phi)' when integrating")
    return (f(x=r*cos(theta)*sin(phi), y=r*sin(theta)*sin(phi), z=r*cos(phi)).full_simplify())


def vector_field_line_integral(P=0, Q=0, R=0, r=[1,1,1], a=0,b=0):
    r = vector(r)
    rl = vector([r[0].diff(t), r[1].diff(t) , r[2].diff(t)])
    ft = vector([P.subs(x=r[0], y=r[1], z=r[2]), Q.subs(x=r[0], y=r[1], z=r[2]) , R.subs(x=r[0], y=r[1], z=r[2])])
    integrand = ft.inner_product(rl)
    return integral(integrand, t, a, b)


def escalar_field_line_integral(f=0, r=[1,1,1], a=0,b=0):
    r = vector(r)
    dr = sqrt(r[0].diff(t)^2 + r[1].diff(t)^2 + r[2].diff(t)^2)
    ft = f.subs(x=r[0], y=r[1], z=r[2])
    integrand = ft*dr
    return integral(integrand.full_simplify(), t, 0, 2*pi)


milli  = (10^-3)
micro = (10^-6)
nano  = (10^-9)
pico = (10^-12)

kilo  = (10^3)