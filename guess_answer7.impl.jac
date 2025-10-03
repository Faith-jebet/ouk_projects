impl QuestionAnswer.start {
    if not [root --> (`?question)] {
        question_data = get_random_question();
        next = root ++> question(
            question_text=question_data.get("question", "What is 2+2?"),
            correct_answer=question_data.get("answer", "4")
        );
    } else {
        next = [root --> (`?question)];
    }
    visit next;
}

impl QuestionAnswer.process_answer {
    if [-->] {
        visit [-->];
    } else {
        if self.answer.lower() == here.correct_answer.lower() {
            print("Correct! Well done.");
            print(give_feedback(self.answer, here.correct_answer));
            question_data = get_random_question();
            here ++> question(
                question_text=question_data.get("question", "What is 2+2?"),
                correct_answer=question_data.get("answer", "4")
            );
        } else {
            print(f"Incorrect. The correct answer is: {here.correct_answer}");
            print(f"Your answer was: {self.answer}");
            print(give_feedback(self.answer, here.correct_answer));
            question_data = get_random_question();
            here ++> question(
                question_text=question_data.get("question", "What is 2+2?"),
                correct_answer=question_data.get("answer", "4")
            );
        }
    }
}