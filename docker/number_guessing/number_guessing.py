import random

print("Welcome to the Number Guessing Game!")
number = random.randint(1, 100)
tries = 1

while True:
    guess = int(input("Guess a number between 1 and 100: "))
    if guess > number:
        print("Lower!")
    elif guess < number:
        print("Higher!")
    else:
        print(f"Congratulations, you guessed the correct number in {tries} tries!")
        break
    tries += 1
