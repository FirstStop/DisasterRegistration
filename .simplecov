require 'codeclimate-test-reporter'
require 'coveralls'
require 'scrutinizer/ocular'
require 'scrutinizer/ocular/formatter'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
  Coveralls::SimpleCov::Formatter,
  SimpleCov::Formatter::HTMLFormatter,
  CodeClimate::TestReporter::Formatter,
  Scrutinizer::Ocular::UploadingFormatter
]