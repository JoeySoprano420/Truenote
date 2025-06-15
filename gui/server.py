from flask import Flask, request, jsonify
app = Flask(__name__)

@app.route("/compile", methods=["POST"])
def compile():
    source = request.data.decode()
    with open("tmp.true", "w") as f:
        f.write(source)
    # call NASM backend
    os.system("./truenote tmp.true > out.asm")
    ir = open("out.ir").read()
    asm = open("out.asm").read()
    return jsonify({"ir": ir, "asm": asm})
