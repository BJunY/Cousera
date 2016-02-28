import numpy as np
import math

class LogicR:
    def __init__(self):
        data = np.loadtxt("D://ntumlone-hw3-hw3_train.dat")
        self.X_train = np.hstack((np.ones((np.shape(data)[0], 1)),data[:, 0:-1]))
        self.y_train = data[:, -1].reshape((np.shape(data)[0], 1))
    
    def sigmoid(self, x):
        return 1.0/(1 + np.exp(-x))
    
    def gradient(self, x, y, w):
        grad = -x*y*self.sigmoid(np.dot(x, w)*(-y)).transpose()
        #print np.shape(grad)
        return grad.reshape((21, 1))
    
    def update(self, IterNum, eita, w0):
        w = w0
        for each in range(IterNum):
            w = w - eita*self.gradient(self.X_train[each%(np.shape(self.X_train)[0]), :], self.y_train[each%(np.shape(self.y_train)[0])],w)
        return w
    
    def getE_out(self, X, y, IterNum, eita, w0):
        w = self.update(IterNum, eita, w0)
        #print np.shape(w)
        predict_y = np.sign(self.sigmoid(np.dot(X,w)) - 0.5)
        print np.transpose(predict_y)
        return np.average(predict_y == y)
if __name__ == "__main__":
    data = np.loadtxt("D://ntumlone-hw3-hw3_test.dat")
    #print type(data)
    X_test = np.hstack((np.ones(((np.shape(data))[0], 1)),data[:, 0:-1]))
    y_test = data[:, -1].reshape((np.shape(data)[0], 1))
    lr = LogicR()
    #print lr.sigmoid(np.array([-1]))
    print lr.getE_out(X_test, y_test, 2000, 0.001, np.random.rand(np.shape(data)[1], 1))
    
