from flask import Flask, render_template, redirect, request

app = Flask(__name__)


@app.route('/')
def index():
    return render_template("corona1911.html")

@app.route('/corona19')
def corona19():
   return render_template("index.html")



if __name__ == '__main__':
    app.run()
