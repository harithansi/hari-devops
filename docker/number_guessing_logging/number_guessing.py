import random
import logging

# Set up logging
logging.basicConfig(filename='logs/game.log', level=logging.INFO, format='%(asctime)s - %(message)s')

def main():
    logging.info('Starting a new game')
    number = random.randint(1, 10)
    attempts = 0

    while True:
        try:
            guess = int(input("Enter your guess (1-10): "))
            attempts += 1

            if guess == number:
                logging.info(f"User guessed the correct number {number} in {attempts} attempts")
                print(f"Congratulations! You guessed the number {number} in {attempts} attempts.")
                break
            elif guess < number:
                print("Higher!")
            else:
                print("Lower!")
        except ValueError:
            logging.warning('User entered an invalid input')
            print("Invalid input. Please enter an integer between 1 and 10.")

if __name__ == "__main__":
    main()
