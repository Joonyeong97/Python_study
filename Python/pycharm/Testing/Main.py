# Installing collected packages: pystan, ephem, LunarCalendar, pymeeus, convertdate, holidays, setuptools-git, fbprophet
# conda install -c conda-forge fbprophet
# pip install plotly
# pip install ipython

import time
import Corona_naver
import Corona


# 자동업데이트
if __name__ == '__main__':
    start = str(input("당일자로 Corona 감염자 예측을 진행 하시겠습니까? y or n : "))
    if start == 'y':
        Corona_naver.naver_corona()
        time.sleep(1)
        Corona.corona_prdict()
    else:
        pass