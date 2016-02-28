import numpy as np
import math 
import random

s = 0
for each in range(1000):
    #generate data
    data = np.array(2*np.random.rand(1000, 2)) - 1
    data_x = np.hstack((np.ones((1000, 1)), data))
    y = np.sign((data**2)[:, 0] + (data**2)[:, 1] - 0.6)
    
    #add noise
    id = range(1000)
    random.shuffle(id)
    for each in id[:100]:
        y[each] = - y[each]
    
    #using LR compute initial w
    x1 = data[:, 0].reshape(1000, 1)
    x2 = data[:, 1].reshape(1000, 1)
    #print np.shape(x1), np.shape(x2)
    new_data_x = np.hstack((np.ones((1000, 1)), x1, x2, x1*x2, x1**2, x2**2))
    w_lin = np.dot(np.linalg.pinv(new_data_x), y)
    
    #generate test data 
    data_test = np.array(2*np.random.rand(1000, 2)) - 1
    data_x_test = np.hstack((np.ones((1000, 1)), data_test))
    y_test = np.sign((data_test**2)[:, 0] + (data_test**2)[:, 1] - 0.6) 
    
    #add noise
    #add noise
    id = range(1000)
    random.shuffle(id)
    for each in id[:100]:
        y_test[each] = - y_test[each]
        
    x1 = data_test[:, 0].reshape(1000, 1)
    x2 = data_test[:, 1].reshape(1000, 1)
    #print np.shape(x1), np.shape(x2)
    new_data_x_test = np.hstack((np.ones((1000, 1)), x1, x2, x1*x2, x1**2, x2**2))    
       
    s = s + sum(y_test == np.sign(np.dot(new_data_x_test, w_lin)))
print s*1.0/1000
