import numpy as np

# A function for generating a score weighted on precedence that allows for easy
# future expansion. This takes an array of normalized values and returns a weighted score
def weightedScore(x):
    wSum  = 0
    score = 0
    w = len(x) # the first weight is index of the last item + 1
    for i in x:
        wSum  += w # add weight to sum
        score += i * w # multiply the value with weight
        w -= 1 # decrement our weight counter
    return score / wSum # this is how we account for weights not being between 0 and 1

# A function for min max normalization this fits all values between 0 and 1
# where 0 = min and 1 = max
def minMax(x):
    ret = np.array([])
    for i in x.astype(float):
        ret = np.append(ret, (i - x.min()) / (x.max() - x.min()) )
    return ret


if __name__ == "__main__":
    pass

