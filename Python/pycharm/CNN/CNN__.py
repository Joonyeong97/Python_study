# https://itholic.github.io/python-listdir-glob/
import glob
import string
import os
import numpy as np
import tensorflow as tf
from PIL import Image
import cv2
# 'GuineaPig/**/*.jpg'
# "C:/Users/82105/Desktop/bigdata analysis/python/Python/pycharm/Testing/제주도/"
img = []

# for filename in glob.iglob('jeju/*.jpg', recursive=False):
#     img.append(filename)
# print(img)

import os
path = 'jeju/'
file_list = os.listdir(path)
file_list_jpg = [file for file in file_list if file.endswith(".jpg")]

print ("file_list_py: {}".format(file_list_jpg))

img1 = []
#for i in img:
print(cv2.imread(file_list_jpg[0], cv2.IMREAD_GRAYSCALE))
#print(img1)

# for i in len(img):
#     a = img[i][4].replace('\ ', '/', 1)
# print(a)











# myPath = 'jeju/'
# myExt = '*.jpg' # 찾고 싶은 확장자

# imga = []

# for a in glob.glob(os.path.join(myPath, myExt)):
#     print(a)

# print(imga)
# for i in img:
#     img1 = cv2.imread(img[i], cv2.IMREAD_GRAYSCALE)
# print(img1)

    # cv2.imshow('Image',img1)
    # cv2.waitKey(0)

# img1 = cv2.imread('jeju/jeju1.jpg', cv2.IMREAD_COLOR)
# cv2.imshow('Image', img1)
# cv2.waitKey(0)




# path = "*.*"
# file_list = glob.glob(path)
# file_list_jpg = [file for file in file_list if file.endswith(".jpg")]
#
# print("file_list_py: {}".format(file_list_jpg))




# image = glob.glob('{C:/Users/82105/Desktop/bigdata analysis/python/Python/pycharm/Testing/jeju}/*.jpg')
# image


