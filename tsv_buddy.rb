# Module that can be included (mixin) to create and parse TSV data
module TsvBuddy
  # @data should be a data structure that stores information
  #  from TSV or Yaml files. For example, it could be an Array of Hashes.
  attr_accessor :data

  # take_tsv: converts a String with TSV data into @data
  # parameter: tsv - a String in TSV format
  def take_tsv(tsv)
    @data ||= []
    keys = []
    tsv.each_line.with_index do |line, index|
      if index == 0
        # get keys
        keys = line.chop.split("\t")
      else
        # get values and put into yml stucture
        @data << Hash[keys.zip line.chop.split("\t")]
      end
    end
  end

  # to_tsv: converts @data into tsv string
  # returns: String in TSV format
  def to_tsv
    # a: accumlator, e: next element, tail has no "\t
    # assign keys as headers first
    format_string = @data[0].keys.reduce { |a, e| "#{a}\t#{e}" }
    @data.each do |element|
      # avoid "\t" at the tail of line
      format_string << "\n#{element.values.reduce { |a, e| "#{a}\t#{e}" }}"
    end
    format_string << "\n"
  end
end
