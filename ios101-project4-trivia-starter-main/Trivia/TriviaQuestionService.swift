//
//  TriviaQuestionService.swift
//  Trivia
//
//  Created by Aissatou Thiombane on 3/20/24.
//

import Foundation

class TriviaQuestionService {
    func fetchTriviaQuestions(completion: @escaping ([TriviaQuestion]?) -> Void) {
        let urlString = "https://opentdb.com/api.php?amount=10&type=multiple"
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            completion(nil)
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Error fetching data: \(error?.localizedDescription ?? "Unknown error")")
                completion(nil)
                return
            }

            do {
                let result = try JSONDecoder().decode(TriviaResponse.self, from: data)
                let questions = result.results.map { result -> TriviaQuestion in
                    TriviaQuestion(
                        category: result.category,
                        question: result.question,
                        correctAnswer: result.correct_answer,
                        incorrectAnswers: result.incorrect_answers
                    )
                }
                completion(questions)
            } catch {
                print("Error decoding JSON: \(error.localizedDescription)")
                completion(nil)
            }
        }

        task.resume()
    }
}


struct TriviaResponse: Decodable {
    let results: [TriviaResult]
}

struct TriviaResult: Decodable {
    let category: String
    let question: String
    let correct_answer: String
    let incorrect_answers: [String]
}

