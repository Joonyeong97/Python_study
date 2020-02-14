import numpy as py
import pandas as pd
from statistics import *
x=np.array([7,8,9])
y=np.array([9,10,12])
print(y.mean()) # 통계 : 중위수(medians)
# 공 분산 행열
print("공분산",np.cov(x,y))
# 상관계수 행열 (열 2, 행 2)
print("상관계수",np.corrcoef(x,y))
