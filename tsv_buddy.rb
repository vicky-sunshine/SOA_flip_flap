# Module that can be included (mixin) to create and parse TSV data
module TsvBuddy
  # @data should be a data structure that stores information
  #  from TSV or Yaml files. For example, it could be an Array of Hashes.
  attr_accessor :data

  # take_tsv: converts a String with TSV data into @data
  # parameter: tsv - a String in TSV format
  def take_tsv(tsv)
    lines = []
    tsv.each_line { |line| lines << line}

    # get keys
    keys = lines[0].chop.split("\t")
    # shift out the keys
    lines.shift

    # get values and put into yml stucture
    format_data = []
    lines.each do |line|
      element = {}
      values = line.chop.split("\t")
      keys.each_index { |index| element[keys[index]] = values[index] }
      format_data.push(element)
    end
    @data = format_data
  end

  # to_tsv: converts @data into tsv string
  # returns: String in TSV format
  def to_tsv
    format_string = ""
    keys = @data[0].keys
    format_string << keys[0]
    keys.shift
    keys.each { |key| format_string <<  "\t" + key}
    format_string << "\n"

    # print value
    @data.each do |element|
      # avoid "\t" at the tail of line
      format_string << element.values[0]
      element.shift
      element.each_value {|value| format_string << "\t" + value}
      format_string << "\n"
    end
    format_string
  end
end
