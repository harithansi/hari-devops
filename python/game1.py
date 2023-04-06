import random
options = ['rock','paper','scissor']
while True:
    player_choice = input("Choose rock, paper,scissor \n").lower()
    computer_choice = random.choice(options)
    if computer_choice == player_choice:
        print("tie")
    elif computer_choice == 'rock' and player_choice == 'paper':
        print("you have won!")
    else:
        break