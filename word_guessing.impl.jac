impl turn.check {
    guess = input(f"Guess the correct word. HINT: {self.hint}: ");
    visitor.process_guess(guess);
    visit [-->];
}

impl GuessingGame.start {
    end = root;
    
    for i = 0 to i < 10 by i += 1 {
        end ++> (end := turn(self.correct_word.hint));
    }
    visit [-->];
}

impl GuessingGame.process_guess(guess: str) {
    if guess != self.correct_word.query {
        print("Wrong");
    } else {
        print("Congratulations! You guessed correctly.");
        disengage;
    }
}