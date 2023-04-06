import random

def main():
    words_and_hints = {
        "apple": "A fruit that keeps the doctor away.",
        "banana": "A fruit that is yellow and has a curve.",
        "elephant": "A large mammal with a long trunk.",
        "python": "A popular programming language.",
        "ocean": "A vast body of saltwater covering most of the Earth's surface.",
        "coffee": "A popular beverage made from beans."
    }

    word_list = list(words_and_hints.keys())

    print("Welcome to the Word Guessing Game!")
    print("I will give you a hint, and you need to guess the word.")

    target_word = random.choice(word_list)
    hint = words_and_hints[target_word]
    attempts = 0

    while True:
        print(f"\nHint: {hint}")
        user_input = input("Enter your guess: ")

        attempts += 1

        if user_input.lower() == target_word.lower():
            print(f"Congratulations! You guessed the word in {attempts} attempts.")
            break
        else:
            print("Incorrect! Try again.")

if __name__ == "__main__":
    main()
