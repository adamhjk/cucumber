module Cucumber
  module AnsiColours
    # http://www.bluesock.org/~willg/dev/ansi.html
    ANSI_COLORS = {
      :red     => "\e[31m",
      :green   => "\e[32m",
      :yellow  => "\e[33m",
      :blue    => "\e[34m",
      :magenta => "\e[35m",
    }
    ANSI_NEUTRAL = "\e[0m"

    if ENV['LSCOLORS'] # TODO: look up how this works
      require 'win32console' if PLATFORM == 'i386-mswin32'
      ANSI_COLORS.each do |c,a|
        define_method(c) do |s|
          "#{a}#{s}#{ANSI_NEUTRAL}"
        end
      end
    else
      ANSI_COLORS.each do |c,a|
        define_method(c) do |s|
          s
        end
      end
    end
  end
end