import numpy as np

def Rz(rad):
    return np.array([
        [np.cos(rad), -np.sin(rad), 0, 0],
        [np.sin(rad), np.cos(rad), 0, 0],
        [0, 0, 1,0],
        [0, 0, 0,1]
    ])


def Rx(rad):
    return np.array([
        [1, 0, 0, 0],
        [0, np.cos(rad), -np.sin(rad), 0],
        [0, np.sin(rad), np.cos(rad), 0],
        [0, 0, 0,1]
    ])

def Ry(rad):
    return np.array([
        [np.cos(rad), 0, np.sin(rad), 0],
        [0, 1, 0, 0],
        [-np.sin(rad), 0, np.cos(rad), 0],
        [0, 0, 0,1]
    ])


def T(x=0,y=0, z=0):
    return np.array([
        [1,0,0,x],
        [0,1,0,y],
        [0,0,1,z],
        [0,0,0,1]
    ])


m1 = T(0,0,0.1)
m2 = Rz(np.radians(60)).dot(T(0,0,0.05))
m3 = Rx(np.radians(45)).dot(T(0,0,2.0))
m4 = Rx(np.radians(-30)).dot(T(0,0,1.0))
m5 = Rx(np.radians(-45)).dot(T(0,0,0.5))

m = (((m1.dot(m2)).dot(m3)).dot(m4)).dot(m5)
print(m)

import tinyik as ik

arm = ik.Actuator([
    "z" , [0, 0, 0.15], # rotates in z 
    "x" , [0, 0, 2.0],
    "x" , [0, 0, 1.0],
    "x" , [0, 0, .5]
])

arm.ee =[1.0, 1.0, 1.0]#end effector

print(arm.angles)
print(np.degrees(arm.angles))