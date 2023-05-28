import time
import random
def MatrixRain(choice,letters, letter_count, row_count=0):
    if choice not in ['A','B','C','D']:
        choice = input("Unesite 'A' za matrix rain sa sljedećim znakovima: [| I l]"
                       "\nUnesite 'B' za matrix rain za sljedećim znakovima: [0 1 2 3 4 5 6 7 8 9] "
                       "\nUnesite 'C' za matrix rain sa sljedećim znakovima: [! @ # $ %  ^ & * () - _ + ={ } [ ] | ; ' : ']"
                       "\nUnesite 'D' za matrix rain sa sljedećim znakovima: [0 1]\nVaš odabir: ").strip().upper()
        return MatrixRain(choice,letters, letter_count, row_count)

    if choice == 'A':
        letters = " |       I     l   ' '"
    elif choice == 'B':
        letters = "0  1  2    3    4   5   6 7  8  9"
    elif choice == 'C':
        letters = "!    @      #     $ %      ^      &   * ()     - _ +  ={  }  [  ]  |  ; ' :   "
    elif choice == 'D':
        letters = "0                              1"    

    letter_count = len(letters)
    
    if row_count < 20:
        row = "".join([letters[random.randint(0, letter_count - 1)] for _ in range(200)])
        time.sleep(0.5)
        print("\033[32m{}\n".format(row), end="")
        with open("MatrixRain_Python.txt", "a") as file:
            file.write("{}\n".format(row))
        return MatrixRain(choice, letters, letter_count, row_count + 1)

MatrixRain("", "", 0)

