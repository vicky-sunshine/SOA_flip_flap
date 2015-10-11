module YamlBuddy
  # @data should be a data structure that stores information
  #  from yaml or Tsv files. For example, it could be an Array of Hashes.
  attr_accessor :data
  def take_yaml(yml)
    @data = YAML.load(yml)
  end

  def to_yaml
    @data.to_yaml
  end