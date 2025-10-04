import from byllm.llm { Model }

# glob llm = Model(model_name="gpt-4o",verbose=False);
glob llm = Model(model_name="gemini/gemini-2.0-flash", verbose=False);

obj MyQuery {
    has query: str;
    has hint: str;
}

"""Provide a random word and a hint to be guessed"""
def provide_query -> MyQuery by llm;

walker GuessingGame {
    has correct_word: MyQuery = provide_query();
    
    can start with `root entry;
    def process_guess(guess: str);
}

node turn {
    has hint: str;
    can check with GuessingGame entry;
}

with entry {
    GuessingGame() spawn root;
}