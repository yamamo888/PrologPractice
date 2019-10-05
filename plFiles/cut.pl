factorial(0,1).
factorial(N,F) :- N >0, N2 is N -1, factorial(N2,F2), F is F2 * N.