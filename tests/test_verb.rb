require 'minitest/autorun'
require_relative '../verb'

class TestVerb < Minitest::Test
  def test_present_conjugate_irregular
    v = Verb.new('sein')
    assert_equal(['ich bin',
                  'du bist',
                  'er,sie, es ist',
                  'wir sind',
                  'ihr seid',
                  'sie,Sie sind'],
                 v.present_conjugate,
    'Wrong conjugation for sein in present')

    v = Verb.new('haben')
    assert_equal(['ich habe',
                  'du hast',
                  'er,sie, es hat',
                  'wir haben',
                  'ihr habt',
                  'sie,Sie haben'],
                 v.present_conjugate,
                 'Wrong conjugation for haben in present')
  end

  def test_present_conjugate_regular

  end

end