"""A Question Answering Game"""

import random;
import from byllm.llm { Model }

glob llm = Model(model_name="gemini/gemini-2.0-flash", verbose=False);

"""Generate a random trivia question with answer"""
def get_random_question() -> dict {
    return {
        "question": "What is the capital of France?",
        "answer": "Paris"
    };
}

"""Provide encouraging feedback for incorrect answers"""
def give_feedback(user_answer: str, correct_answer: str) -> str {
    return f"Good try! The correct answer was {correct_answer}, but you answered {user_answer}.";
}

walker QuestionAnswer {
    has answer: str;

    can start with `root entry;
    can process_answer with question entry;
}

node question {
    has question_text: str = "What is 2+2?";
    has correct_answer: str = "4";
}

with entry:__main__ {
    root spawn QuestionAnswer(answer="Hello");
    root spawn QuestionAnswer(answer="World!");
    root spawn QuestionAnswer(answer="4");
    root spawn QuestionAnswer(answer="Abcadabra");
}