class StringCalculator
    def add(input)
      return 0 if input.strip.empty?
  
      numbers = extract_numbers(input)
      check_for_negatives!(numbers)
  
      numbers.sum
    end
  
    private
  
    def extract_numbers(input)
      delimiter = /,|\n/
  
      if input.start_with?("//")
        delimiter_line, input = input.split("\n", 2)
        custom_delimiter = delimiter_line[2..]
        delimiter = Regexp.escape(custom_delimiter)
      end
  
      input.split(/#{delimiter}/).map(&:to_i)
    end
  
    def check_for_negatives!(numbers)
      negatives = numbers.select { |n| n < 0 }
      return if negatives.empty?
  
      raise "negative numbers not allowed: #{negatives.join(',')}"
    end
  end
