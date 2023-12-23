from flask import Flask, make_response, jsonify, request
from flask_mysqldb import MySQL

app = Flask(__name__)

app.config["MYSQL_HOST"] = "localhost"
app.config["MYSQL_USER"] = "root"
app.config["MYSQL_PASSWORD"] = "1234"
app.config["MYSQL_DB"] = "cse_it_asset"

app.config["MYSQL_CURSORCLASS"] = "DictCursor"

mysql = MySQL(app)


def data_fetch(query):
    try:
        cur = mysql.connection.cursor()
        cur.execute(query)
        results = cur.fetchall()
        cur.close()
        return jsonify(results)
    except Exception as e:
        return jsonify({"error": str(e)}), 500


@app.route('/employees', methods=['GET'])
def get_employees():
    query = "SELECT * FROM cse_it_asset.employees"
    result = data_fetch(query)
    return result
    
@app.route('/assets', methods=['GET'])
def get_assets():
    query = '''SELECT it_assets.description, number_in_stock, inventory_date
                    FROM cse_it_asset.it_asset_inventory
                    INNER JOIN it_assets ON it_assets_asset_id = it_assets.asset_id'''
    result = data_fetch(query)
    return result

@app.route('/employee_assets', methods=['GET'])
def get_employee_assets():
    query = '''SELECT CONCAT(employees.first_name," ",employees.last_name) as employee_name,
            it_assets.description asset_assigned
            FROM employee_assets
            INNER JOIN employees ON employees.employee_id = employee_assets.employees_employee_id
            INNER JOIN it_assets ON it_assets.asset_id = employee_assets.it_asset_asset_id
            '''
    result = data_fetch(query)
    return result  

@app.route("/employees", methods=["POST"])
def add_employee():
    cur = mysql.connection.cursor()
    info = request.get_json()
    employee_id = info["employee_id"]
    first_name = info["first_name"]
    last_name = info["last_name"]
    department = info["department"]
    cell_mobile = info["cell_mobile"]
    email_address = info["email_address"]
    other_details = info["other_details"]
    cur.execute(
                f"""INSERT INTO cse_it_asset.employees 
                (employee_id, first_name, last_name, department, cell_mobile, email_address, other_details) 
                VALUES ({employee_id}, '{first_name}', '{last_name}', '{department}', '{cell_mobile}', '{email_address}', '{other_details}')"""
    )
    mysql.connection.commit()
    print("row(s) affected :{}".format(cur.rowcount))
    rows_affected = cur.rowcount
    cur.close()
    return make_response(
        jsonify(
            {"message": "actor added successfully", "rows_affected": rows_affected}
        ),
        201,
    )



'''
def data_fetch(query):
    cur = mysql.connection.cursor()
    cur.execute(query)
    data = cur.fetchall()
    cur.close()
    return data


@app.route("/actors", methods=["GET"])
def get_actors():
    data = data_fetch("""select * from actor""")
    return make_response(jsonify(data), 200)


@app.route("/actors/<int:id>", methods=["GET"])
def get_actor_by_id(id):
    data = data_fetch("""SELECT * FROM actor where actor_id = {}""".format(id))
    return make_response(jsonify(data), 200)


@app.route("/actors/<int:id>/movies", methods=["GET"])
def get_movies_by_actor(id):
    data = data_fetch(
        """
        SELECT film.title, film.release_year 
        FROM actor 
        INNER JOIN film_actor
        ON actor.actor_id = film_actor.actor_id 
        INNER JOIN film
        ON film_actor.film_id = film.film_id 
        WHERE actor.actor_id = {}
    """.format(
            id
        )
    )
    return make_response(
        jsonify({"actor_id": id, "count": len(data), "movies": data}), 200
    )


@app.route("/actors", methods=["POST"])
def add_actor():
    cur = mysql.connection.cursor()
    info = request.get_json()
    first_name = info["first_name"]
    last_name = info["last_name"]
    cur.execute(
        """ INSERT INTO actor (first_name, last_name) VALUE (%s, %s)""",
        (first_name, last_name),
    )
    mysql.connection.commit()
    print("row(s) affected :{}".format(cur.rowcount))
    rows_affected = cur.rowcount
    cur.close()
    return make_response(
        jsonify(
            {"message": "actor added successfully", "rows_affected": rows_affected}
        ),
        201,
    )


@app.route("/actors/<int:id>", methods=["PUT"])
def update_actor(id):
    cur = mysql.connection.cursor()
    info = request.get_json()
    first_name = info["first_name"]
    last_name = info["last_name"]
    cur.execute(
        """ UPDATE actor SET first_name = %s, last_name = %s WHERE actor_id = %s """,
        (first_name, last_name, id),
    )
    mysql.connection.commit()
    rows_affected = cur.rowcount
    cur.close()
    return make_response(
        jsonify(
            {"message": "actor updated successfully", "rows_affected": rows_affected}
        ),
        200,
    )


@app.route("/actors/<int:id>", methods=["DELETE"])
def delete_actor(id):
    cur = mysql.connection.cursor()
    cur.execute(""" DELETE FROM actor where actor_id = %s """, (id,))
    mysql.connection.commit()
    rows_affected = cur.rowcount
    cur.close()
    return make_response(
        jsonify(
            {"message": "actor deleted successfully", "rows_affected": rows_affected}
        ),
        200,
    )

@app.route("/actors/format", methods=["GET"])
def get_params():
    fmt = request.args.get('id')
    foo = request.args.get('aaaa')
    return make_response(jsonify({"format":fmt, "foo":foo}),200)

'''

if __name__ == "__main__":
    app.run(debug=True)
