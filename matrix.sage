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