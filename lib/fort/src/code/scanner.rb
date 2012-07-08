module Fort
  class Src
    class Code
      class Scanner
        require 'state_machine'
        require 'ruby_patch'
        extend ::RubyPatch::AutoLoad

        CHAR_KIND = {
          '!' => :comment_mark,
          "\n" => :newline,
          "'" => :single_quote,
          '"' => :double_quote,
        }
        CHAR_KIND.default = :normal_char

        state_machine initial: :normal do

          # Transitions from :normal
          event :comment_mark do
            transition normal: :start_comment
          end

          event :single_quote do
            transition normal: :start_single_quote_string
          end

          event :double_quote do
            transition normal: :start_double_quote_string
          end

          # Transitions from :start_comment
          event :normal_char, :comment_mark, :single_quote, :double_quote do
            transition start_comment: :comment
          end

          event :newline do
            transition start_comment: :end_comment
          end

          # Transitions from :comment
          event :newline do
            transition comment: :end_comment
          end

          # Transitions from :end_comment
          event :normal_char, :newline do
            transition end_comment: :normal
          end

          event :comment_mark do
            transition end_comment: :start_comment
          end

          event :single_quote do
            transition end_comment: :start_single_quote_string
          end

          event :double_quote do
            transition end_comment: :start_double_quote_string
          end

          # Transitions from :start_single_quote_string
          event :normal_char, :comment_mark, :newline, :double_quote do
            transition start_single_quote_string: :single_quote_string
          end

          event :single_quote do
            transition start_single_quote_string: :end_single_quote_string
          end

          # Transitions from :single_quote_string
          event :single_quote do
            transition single_quote_string: :end_single_quote_string
          end

          # Transitions from :end_single_quote_string
          event :normal_char, :newline do
            transition end_single_quote_string: :normal
          end

          event :comment_mark do
            transition end_single_quote_string: :start_comment
          end

          event :single_quote do
            transition end_single_quote_string: :start_single_quote_string
          end

          event :double_quote do
            transition end_single_quote_string: :start_double_quote_string
          end

          # Transitions from :start_double_quote_string
          event :normal_char, :comment_mark, :newline, :double_quote do
            transition start_double_quote_string: :double_quote_string
          end

          event :double_quote do
            transition start_double_quote_string: :end_double_quote_string
          end

          # Transitions from :double_quote_string
          event :double_quote do
            transition double_quote_string: :end_double_quote_string
          end

          # Transitions from :end_double_quote_string
          event :normal_char, :newline do
            transition end_double_quote_string: :normal
          end

          event :comment_mark do
            transition end_double_quote_string: :start_comment
          end

          event :single_quote do
            transition end_double_quote_string: :start_single_quote_string
          end

          event :double_quote do
            transition end_double_quote_string: :start_double_quote_string
          end
        end

        # Generate state transition graph file to the Dir.pwd.
        def self.draw_state_transition_graph(format = 'pdf')
          ::StateMachine::Machine.draw(self.to_s, path: Dir.pwd, format: format)
        end
      end
    end
  end
end
