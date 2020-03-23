from flask import Flask, render_template, redirect, request

from dao import sungjuk

app = Flask(__name__)
@app.route('/ip', methods=['GET'])
def name():
    return request.environ.get('HTTP_X_REAL_IP', request.remote_addr)
    #return jsonify({'ip': request.remote_addr}), 200
    #return jsonify({'ip': request.environ['REMOTE_ADDR']}), 200

@app.route('/')
def index():
    return render_template("index.html")


@app.route("/image_map")
def image_map():
    return render_template("image_map.html")

@app.route("/table1")
def table1():
    return render_template("table1.html")

@app.route("/python")
def python():
    return render_template("python.html")



@app.route("/sch")
def sch():
    return render_template("sch.html")

@app.route('/corona19')
def corona19():
   return render_template("corona1911.html")


@app.route("/sungjuk_call")
def sungjuk_call():
    result = sungjuk.getSungjuk()
    # print(result)
    return render_template("sungjuk.html", object_list=result)


@app.route("/sungjukAct", methods=["GET","POST","PUT","DELETE"])
def sungjukAct():
    if request.method == 'GET':
        return sungjuk.getSungjuk()
    elif request.method == 'POST':
        name = request.form['name1']
        kor  = request.form['kor1']
        mat  = request.form['mat1']
        eng  = request.form['eng1']
        sungdata = {'name' : name, 'kor' : kor, 'mat' : mat, 'eng' : eng}
        return  sungjuk.setSungjuk(sungdata)

    elif request.method == 'DELETE':
        name = request.form['id']
        return  sungjuk.delSungjuk(name)

    elif request.method == 'PUT':
        sungData = request.form

        return sungjuk.putSungjuk(sungData)

if __name__ == '__main__':
    app.run()
