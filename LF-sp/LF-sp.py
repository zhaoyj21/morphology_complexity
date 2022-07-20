#!/usr/bin/env python
# coding: utf-8

# In[ ]:


import pandas as pd
from numpy import*
import numpy as np
import time

np.set_printoptions(threshold=np.inf)
df = pd.read_csv('I100_2.txt', sep='\t', header=None)
A=df.values
#print(A)    #打印 方阵A里的数据
B = zeros((11600,4),dtype=double)    #先创建一个 3x3的全零方阵A，并且数据的类型设置为float浮点型
C = zeros((11600),dtype=double) 
D = zeros((11600),dtype=double) 
E = zeros((1080,11600),dtype=double) 

#from scipy.spatial.distance import pdist, squareform

def EuclideanDistances(A, B):
    BT = B.transpose()
    vecProd = np.dot(A, BT)
    SqA = A ** 2
    sumSqA = np.matrix(np.sum(SqA, axis=1))
    sumSqAEx = np.tile(sumSqA.transpose(), (1, vecProd.shape[1]))

    SqB = B ** 2
    sumSqB = np.sum(SqB, axis=1)
    sumSqBEx = np.tile(sumSqB, (vecProd.shape[0], 1))

    SqED = sumSqBEx + sumSqAEx - 2 * vecProd
    ED = np.sqrt(SqED)
    return ED
disA = EuclideanDistances(A[:,1:4], A[:,1:4]);
LJ =14.8*2.5;
tic1 = time.time()
for i in range(1080):
    n = i + 1081
    path='/home/xuzp/WORK/ZYJ/LF/TXT/sphere/'+str(n)+'.txt'
    df = pd.read_csv(path, sep=' ', header=None)
    B = df.values
    X = B[:, 1:4]
    # print(X);
    dis = EuclideanDistances(X, X)
    #print(dis.shape)
    for j in range(11600):
        num_neiber = 0
        #print(j)
        for k in range(j + 1, 11600):
            if dis[j, k] < LJ:
                numB1 = B[j, 0]
                numB2 = B[k, 0]
                x1 = np.where(A[:,0]==numB1)
                x2 = np.where(A[:,0]==numB2)
                if disA[x1[0], x2[0]] > LJ:
                    D[j] = D[j] + disA[x1[0], x2[0]]
                    num_neiber = num_neiber + 1
        if D[j] > 0:
            D[j] = D[j] / num_neiber
    #print(D)
    E[i,:] = D
    numD = 0
    tmp1= np.where(D>0)
    C[i] += sum(D)
    numD=len(tmp1[0])
    #print(numD)
    if C[i] > 0:
        C[i] = C[i] / numD
    D = zeros((11600), dtype=double)
    print(i)

print(C)

tic2 = time.time()
print("向量化使用时间:" + str(1000 * (tic2 - tic1)) + "ms")

np.savetxt("LF-sp.txt", C,fmt='%f',delimiter=',')
np.savetxt("LF2-sp.txt", E,fmt='%f',delimiter=',')

