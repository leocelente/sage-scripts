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

