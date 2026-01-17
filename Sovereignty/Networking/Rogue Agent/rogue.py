import time
import os

pid = os.getpid()

print(f"I AM THE ROGUE AGENT. MY ID IS: {pid}")
print("I am now consuming resources... (Press Ctrl+Z to background me)")

counter = 0

while True:
    counter += 1
    time.sleep(1)
