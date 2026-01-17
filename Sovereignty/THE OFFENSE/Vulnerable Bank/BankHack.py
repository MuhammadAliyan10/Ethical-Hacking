import sqlite3


def login():
    conn = sqlite3.connect(":memory:")
    cursor = conn.cursor()

    cursor.execute("CREATE TABLE users (username TEXT, password TEXT)")

    cursor.execute(
        "INSERT INTO users (username, password) VALUES ('admin', 'RonaldoIsGoat')"
    )

    print("-" * 50)
    print("      STATE BANK OF PYTHON - SECURE LOGIN      ")
    print("-" * 50)

    userInput = input("Enter your username: ")

    query = f"SELECT * FROM users WHERE username = '{userInput}'"

    print(f"\n[DEBUG] EXECUTING QUERY: {query}\n")

    try:
        cursor.execute(query)
        result = cursor.fetchone()

        if result:
            print(f"[SUCCESS] LOGGED IN AS: {result[0]}")
            print(f"[SECRET] The Password is: {result[1]}")
        else:
            print("[ERROR] Login Failed.")

    except Exception as e:
        print(f"[CRITICAL ERROR] Database crashed: {e}")


login()
