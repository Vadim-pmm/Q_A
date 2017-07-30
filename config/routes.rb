Rails.application.routes.draw do

  root 'questions#index'
  # resources :questions, only: [:create]
  get 'export', to: 'questions#export'
  post 'import', to: 'questions#import'

  get 'mark_question_as_answered/:id', to: 'questions#mark_question_as_answered', as: 'mark_answered'
  get 'no_questions', to: 'questions#no_questions', as: 'no_questions'
  get 'toggle_language', to: 'questions#toggle_language', as: 'toggle_language'
  get 'get_question', to: 'questions#get_question', as: 'get_question'
  post 'send_message', to: 'questions#send_message', as: 'send_message'

end
