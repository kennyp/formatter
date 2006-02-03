module Format
  class Source
    attr_reader :data
    @@comment_str = "--::Comment::--"
    @@quote_str   = "--::Quote::--"
    def initialize(file)
      @data = File.open("#{file}").read
    end
    def pull_comments_and_quotes(comment_regex, quote_regex)
      @comments = self.pull_comment_quote(@@comment_str, comment_regex)
      @quotes   = self.pull_comment_quote(@@quote_str, quote_regex)
    end
    def place_comments_and_quotes
      place_comment_quote(@@comment_str, @comments)
      place_comment_quote(@@quote_str, @quotes)
    end
    def pull_comment_quote(holder, regex)
      store = @data.scan(regex)
      @data.gsub!(regex, holder)
      store
    end
    def place_comment_quote(holder, array)
      while array.length > 0
        @data.sub!(holder, array[0])
        array.shift
      end
    end
  end
end