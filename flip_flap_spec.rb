require 'minitest/autorun'

describe 'Serializer specs' do
  it 'should convert yml to tsv' do
    `ruby yml_to_tsv.rb data/survey.yml data/test.tsv`
    diff = `diff data/survey.tsv data/test.tsv`
    diff.must_equal ''
  end

  it 'should convert tsv to yml' do
    `ruby tsv_to_yml.rb data/survey.tsv data/test.yml`
    diff = `diff data/survey.yml data/test.yml`
    diff.must_equal ''
  end

  after do
    `rm data/test.* > /dev/null 2>&1`
  end
end
