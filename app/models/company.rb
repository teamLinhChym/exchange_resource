class Company < ApplicationRecord
  has_many :users

  searchkick settings: {
    index: {
      analysis: {
        analyzer: {
          exchange_analyzer: {
            type: "custom",
            filter: ["lowercase"],
            tokenizer: "exchange_tokenizer"
          }
        },
        tokenizer: {
          exchange_tokenizer: {
            type: "ngram",
            min_gram: "1",
            max_gram: "8",
            token_chars: %w(letter digit)
          }
        }
      }
    }
  },
  callbacks: false

  def search_data
    {
      name: name
    }
  end
end
