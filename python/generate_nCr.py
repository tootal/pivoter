import operator as op
import numpy as np

def ncr(n, r):
    r = min(r, n-r)
    if r == 0: return 1
    numer = reduce(op.mul, xrange(n, n-r, -1))
    denom = reduce(op.mul, xrange(1, r+1))
    return numer//denom

binoms = np.ndarray(shape=(1001,101), dtype=float)
for i in range(1001):
	for j in range(101):
		if i >= j:
			binoms[i,j] = ncr(i,j);
		else:
			binoms[i,j] = 0;

print binoms

np.savetxt('nCr.txt', binoms, delimiter=',')
