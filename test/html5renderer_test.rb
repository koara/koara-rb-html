require 'koara'
require 'koara/html/html5renderer'
require 'minitest/autorun'

class Html5RendererTest < MiniTest::Unit::TestCase

  def setup
    parser = Koara::Parser.new
    @document = parser.parse('Test')
    @renderer = Koara::Html::Html5Renderer.new()
  end

  def test_basic
    @document.accept(@renderer)
    assert_equal("<p>Test</p>", @renderer.output)
  end

  def test_no_partial_result
    expected = "<!DOCTYPE html>\n"
    expected << "<html>\n";
    expected << "  <body>\n";
    expected << "    <p>Test</p>\n";
    expected << "  </body>\n";
    expected << "</html>\n";

    @renderer.partial = false;
    @document.accept(@renderer)
    assert_equal(expected, @renderer.output)
  end

end