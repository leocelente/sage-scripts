def radians(d):
    '''
        Degrees to radians
    '''
    return (d*pi/180)

def degrees(r):
    '''
        Radians to degrees
        6 digit precision
    '''
    return numerical_approx(r*180/pi, digits=6)

def expi(x):
    '''
        e^ix (radians)
    '''
    return exp(I*x)

def expid(x):
    '''
       expi with degrees
    '''
    return expi(radians(x))

def c_angle(x):
    '''
        Angle of a complex number (radians)
    '''
    return arg(x)

def c_angled(x):
    '''
        c_angle in degrees
    '''
    return degrees(c_angle(x))

def printp(x):
    '''
        Pretty print phasor
    '''
    print(str(numerical_approx(abs(x)))),
    print(u"\u2220"),
    print(" " + str(c_angled(x)) + "°")

def printpm(vec):
    '''
        Print phasor list
    '''
    for p in vec:
        printp(p)

def phasor(A, theta):
    '''
        Returns phasor with value 'A' and phase theta (degrees)
    '''
    return A*expid(theta)


def capacitor(farads, freq):
    return phasor(1/(farads*freq), -90)

def inductor(henries, freq):
    return phasor((henries*freq), 90)

def parallel(xs):
    ad = 0
    for x in xs:
        ad = ad + 1/x
    return 1/ad