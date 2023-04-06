import random

def is_integer(value):
    try:
        int(value)
        return True
    except ValueError:
        return False

def main():
    print("Welcome to the Number Guessing Game!")
    print("I'm thinking of a number between 1 and 100.")
    
    target_number = random.randint(1, 100)
    attempts = 0
    
    while True:
        user_input = input("Enter your guess: ")
        
        if not is_integer(user_input):
            print("Please enter a valid integer.")
            continue
        
        guess = int(user_input)
        attempts += 1
        
        if guess < target_number:
            print("Too low! Try again.")
        elif guess > target_number:
            print("Too high! Try again.")
        else:
            print(f"Congratulations! You guessed the number in {attempts} attempts.")
            break

if __name__ == "__main__":
    main()