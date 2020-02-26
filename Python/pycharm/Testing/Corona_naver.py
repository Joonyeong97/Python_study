from selenium import webdriver
from selenium.webdriver.common.keys import Keys
import time
from tqdm import tqdm
import pandas as pd


import re

def cleanText(readData):
    # 텍스트에 포함되어 있는 특수 문자 제거
    text = re.sub('[-=+,#/\?:^$.@*\"※~&%ㆍ!』\\‘|\(\)\[\]\<\>`\'…》]', '', readData)
    return text


def naver_corona():
    # 코로나 바이러스
    keyword = "코로나"

    # 웹접속 - 네이버 이미지 접속
    # 79.0.3945.36 / chrome version
    print("접속중")
    driver = webdriver.Chrome(executable_path="./chromedriver.exe")
    driver.implicitly_wait(30)

    url = 'https://search.naver.com/search.naver?sm=top_hty&fbm=1&ie=utf8&query={}'.format(keyword)
    driver.get(url)

    text2 = driver.find_elements_by_css_selector('span.txt_sort')
    text3 = driver.find_elements_by_css_selector('strong.num')
    result = []
    result2 = []

    for ttt in tqdm(text2):
        result.append(ttt.text)
    for qqq in tqdm(text3):
        result2.append(qqq.text)

    driver.close()
    aa = []
    for q,i in enumerate(result2):
        aa.append(int(cleanText(i)))
    result2 = aa

    c = dict()
    c = {result[0]: result2[0], result[1]: result2[1], result[2]: result2[2], result[3]: result2[3]}

    df_korea = pd.read_csv('korea_corona.csv')
    date = time.strftime('%Y-%m-%d', time.localtime(time.time()))
    date2 = time.strftime('%Y%m%d', time.localtime(time.time()))
    daa = df_korea.iloc[-1, :-1]

    for _, i in enumerate(daa):
        if cleanText(i) == date2:
            df_korea = df_korea.drop(df_korea.iloc[-1:, :].index, axis=0)
            df_korea = df_korea.append(
                [{'date': date, 'confirmed': c['확진환자']}, ],
                ignore_index=True)
        else:
            df_korea = df_korea.append(
                [{'date': date, 'confirmed': c['확진환자']}, ],
                ignore_index=True)

    # if enumerate(daa) == date:
    #     df_korea = df_korea.drop(df_korea.iloc[-1:, :].index, axis=0)
    #     df_korea = df_korea.append(
    #         [{'date': time.strftime('%Y-%m-%d', time.localtime(time.time())), 'confirmed': c['확진환자']}, ],
    #         ignore_index=True)
    # else:
    #     df_korea = df_korea.append(
    #         [{'date': time.strftime('%Y-%m-%d', time.localtime(time.time())), 'confirmed': c['확진환자']}, ],
    #         ignore_index=True)

    df_korea.to_csv('korea_corona.csv', sep=',', header=True, index=False)
    return
# print('수집완료')



# 페이지 스크롤 다운
# body = driver.find_element_by_css_selector('body')
# for i in range(150):
#     body.send_keys(Keys.PAGE_DOWN)
#     time.sleep(1)

# # 이미지 링크 수집
# imgs = driver.find_elements_by_css_selector('img._img')
# result = []
# for img in tqdm(imgs):
#     if 'http' in img.get_attribute('src'):
#         result.append(img.get_attribute('src'))
# # print(result)
#
# driver.close()
# print('수집완료')
#
# # 파일 저장
# import os
# if not os.path.isdir('./{}'.format(key)):
#     print('폴더생성')
#     os.mkdir('./{}'.format(key))
#
# # 다운로드
# from urllib.request import urlretrieve
#
# print("다운로드중")
# for index, link in tqdm(enumerate(result)):
#     start = link.rfind('.')
#     end = link.rfind('&')
#     # print(link[start:end])
#     filetype = link[start:end]
#     if filetype == '.jpg':  # jpg 만 다운
#         urlretrieve(link, './{}/{}{}{}'.format(key, key, index, filetype))
#         time.sleep(1)
# print("다운로드 완료")
#
# # import zipfile
# # zip_file = zipfile.Zipfile('./{}.zip'.format(keyword),'w')
# # # 이 폴더안에 파일 가져오는거
# # for image in tqdm(os.listdir('./{}'.format(keyword))):
# #     zip_file.write('./{}/{}'.format(keyword,image), compress_type=zip_file.ZIP_DEFLATED)
# # zip_file.close()
# # print("압축완료")
