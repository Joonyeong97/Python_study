# Installing collected packages: pystan, ephem, LunarCalendar, pymeeus, convertdate, holidays, setuptools-git, fbprophet
# conda install -c conda-forge fbprophet
# pip install plotly
# pip install ipython

import time
import Corona_naver
import Corona


# 하루에 한번은 y / 2번이상은 n
if __name__ == '__main__':
    start = str(input("코로나 자료를 업데이트 하시겠습니까? y or n : "))
    if start == 'y':
        Corona_naver.naver_corona()
        time.sleep(1)
        Corona.corona_prdict()
    elif start == 'n':
        Corona.corona_prdict()
    else:
        pass